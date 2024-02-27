
filelist=${1:-filelist}
iverilog -o servgrid.vvp $(cat $filelist)

