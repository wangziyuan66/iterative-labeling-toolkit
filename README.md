# Introduction

Nucleotide modifications deviate nanopore sequencing readouts, therefore generating artifacts during the basecalling of sequence backbones. Here, we present an iterative approach to polish modification-disturbed basecalling results. We show such an approach is able to promote the basecalling accuracy of both artificially-synthesized and real-world molecules. With demonstrated efficacy and reliability, we exploit the approach to precisely basecall therapeutic RNAs consisting of artificial or natural modifications, as the basis for quantifying the purity and integrity of vaccine mRNAs which are transcribed in vitro, and for determining modification hotspots of novel therapeutic RNA interference (RNAi) molecules which are bioengineered (BioRNA) in vivo.

# Installation

## Pre-request

+ [singularity](https://docs.sylabs.io/guides/3.0/user-guide/index.html)
+ [git](https://git-scm.com/) 

## Step 1: git clone

```bash
git clone https://github.com/wangziyuan66/iterative-labeling-toolkit-taiyaki
```

## Step 2: download Taiyaki sif environment

Considering **Taiyaki** has been deprecated by Oxford Nanopore Group, we provide a recipe file which could be utiled to create the [singularity sif image]([https://docs.sylabs.io/guides/3.3/user-guide/cli/singularity_sif.html](https://docs.sylabs.io/guides/3.3/user-guide/quick_start.html#overview-of-the-singularity-interface)) or [docker image](https://docs.sylabs.io/guides/2.6/user-guide/singularity_and_docker.html) in taiyaki/taiyaki.recipe.

Here is [How to build the Singularity image](https://docs.sylabs.io/guides/2.6/user-guide/build_a_container.html).

The builded image can also be downloaded in our [figshare](https://figshare.com/s/6bce33cadffb8bd8b622).

# Usage

```bash
bash taiyaki_iterative_lableing_toolkit.sh train_hdf5 output_path reference guppy_config guppy_model taiyaki_model raw_fast5 niters
```

+ **train_hdf5** : The path to training hdf5.

+ **output_path** : The path to trained models.

+ **reference** : Reference genome path.

+ **guppy_config** : The config file for guppy basecaller.

+ **guppy_model** : The guppy basecaller model for zero iteration: initial model for Iterative basecalling.

+ **taiyaki_model** : The model template for taiyaki training strategy.

+ **raw_fast5** : The folder to the raw fast5 files.

+ **niters** : The number of iterations for Iterative Labeling.

# Contact

Ziyuan Wang princezwang@arizona.edu
