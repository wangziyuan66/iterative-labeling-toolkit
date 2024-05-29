######## Input

#### $1 train file folder path
#### $2 ouput save path
#### $3 genome path
#### $4 config path
#### $5 guppy model path
#### $6 taiyaki checkpoint path
#### $7 raw path
#### $8 iters

niter=$8

for i in {1..$niter};do
bash taiyaki_iterative_lableing_toolkit.sh $1 $2/round${i} $3 $4 $5 $6 $7
done
