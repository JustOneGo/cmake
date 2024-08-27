# FindLibgpiod.cmake
find_path(LIBGPIOD_INCLUDE_DIR gpiod.h)
find_library(LIBGPIOD_LIBRARY NAMES gpiod)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Libgpiod DEFAULT_MSG LIBGPIOD_LIBRARY LIBGPIOD_INCLUDE_DIR)

if(LIBGPIOD_FOUND AND NOT TARGET Libgpiod::Libgpiod)M
  add_library(Libgpiod::Libgpiod UNKNOWN IMPORTED)
  set_target_properties(Libgpiod::Libgpiod PROPERTIES
    IMPORTED_LOCATION "${LIBGPIOD_LIBRARY}"
    INTERFACE_INCLUDE_DIRECTORIES "${LIBGPIOD_INCLUDE_DIR}"
  )
endif()

mark_as_advanced(LIBGPIOD_INCLUDE_DIR LIBGPIOD_LIBRARY)
 
