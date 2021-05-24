//
// Created by fiberhome on 2021/4/7.
//
#include "cuda_runtime.h"
#include "iostream"

//  __device__  __constant__  __shared__
extern __shared__ float shared[];

// dynamically
extern __shared__ float array[];

__device__ void func()      // __device__ or __global__ function
{
    short *array0 = (short *) array;
    float *array1 = (float *) &array0[128];
    int *array2 = (int *) &array1[64];
}

// Alignment requirement
__device__ void func2()      // __device__ or __global__ function
{
    short *array0 = (short *) array;
    float *array1 = (float *) &array0[127]; // not aligned to 4 bytes, this doesn't work
}


int main() {
    short array0[128];
    float array1[64];
    int array2[256];


}
