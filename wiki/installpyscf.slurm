#!/bin/bash
#SBATCH --partition=devel,day
#SBATCH --out=installpyscf.out
#SBATCH --error=installpyscf.err
#SBATCH --time=02:00:00
#SBATCH --tasks=1
#SBATCH --cpus-per-task=4

module purge
module load miniconda

MY_NEW_ENV_NAME="my_new_env"

echo "Creating environment ${MY_NEW_ENV_NAME}"
conda create -y -n ${MY_NEW_ENV_NAME} "python<3.12"
conda activate ${MY_NEW_ENV_NAME}

echo "libblas=*=*mkl" >> ${CONDA_PREFIX}/conda-meta/pinned

echo "Installing PySCF"
conda install -y pyscf cvxpy -c conda-forge

echo "Installing mpi4py"
module load foss/2022b
pip install mpi4py

echo "Finished."
