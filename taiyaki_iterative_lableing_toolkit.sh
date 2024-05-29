######## Input

#### $1 train file folder path
#### $2 ouput save path
#### $3 genome path
#### $4 config path
#### $5 guppy model path
#### $6 taiyaki checkpoint path
#### $7 raw path

$datasets=$1
$path=$2
$genome=$3
$config=$4
$model=$5
$checkpoint=$6
$raw=$7
$taiyaki=./
$guppy=./


singularity exec --nv $guppy/guppy_megalodon.sif /home/ont-guppy/bin/guppy_basecaller --input_file_list $datasets/train.txt --save_path $path --align_ref $genome/rna.fa --align_type auto --bam_out --config $config --model_file $model --device cuda:0 --disable_qscore_filtering
rm $path/fastq_runid*.fastq
rm $path/guppy_basecaller_log*.log
rm $path/sequencing_telemetry.js

## guppy basecalling

singularity exec $samtools/samtools.sif samtools merge $path/merge.bam $path/bam_runid*.bam
singularity exec $samtools/samtools.sif samtools sort -o $path/merge.sorted.bam $path/merge.bam
singularity exec $samtools/samtools.sif samtools index $path/merge.sorted.bam
rm $path/bam_runid*.bam
rm $path/merge.bam

########### Basecall ###############

echo filename_fast5 | cat - $datasets/train.txt > $path/input_strand_list.txt
singularity exec $taiyaki/taiyaki.sif get_refs_from_sam.py $genome/rna.fa $path/merge.sorted.bam --reverse --output $path/train.fa
singularity exec $taiyaki/taiyaki.sif generate_per_read_params.py $raw --input_strand_list $path/input_strand_list.txt --jobs 32 --output $path/train.tsv
singularity exec $taiyaki/taiyaki.sif prepare_mapped_reads.py $raw $path/train.tsv $path/train.hdf5 $checkpoint $path/train.fa --jobs 32 --batch_format

########### Hdf5 #############

singularity exec --nv $taiyaki/taiyaki.sif train_flipflop.py $taiyaki/taiyaki_models/mLstm_flipflop.py $path/train.hdf5 --niteration 25000 --size 256 --stride 10 --winlen 31 --device cuda:0 --overwrite --outdir $path

singularity exec $taiyaki/taiyaki.sif dump_json.py $path/model_final.checkpoint --output $path/model.json



########### Train #############
