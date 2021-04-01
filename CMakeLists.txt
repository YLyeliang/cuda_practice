cmake_minimum_required(VERSION 3.17)

project(cuda_programming_guide CUDA)
set(CMAKE_CUDA_STANDARD 14)

#find_package(CUDA REQUIRED)
message("CUDA_LIBRARIES:${CUDA_LIBRARIES}")
message("CUDA_INCLUDE_DIRS:${CUDA_INCLUDE_DIRS}")


add_executable(cuda_programming_guide main.cu)

set_target_properties(
        cuda_programming_guide
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)