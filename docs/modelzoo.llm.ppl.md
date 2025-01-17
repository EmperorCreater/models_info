### ModelZoo.LLM.PPL 概念介绍

**ModelZoo.LLM.PPL** 是一个高性能的大语言模型（LLM）推理引擎，由OpenPPL团队开发，旨在提供从模型导出到高效推理的端到端解决方案。该系统实现了LLM任务的全流程深度优化，整个推理系统包含四个主要部分：

1. **ppl.llm.serving**：这是服务框架，是推理服务系统的入口，负责处理用户的输入并调度模型推理引擎。
2. **ppl.pmx**：包含pmx算子标准的文档以及Python API，以及官方模型的ModelZoo。它还提供了模型转换和导出工具，以及模型的张量并行分割和合并工具。
3. **ppl.nn.llm**：这是推理引擎，负责核心网络部分的推理加速。
4. **ppl.llm.kernel**：包含针对大模型开发的高性能kernel。

**功能特点**：

- **服务优化**：精细化KV Cache管理，支持用户迁移；优化框架性能，提高硬件利用率；支持Pipeline并行，提高可扩展性。
- **模型工具**：扩展模型支持，如InternLM、ChatGLM、Baichuan、Bloom等；Python API性能优化，高效Python推理。
- **硬件支持**：引入更多国产芯片支持，如MLU、Ascend；移动端GPU支持，主要为OpenCL；ARM CPU支持以及更多硬件平台。

**适用场景**：

- **高性能推理**：适用于需要高效推理的大语言模型应用，如自然语言处理、文本生成等。
- **多平台支持**：支持多种硬件平台，包括NVIDIA Ampere、NVIDIA Hopper等。

[点击参考官方文档](https://www.hiascend.com/software/modelzoo)