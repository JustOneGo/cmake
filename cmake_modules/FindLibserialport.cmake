# FindLibserialport.cmake
find_path(LIBSERIALPORT_INCLUDE_DIR
    libserialport.h)
find_library(LIBSERIALPORT_LIBRARY
    NAMES serialport)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Libserialport
    DEFAULT_MSG
    LIBSERIALPORT_LIBRARY
    LIBSERIALPORT_INCLUDE_DIR)

if(LIBSERIALPORT_FOUND AND NOT TARGET Libserialport::Libserialport)
    add_library(Libserialport::Libserialport UNKNOWN IMPORTED)
    set_target_properties(Libserialport::Libserialport PROPERTIES
        IMPORTED_LOCATION "${LIBSERIALPORT_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${LIBSERIALPORT_INCLUDE_DIR}"
    )
endif()

mark_as_advanced(LIBSERIALPORT_INCLUDE_DIR
    LIBSERIALPORT_LIBRARY)
