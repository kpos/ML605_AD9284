
 
 
 



 

#!/bin/sh

# Clean up the results directory
rm -rf results
mkdir results

#Synthesize the Wrapper Files

echo 'Synthesizing example design with XST';
xst -ifn xst.scr
cp system_ethernet_lite_wrapper_blk_mem_gen_v7_3_exdes.ngc ./results/


# Copy the netlist generated by Coregen
echo 'Copying files from the netlist directory to the results directory'
cp ../../system_ethernet_lite_wrapper_blk_mem_gen_v7_3.ngc results/

#  Copy the constraints files generated by Coregen
echo 'Copying files from constraints directory to results directory'
cp ../example_design/system_ethernet_lite_wrapper_blk_mem_gen_v7_3_exdes.ucf results/

cd results

echo 'Running ngdbuild'
ngdbuild -p xc6vcx75t-ff484-2 system_ethernet_lite_wrapper_blk_mem_gen_v7_3_exdes

echo 'Running map'
map system_ethernet_lite_wrapper_blk_mem_gen_v7_3_exdes -o mapped.ncd -pr i

echo 'Running par'
par mapped.ncd routed.ncd

echo 'Running trce'
trce -e 10 routed.ncd mapped.pcf -o routed

echo 'Running design through bitgen'
bitgen -w routed

echo 'Running netgen to create gate level VHDL model'
netgen -ofmt vhdl -sim -tm system_ethernet_lite_wrapper_blk_mem_gen_v7_3_exdes -pcf mapped.pcf -w routed.ncd routed.vhd
