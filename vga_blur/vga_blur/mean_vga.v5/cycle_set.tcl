
# Loop constraints
directive set /mean_vga/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /mean_vga/core/core:rlp/main CSTEPS_FROM {{. == 1} {.. == 0}}
directive set /mean_vga/core/core:rlp/main/FRAME CSTEPS_FROM {{. == 3} {.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME/SHIFT CSTEPS_FROM {{. == 1} {.. == 1}}

# IO operation constraints
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:io_read(vin:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:io_write(vout:rsc.d) CSTEPS_FROM {{.. == 2}}

# Real operation constraints
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#20 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME/SHIFT/SHIFT:if:else:else:mux CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME/SHIFT/SHIFT:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#6 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#10 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#9 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#12 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#11 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#13 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/acc#1 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#14 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/acc#2 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#18 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#23 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#20 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#22 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#15 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#16 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#17 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#19 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#21 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#7 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:or CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:or#3 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#1 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#2 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#3 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#4 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#5 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#6 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#7 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#8 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#9 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#10 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#11 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#12 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#13 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#14 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#15 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#16 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#17 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#18 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:mux#19 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME/FRAME:acc CSTEPS_FROM {{.. == 2}}
