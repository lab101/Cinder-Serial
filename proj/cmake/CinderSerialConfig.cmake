if( NOT TARGET poScene )
	get_filename_component( CINDERSERIAL_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )
	get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )

	
	list( APPEND CINDERSERIAL_SOURCES
		${CINDERSERIAL_SOURCE_PATH}/src/SerialDevice.cpp
		${CINDERSERIAL_SOURCE_PATH}/lib/serial/src/serial.cc
		${CINDERSERIAL_SOURCE_PATH}/lib/serial/src/impl/win.cc
		${CINDERSERIAL_SOURCE_PATH}/lib/serial/src/impl/list_ports/list_ports_win.cc
	)
	
	add_library( CinderSerial ${CINDERSERIAL_SOURCES})


	target_include_directories( CinderSerial PUBLIC "${CINDERSERIAL_SOURCE_PATH}/lib/serial/include" )
	target_include_directories( CinderSerial PUBLIC "${CINDERSERIAL_SOURCE_PATH}/include" )
	target_include_directories( CinderSerial SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )

	if( NOT TARGET cinder )
		    include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
		    find_package( cinder REQUIRED PATHS
		        "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
		        "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
	endif()
	target_link_libraries(CinderSerial PRIVATE cinder )
	
endif()



