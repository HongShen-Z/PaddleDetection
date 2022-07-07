#!/bin/bash
#BSUB -J export
#BSUB -o %J.out
#BSUB -e %J.err
#BSUB -q gpu_v100
#BSUB -gpu "num=1:mode=exclusive_process:aff=yes"

export CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES

module load anaconda3
source activate
conda deactivate
conda activate paddle
python static/tools/export_model.py -c static/configs/efficientdet_d0.yml \
-o use_gpu=true weights=https://paddlemodels.bj.bcebos.com/object_detection/efficientdet_d0.pdparams

#--gpus $CUDA_VISIBLE_DEVICES
#~/.cache/torch/checkpoints/yolov5s.pt
