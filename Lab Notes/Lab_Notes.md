#Lab Notes

##Lab 1: Vector Dot Product

###Catapult c

The initial code for the pipelined vector dot product finder was run, giving the following Gantt Chart:

![Image of First Gantt Chart](https://github.com/OPup/COGiX/blob/master/Lab%20Notes/screenshots/Lab_1_Gant_1.png)

Then unrolling:

![Image of First Gantt Chart](https://github.com/OPup/COGiX/blob/master/Lab%20Notes/screenshots/Lab_1_Gant_2.png)

There are more operations in the unrolled product finder. Since there is no pipelining every instruction must be FETCHed, DECODEd and EXECUTEd.

Now, creating data and control blocks, the data path is:

![Image of Data Path](https://github.com/OPup/COGiX/blob/master/Lab%20Notes/screenshots/Lab_1_Data_Path_1.png)

###Quartus II and FPGA


