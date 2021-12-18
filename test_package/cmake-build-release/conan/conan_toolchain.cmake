

# Conan automatically generated toolchain file
# DO NOT EDIT MANUALLY, it will be overwritten

# Avoid including toolchain file several times (bad if appending to variables like
#   CMAKE_CXX_FLAGS. See https://github.com/android/ndk/issues/323
include_guard()

if(CMAKE_TOOLCHAIN_FILE)
    message("Using Conan toolchain: ${CMAKE_TOOLCHAIN_FILE}.")
endif()





set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build." FORCE)


set(CONAN_CXX_FLAGS "${CONAN_CXX_FLAGS} -m64")
set(CONAN_C_FLAGS "${CONAN_C_FLAGS} -m64")
set(CONAN_SHARED_LINKER_FLAGS "${CONAN_SHARED_LINKER_FLAGS} -m64")
set(CONAN_EXE_LINKER_FLAGS "${CONAN_EXE_LINKER_FLAGS} -m64")

add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)


set(CMAKE_CXX_FLAGS_INIT "${CMAKE_CXX_FLAGS_INIT} ${CONAN_CXX_FLAGS}")
set(CMAKE_C_FLAGS_INIT "${CMAKE_C_FLAGS_INIT} ${CONAN_C_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "${CMAKE_SHARED_LINKER_FLAGS_INIT} ${CONAN_SHARED_LINKER_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_INIT "${CMAKE_EXE_LINKER_FLAGS_INIT} ${CONAN_EXE_LINKER_FLAGS}")

get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(_CMAKE_IN_TRY_COMPILE)
    message(STATUS "Running toolchain IN_TRY_COMPILE")
    return()
endif()

set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ON)
# To support the generators based on find_package()
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR} "/home/somedevfox/.conan/data/libnsgif/1.0/demo/testing/package/82ef5eac51c38971dea2fd342dd55ddf2ddfbbc3/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR} "/home/somedevfox/.conan/data/libnsgif/1.0/demo/testing/package/82ef5eac51c38971dea2fd342dd55ddf2ddfbbc3/" ${CMAKE_PREFIX_PATH})

# To support cross building to iOS, watchOS and tvOS where CMake looks for config files
# only in the system frameworks unless you declare the XXX_DIR variables




# Variables
# Variables  per configuration


# Preprocessor definitions
# Preprocessor definitions per configuration
