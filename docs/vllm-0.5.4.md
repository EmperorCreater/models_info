vLLM 是一个快速且易于使用的 LLM 推理和服务库。（注意：此版本为 0.5.4）

vLLM 具有以下功能：

- 最先进的服务吞吐量
- 使用 **PagedAttention** 高效管理注意力键和值内存
- 对传入请求进行连续批处理
- 使用 CUDA/HIP 图形快速执行模型
- 量化：[GPTQ](https://arxiv.org/abs/2210.17323) 、 [AWQ 、 INT4](https://arxiv.org/abs/2306.00978) 、 INT8 和 FP8 。
- 优化 CUDA 内核，包括 FlashAttention 和 FlashInfer 的集成。
- 推测解码
- 分块预填充

**性能基准**：我们在[博客文章](https://blog.vllm.ai/2024/09/05/perf-update.html)的末尾包含性能基准。它将 vLLM 的性能与其他 LLM 服务引擎（ [TensorRT-LLM](https://github.com/NVIDIA/TensorRT-LLM) 、 [SGLang](https://github.com/sgl-project/sglang) 和 [LMDeploy](https://github.com/InternLM/lmdeploy) ）进行了比较。该实现位于 [nightly-benchmarks 文件夹](https://github.com/vllm-project/vllm/blob/main/.buildkite/nightly-benchmarks)下，您可以使用我们的一键式可运行脚本[重现](https://github.com/vllm-project/vllm/issues/8176)此基准测试。

vLLM 非常灵活且易于使用：

- 与流行的 Hugging Face 型号无缝集成
- 使用各种解码算法（包括*并行采样*、*光束搜索*等）实现高吞吐量服务
- Tensor 并行和 Pipeline 并行支持分布式推理
- 流式处理输出
- OpenAI 兼容 API 服务器
- 支持 NVIDIA GPU、AMD CPU 和 GPU、INTEL CPU 和 GPU、POWERPC CPU、TPU 和 AWS Neuron。
- 前缀缓存支持
- Multi-lora 支持

vLLM 无缝支持 HuggingFace 上最流行的开源模型，包括：

- 类似 transformer 的 LLM（例如 Llama）
- Mixture-of-Expert LLM（例如 Mixtral）
- 嵌入模型（例如 E5-Mistral）
- 多模态 LLM（例如 LLaVA）

[在此处](https://docs.vllm.ai/en/latest/models/supported_models.html)查找受支持型号的完整列表。