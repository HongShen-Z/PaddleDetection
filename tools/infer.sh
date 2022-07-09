#!/bin/bash
#BSUB -J infer
#BSUB -o %J.out
#BSUB -e %J.err
#BSUB -q gpu_v100
#BSUB -gpu "num=1:mode=exclusive_process:aff=yes"


export CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES
export LD_LIBRARY_PATH=/seu_share/home/dijunyong/220205723/usr/local/TensorRT-7.2.3.4/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/seu_share/home/dijunyong/220205723/usr/local/cuda-11.2/lib64:$LD_LIBRARY_PATH
echo $LD_LIBRARY_PATH

module load anaconda3
source activate
conda deactivate
conda activate paddle
which python
#python setup.py install
#python ppdet/modeling/tests/test_architectures.py
#python -m pip install paddlepaddle_gpu-2.3.0-cp37-cp37m-linux_x86_64.whl
python tools/infer.py
#python tools/infer.py -c configs/ppyolo/ppyolo_r50vd_dcn_1x_coco.yml \
#-o use_gpu=true weights=cache/weights/ppyolo_r50vd_dcn_1x_coco.pdparams \
#--infer_img=demo/000000014439.jpg

#--gpus $CUDA_VISIBLE_DEVICES
#~/.cache/torch/checkpoints/yolov5s.pt
