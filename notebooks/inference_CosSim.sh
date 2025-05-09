#!/bin/sh
#
#SBATCH --account=edu           # The account name for the job.
#SBATCH --job-name=mteb-eval_hotpotqa          # The job name.
#SBATCH -c 2                    # The number of cpu cores to use.
#SBATCH --time=48:00:00            # The time the job will take to run
#SBATCH --mem-per-cpu=16gb	# The memory the job will use per cpu core.

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# MODIFY THE FOLLOWING FOR DIFFERENT CONFIGURATIONS
#SBATCH --nodes=1               # Number of nodes
#SBATCH --gres=gpu:1            # Number of GPUs per node
#SBATCH --ntasks-per-node=1     # Number of processes per node

# module purge

# module load anaconda
# module load cuda/12.3

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# source ~/.bashrc
# # conda activate testenv           # Activate the virtual environment
# source /insomnia001/depts/edu/COMSE6998/cd3496/miniconda3/etc/profile.d/conda.sh
# conda activate myenv39           # Activate the virtual environment
# nvidia-smi
# pip list
# # Set PYTHONPATH to prioritize the virtual environment
# export PYTHONPATH=$CONDA_PREFIX/lib/python3.9/site-packages:$PYTHONPATH
# # echo $PATH
# # echo $PYTHONPATH
# export PYTHONPATH=/insomnia001/home/cd3496/mteb:$PYTHONPATH
# pip list
# #export CUDA_VISIBLE_DEVICES=1

# srun python /insomnia001/home/cd3496/energy-distance/notebooks/eval_dataset.py
# #srun python /moto/home/ggn2104/cos_sim/eval_dataset_subset_length.py 

# # End of script

module purge

# RPI Cluster
module load gcc/14.1.0
module load cuda

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
source ~/.bashrc
# source ~/barn/miniconda3x86/etc/profile.d/conda.sh  # Adjust path if needed (RPI Cluster only)
source /insomnia001/depts/edu/COMSE6998/cd3496/miniconda3/etc/profile.d/conda.sh


conda activate myenv39           # Activate the virtual environment for ED model training
#conda activate testenv          # Activate the virtual environment for CosSim model training

nvidia-smi

# Set PYTHONPATH to prioritize the virtual environment
export PYTHONPATH=$CONDA_PREFIX/lib/python3.9/site-packages:$PYTHONPATH
export PYTHONPATH=/insomnia001/home/cd3496/mteb:$PYTHONPATH

export CUDA_VISIBLE_DEVICES=1  # Only use GPU 0

# Start nvidia-smi in the background to monitor GPU utilization every 10 seconds
#while true; do
 #   nvidia-smi >> gpu_utilization.log
 #   sleep 60
#done &


#srun python /gpfs/u/home/MSSV/MSSVntsn/barn/beir/examples/retrieval/training/train_sbert4.py
#srun python /gpfs/u/home/MSSV/MSSVntsn/barn/beir/examples/retrieval/training/train_sbert_latest.py
# srun python /gpfs/u/home/MSSV/MSSVntsn/barn/beir/examples/retrieval/training/train_sbert_latest_2.py
# srun python /insomnia001/home/cd3496/energy-distance/notebooks/eval_dataset.py
srun python /insomnia001/home/cd3496/energy-distance/notebooks/eval_dataset_subset_length.py
nvidia-smi
# End of script

