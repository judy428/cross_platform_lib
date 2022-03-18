# Generated by Boost 1.77.0

# address-model=64

if(CMAKE_SIZEOF_VOID_P EQUAL 4)
  _BOOST_SKIPPED("libboost_numpy27.so.1.77.0" "64 bit, need 32")
  return()
endif()

# python=2.7

if(Boost_PYTHON_VERSION)
  string(REGEX REPLACE "([0-9]+[.][0-9]+)([.].*)?" "\\1" __boost_pyver ${Boost_PYTHON_VERSION})
  if(NOT __boost_pyver VERSION_EQUAL "2.7")
    _BOOST_SKIPPED("libboost_numpy27.so.1.77.0" "2.7, Boost_PYTHON_VERSION=${Boost_PYTHON_VERSION}")
    return()
  endif()
endif()

if(Boost_PYTHON_VERSION_MAJOR)
  if(NOT "2.7" MATCHES "^${Boost_PYTHON_VERSION_MAJOR}[.]")
    _BOOST_SKIPPED("libboost_numpy27.so.1.77.0" "2.7, Boost_PYTHON_VERSION_MAJOR=${Boost_PYTHON_VERSION_MAJOR}")
    return()
  endif()
endif()

# layout=system

# toolset=gcc9

# link=shared

if(DEFINED Boost_USE_STATIC_LIBS)
  if(Boost_USE_STATIC_LIBS)
    _BOOST_SKIPPED("libboost_numpy27.so.1.77.0" "shared, Boost_USE_STATIC_LIBS=${Boost_USE_STATIC_LIBS}")
    return()
  endif()
else()
  if(WIN32 AND NOT _BOOST_SINGLE_VARIANT)
    _BOOST_SKIPPED("libboost_numpy27.so.1.77.0" "shared, default on Windows is static, set Boost_USE_STATIC_LIBS=OFF to override")
    return()
  endif()
endif()

# runtime-link=shared

if(Boost_USE_STATIC_RUNTIME)
  _BOOST_SKIPPED("libboost_numpy27.so.1.77.0" "shared runtime, Boost_USE_STATIC_RUNTIME=${Boost_USE_STATIC_RUNTIME}")
  return()
endif()

# runtime-debugging=off

if(Boost_USE_DEBUG_RUNTIME)
  _BOOST_SKIPPED("libboost_numpy27.so.1.77.0" "release runtime, Boost_USE_DEBUG_RUNTIME=${Boost_USE_DEBUG_RUNTIME}")
  return()
endif()

# threading=multi

# variant=release

if(NOT "${Boost_USE_RELEASE_LIBS}" STREQUAL "" AND NOT Boost_USE_RELEASE_LIBS)
  _BOOST_SKIPPED("libboost_numpy27.so.1.77.0" "release, Boost_USE_RELEASE_LIBS=${Boost_USE_RELEASE_LIBS}")
  return()
endif()

if(Boost_VERBOSE OR Boost_DEBUG)
  message(STATUS "  [x] libboost_numpy27.so.1.77.0")
endif()

if(NOT Boost_PYTHON_VERSION)
  if(Boost_DEBUG)
    message(STATUS "  Setting Boost_PYTHON_VERSION to 2.7")
  endif()
  set(Boost_PYTHON_VERSION "2.7")
endif()

# Create imported target Boost::numpy

if(NOT TARGET Boost::numpy)
  add_library(Boost::numpy SHARED IMPORTED)

  set_target_properties(Boost::numpy PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${_BOOST_INCLUDEDIR}"
    INTERFACE_COMPILE_DEFINITIONS "BOOST_ALL_NO_LIB"
  )
endif()

# Target file name: libboost_numpy27.so.1.77.0

get_target_property(__boost_imploc Boost::numpy IMPORTED_LOCATION_RELEASE)
if(__boost_imploc)
  message(SEND_ERROR "Target Boost::numpy already has an imported location '${__boost_imploc}', which is being overwritten with '${_BOOST_LIBDIR}/libboost_numpy27.so.1.77.0'")
endif()
unset(__boost_imploc)

set_property(TARGET Boost::numpy APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)

set_target_properties(Boost::numpy PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE CXX
  IMPORTED_LOCATION_RELEASE "${_BOOST_LIBDIR}/libboost_numpy27.so.1.77.0"
  )

set_target_properties(Boost::numpy PROPERTIES
  MAP_IMPORTED_CONFIG_MINSIZEREL Release
  MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
  )

set_property(TARGET Boost::numpy APPEND
  PROPERTY INTERFACE_COMPILE_DEFINITIONS "BOOST_NUMPY_DYN_LINK"
  )

list(APPEND _BOOST_NUMPY_DEPS python headers)
