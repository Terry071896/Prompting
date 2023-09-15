#!/bin/bash
#SBATCH --account soc-gpu-np
#SBATCH --partition soc-gpu-np
#SBATCH --ntasks-per-node=32
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --time=8:00:00
#SBATCH --mem=70GB
#SBATCH --mail-user=terry.cox@utah.edu
#SBATCH --mail-type=FAIL,END
#SBATCH -o assignment_2-%j
#SBATCH --export=ALL

source /uufs/chpc.utah.edu/common/home/u1427155/miniconda3/etc/profile.d/conda.sh
conda activate train_plm

mkdir -p /scratch/general/vast/u1427155/huggingface_cache
export TRANSFORMERS_CACHE="/scratch/general/vast/u1427155/huggingface_cache"
export HF_DATASETS_CACHE="/scratch/general/vast/u1427155/huggingface_cache"

python src/assignment_2.py --seed 1427155 --output_dir /scratch/general/vast/u1427155/cs6966/assignment2