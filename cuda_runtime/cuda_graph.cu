//
// Created by fiberhome on 2021/4/1.
//

#include "cuda_runtime.h"
#include "cuda.h"
#include "iostream"

using namespace std;


int main() {
    // create the graph
    cudaGraph_t graph;
    cudaGraphCreate(&graph, 0);

    // create the nodes in two stages, nodes -> dependencies. It also can be specified at node creation
    cudaGraphNode_t a;
    cudaGraphNode_t b;
    cudaGraphAddKernelNode(&a, graph, NULL, 0, &nodeParams);
    cudaGraphAddKernelNode(&b, graph, NULL, 0, &nodeParams);

    // set up dependencies
    cudaGraphAddDependencies(graph, &a, &b, 1); // A -> B



}
