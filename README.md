# Installation

## Step 1: git clone

```bash
git clone https://github.com/wangziyuan66/iterative-labeling-toolkit-taiyaki
```

## Step 2: build sif file

```bash
singularity build guppy_megalodon.sif guppy_megalodon.recipe
singularity build taiyaki.sif taiyaki.recipe
```

Create a standalone envrionment to run the iterative-labeling-toolkit.

# Usage

```bash
bash taiyaki_iterative_lableing_toolkit.sh train_hdf5 output_path reference guppy_config guppy_model taiyaki_model raw_fast5 niters
```

# Contact
