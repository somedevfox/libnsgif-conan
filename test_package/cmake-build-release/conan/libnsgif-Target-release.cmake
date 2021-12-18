########### VARIABLES #######################################################################
#############################################################################################

set(libnsgif_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${libnsgif_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${libnsgif_COMPILE_OPTIONS_C_RELEASE}>")

set(libnsgif_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${libnsgif_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${libnsgif_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${libnsgif_EXE_LINK_FLAGS_RELEASE}>")

set(libnsgif_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(libnsgif_FRAMEWORKS_FOUND_RELEASE "${libnsgif_FRAMEWORKS_RELEASE}" "${libnsgif_FRAMEWORK_DIRS_RELEASE}")

# Gather all the libraries that should be linked to the targets (do not touch existing variables)
set(_libnsgif_DEPENDENCIES_RELEASE "${libnsgif_FRAMEWORKS_FOUND_RELEASE} ${libnsgif_SYSTEM_LIBS_RELEASE} ")

set(libnsgif_LIBRARIES_TARGETS_RELEASE "") # Will be filled later
set(libnsgif_LIBRARIES_RELEASE "") # Will be filled later
conan_package_library_targets("${libnsgif_LIBS_RELEASE}"    # libraries
                              "${libnsgif_LIB_DIRS_RELEASE}" # package_libdir
                              "${_libnsgif_DEPENDENCIES_RELEASE}" # deps
                              libnsgif_LIBRARIES_RELEASE   # out_libraries
                              libnsgif_LIBRARIES_TARGETS_RELEASE  # out_libraries_targets
                              "_RELEASE"  # config_suffix
                              "libnsgif")    # package_name

foreach(_FRAMEWORK ${libnsgif_FRAMEWORKS_FOUND_RELEASE})
    list(APPEND libnsgif_LIBRARIES_TARGETS_RELEASE ${_FRAMEWORK})
    list(APPEND libnsgif_LIBRARIES_RELEASE ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${libnsgif_SYSTEM_LIBS_RELEASE})
    list(APPEND libnsgif_LIBRARIES_TARGETS_RELEASE ${_SYSTEM_LIB})
    list(APPEND libnsgif_LIBRARIES_RELEASE ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(libnsgif_LIBRARIES_TARGETS_RELEASE "${libnsgif_LIBRARIES_TARGETS_RELEASE};")
set(libnsgif_LIBRARIES_RELEASE "${libnsgif_LIBRARIES_RELEASE};")

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${libnsgif_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH ${libnsgif_BUILD_DIRS_RELEASE} ${CMAKE_PREFIX_PATH})


########## GLOBAL TARGET PROPERTIES Release ########################################
set_property(TARGET libnsgif::libnsgif
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${libnsgif_LIBRARIES_TARGETS_RELEASE}
                                           ${libnsgif_OBJECTS_RELEASE}> APPEND)
set_property(TARGET libnsgif::libnsgif
             PROPERTY INTERFACE_LINK_OPTIONS
             $<$<CONFIG:Release>:${libnsgif_LINKER_FLAGS_RELEASE}> APPEND)
set_property(TARGET libnsgif::libnsgif
             PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Release>:${libnsgif_INCLUDE_DIRS_RELEASE}> APPEND)
set_property(TARGET libnsgif::libnsgif
             PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Release>:${libnsgif_COMPILE_DEFINITIONS_RELEASE}> APPEND)
set_property(TARGET libnsgif::libnsgif
             PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Release>:${libnsgif_COMPILE_OPTIONS_RELEASE}> APPEND)

########## COMPONENTS TARGET PROPERTIES Release ########################################