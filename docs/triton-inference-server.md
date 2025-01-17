### Triton Inference Server 介绍

**Triton Inference Server** 是由NVIDIA提供的一个开源推理框架，旨在为AI算法模型提供高效的部署和推理能力，目前已经成为主流的模型部署方案。

#### 主要特点

- **支持多种深度学习框架**：包括PyTorch，Tensorflow，TensorRT，ONNX，OpenVINO等产出的模型文件。
- **支持多种机器学习框架**：支持对树模型的部署，包括XGBoost，LightGBM等。
- **支持多种推理协议**：支持HTTP，GRPC推理协议。
- **服务端支持模型前后处理**：提供后端API，支持将数据的前处理和模型推理的后处理在服务端实现。
- **支持模型并发推理**：支持多个模型或者同一模型的多个实例在同一系统上并行执行。
- **支持动态批处理（Dynamic batching）**：支持将一个或多个推理请求合并成一个批次，以最大化吞吐量。
- **支持多模型的集成流水线**：支持将多个模型进行连接组合，将其视作一个整体进行调度管理。

###### Triton Inference Server是一个高性能、灵活且可扩展的AI推理服务器，支持多种深度学习和机器学习框架，可以在云端、数据中心、边缘设备和嵌入式系统上进行推理。它提供了多种开箱即用的功能，帮助快速落地AI模型到生产环境。

[点击前往官方文档](https://docs.nvidia.com/deeplearning/triton-inference-server/user-guide/docs/index.html)

[点击前往Github](https://github.com/triton-inference-server/tutorials)