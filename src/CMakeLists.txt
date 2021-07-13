find_path(DETOURS_INCLUDE_DIR detours/detours.h)
include_directories(${DETOURS_INCLUDE_DIR})

find_library(DETOURS_LIBRARY detours.lib)
link_libraries(${DETOURS_LIBRARY})

find_package(simdjson)

if(CMAKE_SIZEOF_VOID_P STREQUAL 8)
    set(BITNESS 64)
else()
    set(BITNESS 32)
endif()

add_library("shroudlib${BITNESS}" SHARED shroudlib.cpp)
set_target_properties("shroudlib${BITNESS}" PROPERTIES
    LINK_FLAGS /EXPORT:DetourFinishHelperProcess,@1,NONAME
    CXX_STANDARD 17
    MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
target_link_libraries("shroudlib${BITNESS}" PRIVATE simdjson::simdjson)

add_executable("shroud${BITNESS}" shroud.cpp shroud.h)

install(TARGETS "shroud${BITNESS}" "shroudlib${BITNESS}")

if(BITNESS STREQUAL 64)
    set(X86PATH "../out/build/x86-$<$<CONFIG:Debug>:debug>$<$<CONFIG:Release>:release>/src")
    install(FILES "${X86PATH}/shroud32.exe" "${X86PATH}/shroudlib32.dll" TYPE BIN)
endif()