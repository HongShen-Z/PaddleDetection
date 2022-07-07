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
python tools/export_model.py -c configs/ppyoloe/ppyoloe_crn_l_300e_coco.yml \
-o trt=True exclude_nms=True weights=https://paddledet.bj.bcebos.com/models/ppyoloe_crn_l_300e_coco.pdparams


#--gpus $CUDA_VISIBLE_DEVICES
#~/.cache/torch/checkpoints/yolov5s.pt
