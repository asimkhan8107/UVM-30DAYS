cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/usr/share/Riviera-PRO/bin
export RIVIERA_HOME=/usr/share/Riviera-PRO
export CPLUS_INCLUDE_PATH=/usr/share/Riviera-PRO/interfaces/include
export ALDEC_LICENSE_FILE=27009@10.116.0.5
export HOME=/home/runner
export UVM_HOME=/playground_lib/uvm-1.2
vlib work && vlog '-timescale' '1ns/1ns' +incdir+$RIVIERA_HOME/vlib/uvm-1.2/src -l uvm_1_2 -err VCP2947 W9 -err VCP2974 W9 -err VCP3003 W9 -err VCP5417 W9 -err VCP6120 W9 -err VCP7862 W9 -err VCP2129 W9 design.sv testbench.sv  && vsim -c -do "vsim +access+r; run -all; exit"  ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip