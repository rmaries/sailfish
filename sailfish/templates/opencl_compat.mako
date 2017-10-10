% if backend == 'cuda':

// OpenCL compatibility code.
__device__ int inline get_local_size(int i)
{
  if (i == 0) {
    return blockDim.x;
  } else {
    return blockDim.y;
  }
}

__device__ int inline get_global_size(int i)
{
  if (i == 0) {
    return blockDim.x * gridDim.x;
  } else {
    return blockDim.y * gridDim.y;
  }
}

__device__ int inline get_group_id(int i)
{
  if (i == 0) {
    return blockIdx.x;
  } else {
    return blockIdx.y;
  }
}

__device__ int inline get_local_id(int i)
{
  if (i == 0) {
    return threadIdx.x;
  } else {
    return threadIdx.y;
  }
}

__device__ int inline get_global_id(int i)
{
  if (i == 0) {
    return threadIdx.x + blockIdx.x * blockDim.x;
  } else {
    return threadIdx.y + blockIdx.y * blockDim.y;
  }
}

%endif

<%def name="barrier()">
  %if backend == 'cuda':
    __syncthreads();
  %else:
    barrier(CLK_LOCAL_MEM_FENCE);
  %endif
</%def>

