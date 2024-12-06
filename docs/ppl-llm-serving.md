[![SYSTEM_OVERVIEW](https://github.com/openppl-public/ppl.nn/raw/master/docs/images/llm-system-overview.png)](https://github.com/openppl-public/ppl.nn/blob/master/docs/images/llm-system-overview.png)

我们建议新用户阅读[本项目的概览](https://github.com/openppl-public/ppl.nn/blob/master/docs/en/llm-system-overview.md)。

ppl.llm.serving 是基于 ppl.nn 为各种大型语言模型（LLMs）提供服务的基础。这个仓库包含了一个基于 gRPC 的服务器以及对 LLaMA 的推理支持。

ppl.llm.serving 是 PPL.LLM 系统的重要组成部分，它是一个基于 ppl.nn 的大型语言模型（LLMs）推理服务框架。以下是 ppl.llm.serving 的一些关键特点和简介：

1. **高性能服务框架**：ppl.llm.serving 提供了一个基于 gRPC 的服务器，用于支持各种大型语言模型的推理服务，目前主要支持 LLaMA 模型。
2. **异步优化**：为了减少服务开销，ppl.llm.serving 实现了异步编码和异步解码。
3. **KV Cache 分配管理优化**：ppl.llm.serving 实现了专门的内存分配管理器，以优化键值缓存分配。
4. **调度优化**：在硬件满载时减少不必要的请求队列查询，提高了调度效率。
5. **多GPU支持**：如果使用多个 GPU 设备，ppl.llm.serving 支持 NCCL，以实现更高效的多 GPU 并行计算。
6. **模型导出与服务部署**：ppl.llm.serving 支持模型导出和部署，使用户能够将训练好的模型部署到生产环境中。
7. **性能测试工具**：提供了性能测试工具，帮助用户评估模型的推理性能。
8. **系统要求**：ppl.llm.serving 可以在 x86_64 或 arm64 架构的 Linux 系统上运行，主要依赖包括 GCC、CMake、Git 和 CUDA Toolkit。
9. **快速开始**：用户可以通过一系列简单的步骤快速开始使用 ppl.llm.serving，包括安装依赖、克隆源代码、编译源码、导出模型、运行服务器和客户端。

ppl.llm.serving 作为一个高性能的大模型服务框架，适用于需要构建和部署大规模语言模型服务的场景，以实现高效的模型推理和部署。