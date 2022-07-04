#!/bin/bash
#BSUB -J infer
#BSUB -o %J.out
#BSUB -e %J.err
#BSUB -q gpu_v100
#BSUB -gpu "num=1:mode=exclusive_process:aff=yes"

rm /seu_share/home/dijunyong/220205723/usr/local/cuda
ln -s /seu_share/home/dijunyong/220205723/usr/local/cuda-10.2 /seu_share/home/dijunyong/220205723/usr/local/cuda
export CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES

module load anaconda3
source activate
conda deactivate
conda activate paddle
python tools/infer.py -c configs/ppyolo/ppyolo_r50vd_dcn_1x_coco.yml \
-o use_gpu=true weights=https://paddledet.bj.bcebos.com/models/ppyolo_r50vd_dcn_1x_coco.pdparams \
--infer_img=demo/000000014439.jpg

#--gpus $CUDA_VISIBLE_DEVICES
#~/.cache/torch/checkpoints/yolov5s.pt
