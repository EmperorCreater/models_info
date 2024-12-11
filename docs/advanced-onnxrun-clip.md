# 本产品模型位于/root/commonData/adv-models/onnxruntime_cn-clip #共享目录下
# 使用该模型需要cp -r commonData/adv-models/onnxruntime_cn-clip/Chinese-CLIP/  /root/dataDisk【 /root/dataDisk可更换为其他位置】*****
# 模型结构
```txt
Chinese-CLIP/
├── cn_clip
│   ├── clip
│   │   ├── bert_tokenizer.py
│   │   ├── configuration_bert.py
│   │   ├── __init__.py
│   │   ├── model_configs
│   │   │   ├── RBT3-chinese.json
│   │   │   ├── RN50.json
│   │   │   ├── RoBERTa-wwm-ext-base-chinese.json
│   │   │   ├── RoBERTa-wwm-ext-large-chinese.json
│   │   │   ├── ViT-B-16.json
│   │   │   ├── ViT-B-32.json
│   │   │   ├── ViT-H-14.json
│   │   │   ├── ViT-L-14-336.json
│   │   │   └── ViT-L-14.json
│   │   ├── modeling_bert.py
│   │   ├── model.py
│   │   ├── utils.py
│   │   └── vocab.txt
│   ├── deploy
│   │   ├── benchmark_utils.py
│   │   ├── __init__.py
│   │   ├── onnx_to_tensorrt.py
│   │   ├── pytorch_to_coreml.py
│   │   ├── pytorch_to_onnx.py
│   │   ├── speed_benchmark.py
│   │   └── tensorrt_utils.py
│   ├── eval
│   │   ├── cvinw_zeroshot_templates.py
│   │   ├── data.py
│   │   ├── evaluation.py
│   │   ├── evaluation_tr.py
│   │   ├── extract_features_onnx.py
│   │   ├── extract_features.py
│   │   ├── extract_features_tensorrt.py
│   │   ├── imagenet_zeroshot_templates.py
│   │   ├── __init__.py
│   │   ├── make_topk_predictions.py
│   │   ├── make_topk_predictions_tr.py
│   │   ├── transform_ir_annotation_to_tr.py
│   │   └── zeroshot_evaluation.py
│   ├── __init__.py
│   ├── preprocess
│   │   ├── build_lmdb_dataset.py
│   │   ├── __init__.py
│   │   └── transform_openai_pretrain_weights.py
│   └── training
│       ├── data.py
│       ├── __init__.py
│       ├── logger.py
│       ├── main.py
│       ├── params.py
│       ├── scheduler.py
│       └── train.py
├── ${DATAPATH}                     # 这里是data，可根据自身需求更改
│   ├── datasets
│   │   ├── Flickr30k-CN
│   │   └── MUGE
     └── .../                     # 更多自定义数据集...
│   ├── deploy	         # 用于存放ONNX & TensorRT部署模型
│   ├── experiments
│   └── pretrained_weights
│       ├── clip_cn_rn50.pt
│       ├── clip_cn_vit-b-16.pt
│       ├── clip_cn_vit-h-14.pt
│       ├── clip_cn_vit-l-14-336.pt
│       └── clip_cn_vit-l-14.pt
└── run_scripts
    ├── coco-cn_finetune_vit-b-16_rbt-base.sh
    ├── flickr30k_finetune_vit-b-16_rbt-base_flip.sh
    ├── flickr30k_finetune_vit-b-16_rbt-base.sh
    ├── muge_finetune_vit-b-16_rbt-base_distillation.sh
    ├── muge_finetune_vit-b-16_rbt-base_flashattn.sh
    ├── muge_finetune_vit-b-16_rbt-base_flip.sh
    ├── muge_finetune_vit-b-16_rbt-base.sh
    └── ...				 # 更多finetune或评测脚本...


```



# 将tsv和json文件一起序列化
```bash
DATAPATH=data    	 # 文件位置(/root/Chinese-CLIP/data)
dataset_name=MUGE	 # 使用模板模型数据集测试(/root/Chinese-CLIP/data/datasets/MUGE)
python cn_clip/preprocess/build_lmdb_dataset.py \
    --data_dir ${DATAPATH}/datasets/${dataset_name} \
    --splits train,valid,test
```



# 训练样例(本次以MUGE数据为例)
```bash
vim muge_finetune_vit-b-16_rbt-base.sh       # 编辑训练脚本写入本机ip地址（已动态替换，如果有其他需求更改第15行即可，无则不用更改）,和使用gpu卡的数量 ***
# 11行，这个8为当前节点所具备或者你想使用的的GPU数量
GPUS_PER_NODE=8
export DATAPATH="/root/dataDisk/Chinese-CLIP/data"	# 要设置这个环境变量使得模型可以找得到要处理的数据，（/root/Chinese-CLIP/data）是默认位置 *****
cd /root/dataDisk/Chinese-CLIP/ # (在这个目录下运行，不然会报错) ***
# 执行以下命令开始训练
bash run_scripts/muge_finetune_vit-b-16_rbt-base.sh ${DATAPATH}
```



# 评估测试（目前仅支持单卡评估）
```bash
cd Chinese-CLIP/
export CUDA_VISIBLE_DEVICES=0
export PYTHONPATH=${PYTHONPATH}:`pwd`/cn_clip
split=valid   							# 指定计算valid或test集特征
resume=${DATAPATH}/pretrained_weights/clip_cn_vit-b-16.pt
python -u cn_clip/eval/extract_features.py \
    --extract-image-feats \
    --extract-text-feats \
    --image-data="${DATAPATH}/datasets/${dataset_name}/lmdb/${split}/imgs" \
    --text-data="${DATAPATH}/datasets/${dataset_name}/${split}_texts.jsonl" \
    --img-batch-size=32 \
    --text-batch-size=32 \
    --context-length=52 \
    --resume=${resume} \
    --vision-model=ViT-B-16 \
    --text-model=RoBERTa-wwm-ext-base-chinese
```

