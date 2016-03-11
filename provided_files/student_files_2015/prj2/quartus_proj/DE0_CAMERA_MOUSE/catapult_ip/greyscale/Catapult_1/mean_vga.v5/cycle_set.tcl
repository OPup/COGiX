
# Loop constraints
directive set /mean_vga/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /mean_vga/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}
directive set /mean_vga/core/core:rlp/main/for CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1 CSTEPS_FROM {{. == 6} {.. == 1}}

# IO operation constraints
directive set /mean_vga/core/core:rlp/main/FRAME:io_read(vin:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:io_write(vout:rsc.d) CSTEPS_FROM {{.. == 2}}

# Real operation constraints
directive set /mean_vga/core/core:rlp/main/for/for:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/for/SHIFT:if:else:else:else:acc CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/for/SHIFT:if:else:else:else:mux CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/for/SHIFT:if:else:else:mux CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/for/SHIFT:if:else:else:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/for/SHIFT:if:else:else:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/for/SHIFT:if:else:else:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/for/SHIFT:if:else:else:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/for/SHIFT:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/for/for:acc CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#2:mux} CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#1:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#50 CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#21 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#52 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#51 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#54 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#53 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#55 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#1 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#56 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#2 CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#5:mux} CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#4:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#57 CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#3:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#22 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#59 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#58 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#61 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#60 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#62 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#5 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#63 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#6 CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#8:mux} CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#7:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#64 CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#6:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#23 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#66 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#65 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#68 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#67 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#69 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#9 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#70 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#10 CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#11:mux} CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#10:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#71 CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#9:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#24 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#73 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#72 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#75 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#74 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#76 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#13 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#77 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#14 CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#14:mux} CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#13:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#78 CSTEPS_FROM {{.. == 1}}
directive set {/mean_vga/core/core:rlp/main/ACC1/regs.operator[]#12:mux} CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#25 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#80 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#79 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#82 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#81 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#83 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#17 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#84 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/acc#18 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#118 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#123 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#120 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#122 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#115 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#116 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#117 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#119 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#121 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#28 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:mul#2 CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#49 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#48 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#47 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:mul#33 CSTEPS_FROM {{.. == 6}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#37 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#36 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#35 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:mul CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#124 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#114 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#103 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#105 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#46 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#45 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#44 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:mul#32 CSTEPS_FROM {{.. == 4}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#107 CSTEPS_FROM {{.. == 4}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#109 CSTEPS_FROM {{.. == 6}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#43 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#42 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#41 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:mul#31 CSTEPS_FROM {{.. == 5}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#85 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#91 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#125 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#88 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#126 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#96 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#99 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#95 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#94 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#98 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#102 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#90 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#89 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#93 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#87 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#86 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#92 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#97 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#101 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#127 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#104 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#40 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#39 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#38 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:mul#30 CSTEPS_FROM {{.. == 3}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#106 CSTEPS_FROM {{.. == 3}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#108 CSTEPS_FROM {{.. == 5}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#110 CSTEPS_FROM {{.. == 6}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#111 CSTEPS_FROM {{.. == 6}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#128 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#112 CSTEPS_FROM {{.. == 6}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc#20 CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/ACC1/ACC1:acc CSTEPS_FROM {{.. == 1}}
directive set /mean_vga/core/core:rlp/main/FRAME:or CSTEPS_FROM {{.. == 2}}
directive set /mean_vga/core/core:rlp/main/FRAME:or#3 CSTEPS_FROM {{.. == 2}}
