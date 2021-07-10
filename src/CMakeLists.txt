find_path(DETOURS_INCLUDE_DIR detours/detours.h)
include_directories(${DETOURS_INCLUDE_DIR})

find_library(DETOURS_LIBRARY detours.lib)
link_libraries(${DETOURS_LIBRARY})

find_package(simdjson)

add_library(trcbld64 SHARED trcbld.cpp)
set_target_properties(trcbld64 PROPERTIES
    LINK_FLAGS /EXPORT:DetourFinishHelperProcess,@1,NONAME
    CXX_STANDARD 17
    MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
target_link_libraries(trcbld64 PRIVATE simdjson::simdjson)

add_executable(tracebld tracebld.cpp tracebld.h)

install(TARGETS trcbld64 tracebld)