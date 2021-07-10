find_path(DETOURS_INCLUDE_DIR detours/detours.h)
include_directories(${DETOURS_INCLUDE_DIR})

find_library(DETOURS_LIBRARY detours.lib)
link_libraries(${DETOURS_LIBRARY})

add_library(trcbld64 SHARED trcbld.cpp)
set_target_properties(trcbld64 PROPERTIES LINK_FLAGS /EXPORT:DetourFinishHelperProcess,@1,NONAME)

add_executable(tracebld tracebld.cpp tracebld.h)