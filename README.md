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
