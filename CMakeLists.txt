cmake_minimum_required(VERSION 3.19)
project(cuda_practice LANGUAGES CUDA CXX)
set(CMAKE_CUDA_STANDARD 14)
set(CMAKE_CXX_STANDARD 14)
#set(CMAKE_CUDA_HOST_COMPILER "${CMAKE_CXX_COMPILER}")
#set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -ccbin ${CMAKE_CXX_COMPILER}")
message("${CMAKE_CXX_COMPILER}")
message("${CMAKE_CUDA_FLAGS} -ccbin ${CMAKE_CXX_COMPILER}")
# CUDA
find_package(CUDA 10.1 REQUIRED)
message("CUDA_LIBRARIES:${CUDA_LIBRARIES}")
message("CUDA_INCLUDE:${CUDA_INCLUDE_DIRS}")

# OpenGL
find_package(GLUT REQUIRED)
message(${GLUT_INCLUDE_DIR})
message(${GLUT_LIBRARY})

find_package(OpenGL REQUIRED)
include_directories(${OPENGL_INCLUDE_DIR} /usr/include/GL)

#link_directories(${OPENGL_LIBRARY})
message(${OPENGL_LIBRARIES})
message(${OPENGL_INCLUDE_DIR})

#include_directories(${CUDA_INCLUDE_DIRS})

# OpenMP
#FIND_PACKAGE(OpenMP REQUIRED)
#if (OPENMP_FOUND)
#    message("OPENMP FOUND")
#    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
#    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
#    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
#endif ()

# IPC
#FIND_PACKAGE(MPI_CXX REQUIRED)
#if (MPI_FOUND)
#    message("MPI FOUND")
#endif ()

add_executable(cuda_practice
        #        main.cu
        #        0_Simple/clock_nvrtc/clock.cpp
        #        0_Simple/asyncAPI/asyncAPI.cu
        #        0_Simple/cdpSimplePrint/cdpSimplePrint.cu
        #        0_Simple/clock/clock.cu
        #        0_Simple/clock_nvrtc/clock_kernel.cu
        #        0_Simple/clock_nvrtc/clock.cpp
        #        0_Simple/cppIntegration/cppIntegration.cu
        #        0_Simple/cppIntegration/cppIntegration_gold.cpp
        #        0_Simple/cppIntegration/main.cpp
        #        0_Simple/cppOverload/cppOverload.cu
        #        0_Simple/cppOverload/cppOverload_kernel.cuh
        #                0_Simple/cudaOpenMP/cudaOpenMP.cu
        #        0_Simple/cudaTensorCoreGemm/cudaTensorCoreGemm.cu
        #        0_Simple/fp16ScalarProduct/fp16ScalarProduct.cu
        #        0_Simple/inlinePTX/inlinePTX.cu
        #                0_Simple/matrixMul/matrixMul.cu
        #        0_Simple/matrixMulCUBLAS/matrixMulCUBLAS.cpp
        #        0_Simple/simpleAssert/simpleAssert.cu
        #        0_Simple/simpleAtomicIntrinsics/simpleAtomicIntrinsics.cu
        #        0_Simple/simpleAtomicIntrinsics/simpleAtomicIntrinsics_cpu.cpp
        #        0_Simple/simpleAtomicIntrinsics/simpleAtomicIntrinsics_kernel.cuh
        #        0_Simple/simpleCallback/multithreading.cpp
        #        0_Simple/simpleCallback/multithreading.h
        #        0_Simple/simpleCallback/simpleCallback.cu
        #        0_Simple/simpleCooperativeGroups/simpleCooperativeGroups.cu
        #        0_Simple/simpleCubemapTexture/simpleCubemapTexture.cu
        #        0_Simple/simpleCudaGraphs/simpleCudaGraphs.cu
        #        0_Simple/simpleLayeredTexture/simpleLayeredTexture.cu
        #        0_Simple/simpleMultiGPU/simpleMultiGPU.cu
        #        0_Simple/simpleMultiGPU/simpleMultiGPU.h
        #        0_Simple/simpleOccupancRy/simpleOccupancy.cu
        #        0_Simple/simpleP2P/simpleP2P.cu
        #        0_Simple/simplePitchLinearTexture/simplePitchLinearTexture.cu
        #        0_Simple/simplePrintf/simplePrintf.cu
        #        0_Simple/simpleSeparateCompilation/simpleDeviceLibrary.cu
        #        0_Simple/simpleSeparateCompilation/simpleDeviceLibrary.cuh
        #        0_Simple/simpleSeparateCompilation/simpleSeparateCompilation.cu
        #        0_Simple/simpleStreams/simpleStreams.cu
        #        0_Simple/simpleSurfaceWrite/simpleSurfaceWrite.cu
        #        0_Simple/simpleTemplates/simpleTemplates.cu
        #        0_Simple/simpleTexture/simpleTexture.cu
        #        0_Simple/simpleVoteIntrinsics/simpleVote_kernel.cuh
        #        0_Simple/simpleVoteIntrinsics/simpleVoteIntrinsics.cu
        #        0_Simple/simpleZeroCopy/simpleZeroCopy.cu
        #        0_Simple/systemWideAtomics/systemWideAtomics.cu
        #        0_Simple/template/template.cu
        #        0_Simple/template/template_cpu.cpp
        #        0_Simple/UnifiedMemoryStreams/UnifiedMemoryStreams.cu
        #        1_Utilities/bandwidthTest/bandwidthTest.cu
        #        1_Utilities/deviceQuery/deviceQuery.cpp
        #        1_Utilities/deviceQueryDrv/deviceQueryDrv.cpp
        #        1_Utilities/p2pBandwidthLatencyTest/p2pBandwidthLatencyTest.cu
        #        1_Utilities/topologyQuery/topologyQuery.cu
        3_Imaging/bicubicTexture/bicubicTexture.cpp
        3_Imaging/bicubicTexture/bicubicTexture_cuda.cu
        3_Imaging/bicubicTexture/bicubicTexture_kernel.cuh
        )
set_property(TARGET cuda_practice PROPERTY CUDA_ARCHITECTURES 61)
target_include_directories(cuda_practice PUBLIC
        /work/cpp_project/samples/common/inc
        ${CUDA_INCLUDE_DIRS})
set(CUDA_NVCC_FLAGS -G;-g)
target_link_libraries(cuda_practice ${CUDA_LIBRARIES}
        -lcublas
        -lcuda
        ${OPENGL_LIBRARIES}
        ${GLUT_LIBRARY}
        /usr//lib/x86_64-linux-gnu/libGL.so
#        -lGL -lGLU
#        GL GLU glfw3 X11
        #        ${OpenMP_CXX_LIBRARIES} # OpenMP
        )    # linking CUBLAS library -lcublas

set_target_properties(
        cuda_practice
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)
