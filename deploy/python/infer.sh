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
python deploy/python/infer.py --model_dir=./output_inference/yolov3_darknet53_270e_coco \
--image_file=./demo/000000014439.jpg --device=GPU --run_benchmark=True

#--gpus $CUDA_VISIBLE_DEVICES
#~/.cache/torch/checkpoints/yolov5s.pt
