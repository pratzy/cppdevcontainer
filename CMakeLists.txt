
cmake_minimum_required(VERSION 3.1)


project("test1")

add_executable(hello hello.cpp)

option(ARROW_LINK_SHARED "Link to the Arrow shared library" ON)

find_package(Arrow REQUIRED)

if(NOT DEFINED CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()

# We require a C++17 compliant compiler
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT DEFINED CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

message(STATUS "Arrow version: ${ARROW_VERSION}")
message(STATUS "Arrow SO version: ${ARROW_FULL_SO_VERSION}")


add_executable(arrow-example arrow-example.cc)
if(ARROW_LINK_SHARED)
  target_link_libraries(arrow-example PRIVATE Arrow::arrow_shared)
else()
  target_link_libraries(arrow-example PRIVATE Arrow::arrow_static)
endif()