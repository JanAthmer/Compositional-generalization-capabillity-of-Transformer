#!/usr/bin/env bash
#SBATCH -p localLimited
#SBATCH -A ecortex
#SBATCH --mem=1G
#SBATCH --time=12:00:00
#SBATCH --gres=gpu:1
#SBATCH -c 2

export HOME=`getent passwd $USER | cut -d':' -f6`
export PYTHONUNBUFFERED=1
echo Running on $HOSTNAME

source /usr/local/anaconda3/etc/profile.d/conda.sh
conda activate pytorch1.0

gpus=$(echo $CUDA_VISIBLE_DEVICES | tr "," "\n")
for gpu in $gpus
do
echo "Setting fan for" $gpu "to full"
nvidia_fancontrol full $gpu
done

python main.py \
--split simple \
--num_runs 10 \
--batch_size 4096 \
--num_epochs 2 \
--model_type transformer \
--d_model 512 \
--nhead 8 \
--num_encoder_layers 6 \
--num_decoder_layers 6 \
--dim_feedforward 2048 \
--dropout 0.1 \
--learning_rate 0.08 \
--results_dir transformer \
--out_data_file train_defaults_simple \
--checkpoint_path ../weights/defaults_simple.pt \
--checkpoint_every 1 \
--record_loss_every 20

for gpu in $gpus
do
echo "Setting fan for " $gpu "back to auto"
nvidia_fancontrol auto $gpu
done
