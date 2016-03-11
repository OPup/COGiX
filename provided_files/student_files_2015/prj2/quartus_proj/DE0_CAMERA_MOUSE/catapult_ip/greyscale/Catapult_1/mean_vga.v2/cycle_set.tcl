
# Loop constraints
directive set /mean_vga/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /mean_vga/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}
directive set /mean_vga/core/core:rlp/main/SHIFT CSTEPS_FROM {{. == 1} {.. == 1}}

# IO operation constraints
directive set /mean_vga/core/core:rlp/main/FRAME:io_read(vin:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:io_write(vout:rsc.d) CSTEPS_FROM {{.. == 2}}

# Real operation constraints
directive set /mean_vga/core/core:rlp/main/SHIFT/SHIFT:if:else:else:mux CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/SHIFT/SHIFT:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#6 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#9 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#8 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#11 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#10 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#12 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/acc#1 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#13 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/acc#2 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#17 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#22 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#19 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#21 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#14 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#15 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#16 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#18 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#20 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:acc#7 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:or CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:or#3 CSTEPS_FROM {{.. == 2}}
