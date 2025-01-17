### PyTorch基础

**PyTorch是一个由多个组件组成的库，主要包括：**

1. **torch**：类似于NumPy的张量库，具有强大的GPU支持。
2. **torch.autograd**：基于磁带的自动微分库，支持torch中所有可微分的张量操作。
3. **torch.jit**：编译堆栈（TorchScript），用于从PyTorch代码创建可序列化和可优化的模型。
4. **torch.nn**：与autograd深度集成的神经网络库，旨在提供最大的灵活性。
5. **torch.multiprocessing**：Python多进程，但具有跨进程共享torch张量的魔法内存共享。适用于数据加载和Hogwild训练。
6. **torch.utils**：DataLoader和其他实用工具函数。

**PyTorch通常用作：**

- 替代NumPy，利用GPU的强大计算能力。
- 深度学习研究平台，提供最大的灵活性和速度。

### 进一步阐述

**GPU就绪的张量库**

PyTorch提供的张量可以在CPU或GPU上运行，并大幅加速计算。提供了各种张量操作，如切片、索引、数学运算、线性代数、归约等，并且它们非常快速。

**动态神经网络：基于磁带的自动微分**

PyTorch使用反向模式自动微分技术，允许您随意改变网络行为，无需重新开始。这种技术不是PyTorch独有的，但PyTorch是迄今为止最快的实现之一，为您提供速度和灵活性的最佳组合。

**Python优先**

PyTorch不是Python绑定到一个庞大的C++框架，而是深度集成到Python中。您可以像使用NumPy/SciPy/scikit-learn等一样自然地使用它。您可以使用Python本身编写新的神经网络层，使用您喜欢的库，并使用Cython和Numba等包。

**命令式体验**

PyTorch旨在直观、线性思考和易于使用。执行代码时，它会立即执行，没有异步视图。当您进入调试器或接收错误消息和堆栈跟踪时，理解它们是直接的。堆栈跟踪指向您的代码定义的确切位置。

**快速且精简**

PyTorch框架开销极小。它集成了加速库，如Intel MKL和NVIDIA（cuDNN, NCCL），以最大化速度。其CPU和GPU张量和神经网络后端经过多年测试，非常成熟。

**扩展无忧**

编写新的神经网络模块或与PyTorch的张量API接口被设计为简单且抽象最少。您可以使用torch API或您喜欢的基于NumPy的库（如SciPy）用Python编写新的神经网络层。如果您想用C/C++编写您的层，我们提供了一个方便的扩展API，高效且最少的样板代码。不需要编写包装代码。

[点击前往官方文档](https://pytorch.org/)

[点击前往Github](https://github.com/pytorch/pytorch)