如遇到图中错误(置顶)![img](https://cdn.jsdelivr.net/gh/EmperorCreater/models_info@main/img/onn-error.png)

请在系统内执行导入环境变量代码：

```bash
export PATH=$PATH:/opt/hpcc/bin:/opt/hpcc/htgpu_llvm/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/hpcc/lib
```

再执行hpccinfo如正常数据，即可解决该错误

============================================================================

ONNX Runtime 是一个跨平台的推理和训练机器学习加速器。

ONNX 运行时推理可以实现更快的客户体验并降低成本，支持来自深度学习框架（如 PyTorch 和 TensorFlow/Keras）的模型，以及经典的机器学习库（如 scikit-learn、LightGBM、XGBoost 等）。ONNX 运行时与不同的硬件、驱动程序和操作系统兼容，并通过利用硬件加速器（如果适用）以及图形优化和转换来提供最佳性能。

ONNX 运行时训练可以通过为现有 PyTorch 训练脚本添加一行代码，从而加快转换器模型的多节点 NVIDIA GPU 上的模型训练时间。

了解更多信息请访问官网：https://onnxruntime.ai/docs/