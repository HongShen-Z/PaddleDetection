#!/bin/bash
#BSUB -J infer
#BSUB -o %J.out
#BSUB -e %J.err
#BSUB -q gpu_v100
#BSUB -gpu "num=1:mode=exclusive_process:aff=yes"

export CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES

module load anaconda3
source activate
conda deactivate
conda activate paddle
python setup.py install
python ppdet/modeling/tests/test_architectures.py
#python tools/infer.py -c configs/ppyolo/ppyolo_r50vd_dcn_1x_coco.yml \
#-o use_gpu=true weights=cache/weights/ppyolo_r50vd_dcn_1x_coco.pdparams \
#--infer_img=demo/000000014439.jpg

#--gpus $CUDA_VISIBLE_DEVICES
#~/.cache/torch/checkpoints/yolov5s.pt
