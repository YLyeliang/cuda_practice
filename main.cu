#include <iostream>
#include "cuda_runtime.h"
#include "cuda_runtime_api.h"

using namespace std;

static void HandleError(cudaError_t err,
                        const char *file,
                        int line) {
    if (err != cudaSuccess) {
        printf("%s in %s at line %d\n", cudaGetErrorString(err),
               file, line);
        exit(EXIT_FAILURE);
    }
}

#define HANDLE_ERROR(err) (HandleError( err, __FILE__, __LINE__ ))

__global__ void add(int a, int b, int *c) {
    *c = a + b;
}

int main() {
    int count;
    HANDLE_ERROR(cudaGetDeviceCount(&count));

    cout << "Found " << count << " device(s)" << endl;

    for (int i = 0; i < count; ++i) {
        cudaDeviceProp prop;

        HANDLE_ERROR(cudaGetDeviceProperties(&prop, i));
        cout << "Device name: " << prop.name << endl;
        cout << "Total Memory: " << prop.totalGlobalMem / 1024.0 / 1024.0 << "MB" << endl;
        cout << "Max Threads per Block: " << prop.maxThreadsPerBlock << endl;
        cout << "Compute capability: " << prop.major << "." << prop.minor << endl;

    }

    int result;
    int *devResult;

    HANDLE_ERROR(cudaMalloc((void **) &devResult, sizeof(int)));

    add<<<1, 1>>>(7, 8, devResult);

    HANDLE_ERROR(cudaMemcpy(&result, devResult, sizeof(int), cudaMemcpyDeviceToHost));

    cout << "7 + 8 = " << result << endl;

    cudaFree(devResult);

    return 0;
}