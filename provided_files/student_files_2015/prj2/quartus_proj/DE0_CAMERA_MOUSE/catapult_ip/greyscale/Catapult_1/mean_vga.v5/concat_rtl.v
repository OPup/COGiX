
//------> ./rtl_mgc_ioport.v 
//------------------------------------------------------------------
//                M G C _ I O P O R T _ C O M P S
//------------------------------------------------------------------

//------------------------------------------------------------------
//                       M O D U L E S
//------------------------------------------------------------------

//------------------------------------------------------------------
//-- INPUT ENTITIES
//------------------------------------------------------------------

module mgc_in_wire (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] d;
  input  [width-1:0] z;

  wire   [width-1:0] d;

  assign d = z;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output [width-1:0] d;
  output             lz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;

  wire               vd;
  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;

endmodule
//------------------------------------------------------------------

module mgc_chan_in (ld, vd, d, lz, vz, z, size, req_size, sizez, sizelz);

  parameter integer rscid = 1;
  parameter integer width = 8;
  parameter integer sz_width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;
  output [sz_width-1:0] size;
  input              req_size;
  input  [sz_width-1:0] sizez;
  output             sizelz;


  wire               vd;
  wire   [width-1:0] d;
  wire               lz;
  wire   [sz_width-1:0] size;
  wire               sizelz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;
  assign size = sizez;
  assign sizelz = req_size;

endmodule


//------------------------------------------------------------------
//-- OUTPUT ENTITIES
//------------------------------------------------------------------

module mgc_out_stdreg (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input    [width-1:0] d;
  output   [width-1:0] z;

  wire     [width-1:0] z;

  assign z = d;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  input  [width-1:0] d;
  output             lz;
  output [width-1:0] z;

  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  input  [width-1:0] d;
  output             lz;
  input              vz;
  output [width-1:0] z;

  wire               vd;
  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;
  assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_out_prereg_en (ld, d, lz, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    wire               lz;
    wire   [width-1:0] z;

    assign z = d;
    assign lz = ld;

endmodule

//------------------------------------------------------------------
//-- INOUT ENTITIES
//------------------------------------------------------------------

module mgc_inout_stdreg_en (ldin, din, ldout, dout, lzin, lzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output [width-1:0] din;
    input              ldout;
    input  [width-1:0] dout;
    output             lzin;
    output             lzout;
    inout  [width-1:0] z;

    wire   [width-1:0] din;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign z = ldout ? dout : {width{1'bz}};

endmodule

//------------------------------------------------------------------
module hid_tribuf( I_SIG, ENABLE, O_SIG);
  parameter integer width = 8;

  input [width-1:0] I_SIG;
  input ENABLE;
  inout [width-1:0] O_SIG;

  assign O_SIG = (ENABLE) ? I_SIG : { width{1'bz}};

endmodule
//------------------------------------------------------------------

module mgc_inout_stdreg_wait (ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;
    wire   ldout_and_vzout;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign vdout = vzout ;
    assign ldout_and_vzout = ldout && vzout ;

    hid_tribuf #(width) tb( .I_SIG(dout),
                            .ENABLE(ldout_and_vzout),
                            .O_SIG(z) );

endmodule

//------------------------------------------------------------------

module mgc_inout_buf_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    hid_tribuf #(width) tb( .I_SIG(z_buf),
                            .ENABLE((lzout_buf && (!ldin) && vzout) ),
                            .O_SIG(z)  );

    mgc_out_buf_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFF
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );


endmodule

module mgc_inout_fifo_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer ph_log2 = 3;     // log2(fifo_sz)
    parameter integer pwropt  = 0;     // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               comb;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    assign comb = (lzout_buf && (!ldin) && vzout);

    hid_tribuf #(width) tb2( .I_SIG(z_buf), .ENABLE(comb), .O_SIG(z)  );

    mgc_out_fifo_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
    )
    FIFO
    (
        .clk   (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );

endmodule

//------------------------------------------------------------------
//-- I/O SYNCHRONIZATION ENTITIES
//------------------------------------------------------------------

module mgc_io_sync (ld, lz);

    input  ld;
    output lz;

    assign lz = ld;

endmodule

module mgc_bsync_rdy (rd, rz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 0;

    input  rd;
    output rz;

    wire   rz;

    assign rz = rd;

endmodule

module mgc_bsync_vld (vd, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 0;
    parameter valid = 1;

    output vd;
    input  vz;

    wire   vd;

    assign vd = vz;

endmodule

module mgc_bsync_rv (rd, vd, rz, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 1;

    input  rd;
    output vd;
    output rz;
    input  vz;

    wire   vd;
    wire   rz;

    assign rz = rd;
    assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_sync (ldin, vdin, ldout, vdout);

  input  ldin;
  output vdin;
  input  ldout;
  output vdout;

  wire   vdin;
  wire   vdout;

  assign vdin = ldout;
  assign vdout = ldin;

endmodule

///////////////////////////////////////////////////////////////////////////////
// dummy function used to preserve funccalls for modulario
// it looks like a memory read to the caller
///////////////////////////////////////////////////////////////////////////////
module funccall_inout (d, ad, bd, z, az, bz);

  parameter integer ram_id = 1;
  parameter integer width = 8;
  parameter integer addr_width = 8;

  output [width-1:0]       d;
  input  [addr_width-1:0]  ad;
  input                    bd;
  input  [width-1:0]       z;
  output [addr_width-1:0]  az;
  output                   bz;

  wire   [width-1:0]       d;
  wire   [addr_width-1:0]  az;
  wire                     bz;

  assign d  = z;
  assign az = ad;
  assign bz = bd;

endmodule


///////////////////////////////////////////////////////////////////////////////
// inlinable modular io not otherwise found in mgc_ioport
///////////////////////////////////////////////////////////////////////////////

module modulario_en_in (vd, d, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output             vd;
  output [width-1:0] d;
  input              vz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               vd;

  assign d = z;
  assign vd = vz;

endmodule

//------> ./rtl_mgc_ioport_v2001.v 
//------------------------------------------------------------------

module mgc_out_reg_pos (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(posedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(posedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg_neg (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(negedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(negedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg (clk, en, arst, srst, ld, d, lz, z); // Not Supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;


    generate
    if (ph_clk == 1'b0)
    begin: NEG_EDGE

        mgc_out_reg_neg
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_neg_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    else
    begin: POS_EDGE

        mgc_out_reg_pos
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_pos_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    endgenerate

endmodule




//------------------------------------------------------------------

module mgc_out_buf_wait (clk, en, arst, srst, ld, vd, d, vz, lz, z); // Not supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    output             vd;
    input  [width-1:0] d;
    output             lz;
    input              vz;
    output [width-1:0] z;

    wire               filled;
    wire               filled_next;
    wire   [width-1:0] abuf;
    wire               lbuf;


    assign filled_next = (filled & (~vz)) | (filled & ld) | (ld & (~vz));

    assign lbuf = ld & ~(filled ^ vz);

    assign vd = vz | ~filled;

    assign lz = ld | filled;

    assign z = (filled) ? abuf : d;

    wire dummy;
    wire dummy_bufreg_lz;

    // Output registers:
    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (1'b1),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    STATREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (filled_next),
        .d       (1'b0),       // input d is unused
        .lz      (filled),
        .z       (dummy)            // output z is unused
    );

    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (lbuf),
        .d       (d),
        .lz      (dummy_bufreg_lz),
        .z       (abuf)
    );

endmodule

//------------------------------------------------------------------

module mgc_out_fifo_wait (clk, en, arst, srst, ld, vd, d, lz, vz,  z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1; // clock enable polarity
    parameter         ph_arst = 1'b1; // async reset polarity
    parameter         ph_srst = 1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt


    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;

    wire    [31:0]      size;


      // Output registers:
 mgc_out_fifo_wait_core#(
        .rscid   (rscid),
        .width   (width),
        .sz_width (32),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
        ) CORE (
        .clk (clk),
        .en (en),
        .arst (arst),
        .srst (srst),
        .ld (ld),
        .vd (vd),
        .d (d),
        .lz (lz),
        .vz (vz),
        .z (z),
        .size (size)
        );

endmodule



module mgc_out_fifo_wait_core (clk, en, arst, srst, ld, vd, d, lz, vz,  z, size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // size of port for elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt

   localparam integer  fifo_b = width * fifo_sz;

    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;
    output    [sz_width-1:0]      size;

    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat_pre;
    wire     [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat;
    reg      [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff_pre;
    wire     [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff;
    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] en_l;
    reg      [(((fifo_sz > 0) ? fifo_sz : 1)-1)/8:0] en_l_s;

    reg       [width-1:0] buff_nxt;

    reg                   stat_nxt;
    reg                   stat_before;
    reg                   stat_after;
    reg                   en_l_var;

    integer               i;
    genvar                eni;

    wire [32:0]           size_t;
    reg [31:0]            count;
    reg [31:0]            count_t;
    reg [32:0]            n_elem;
// pragma translate_off
    reg [31:0]            peak;
// pragma translate_on

    wire [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] dummy_statreg_lz;
    wire [( (fifo_b > 0) ? fifo_b : 1)-1:0] dummy_bufreg_lz;

    generate
    if ( fifo_sz > 0 )
    begin: FIFO_REG
      assign vd = vz | ~stat[0];
      assign lz = ld | stat[fifo_sz-1];
      assign size_t = (count - (vz && stat[fifo_sz-1])) + ld;
      assign size = size_t[sz_width-1:0];
      assign z = (stat[fifo_sz-1]) ? buff[fifo_b-1:width*(fifo_sz-1)] : d;

      always @(*)
      begin: FIFOPROC
        n_elem = 33'b0;
        for (i = fifo_sz-1; i >= 0; i = i - 1)
        begin
          if (i != 0)
            stat_before = stat[i-1];
          else
            stat_before = 1'b0;

          if (i != (fifo_sz-1))
            stat_after = stat[i+1];
          else
            stat_after = 1'b1;

          stat_nxt = stat_after &
                    (stat_before | (stat[i] & (~vz)) | (stat[i] & ld) | (ld & (~vz)));

          stat_pre[i] = stat_nxt;
          en_l_var = 1'b1;
          if (!stat_nxt)
            begin
              buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end
          else if (vz && stat_before)
            buff_nxt[0+:width] = buff[width*(i-1)+:width];
          else if (ld && !((vz && stat_before) || ((!vz) && stat[i])))
            buff_nxt = d;
          else
            begin
              if (pwropt == 0)
                buff_nxt[0+:width] = buff[width*i+:width];
              else
                buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end

          if (ph_en != 0)
            en_l[i] = en & en_l_var;
          else
            en_l[i] = en | ~en_l_var;

          buff_pre[width*i+:width] = buff_nxt[0+:width];

          if ((stat_after == 1'b1) && (stat[i] == 1'b0))
            n_elem = ($unsigned(fifo_sz) - 1) - i;
        end

        if (ph_en != 0)
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b1;
        else
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b0;

        for (i = fifo_sz-1; i >= 7; i = i - 1)
        begin
          if ((i%'d2) == 0)
          begin
            if (ph_en != 0)
              en_l_s[(i/8)-1] = en & (stat[i]|stat_pre[i-1]);
            else
              en_l_s[(i/8)-1] = en | ~(stat[i]|stat_pre[i-1]);
          end
        end

        if ( stat[fifo_sz-1] == 1'b0 )
          count_t = 32'b0;
        else if ( stat[0] == 1'b1 )
          count_t = { {(32-ph_log2){1'b0}}, fifo_sz};
        else
          count_t = n_elem[31:0];
        count = count_t;
// pragma translate_off
        if ( peak < count )
          peak = count;
// pragma translate_on
      end

      if (pwropt == 0)
      begin: NOCGFIFO
        // Output registers:
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        STATREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
        );
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_b),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        BUFREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre),
            .lz      (dummy_bufreg_lz[0]),
            .z       (buff)
        );
      end
      else
      begin: CGFIFO
        // Output registers:
        if ( pwropt > 1)
        begin: CGSTATFIFO2
          for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
          begin: pwroptGEN1
            mgc_out_reg
            #(
              .rscid   (rscid),
              .width   (1),
              .ph_clk  (ph_clk),
              .ph_en   (ph_en),
              .ph_arst (ph_arst),
              .ph_srst (ph_srst)
            )
            STATREG
            (
              .clk     (clk),
              .en      (en_l_s[eni/8]),
              .arst    (arst),
              .srst    (srst),
              .ld      (1'b1),
              .d       (stat_pre[eni]),
              .lz      (dummy_statreg_lz[eni]),
              .z       (stat[eni])
            );
          end
        end
        else
        begin: CGSTATFIFO
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          STATREG
          (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
          );
        end
        for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
        begin: pwroptGEN2
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (width),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          BUFREG
          (
            .clk     (clk),
            .en      (en_l[eni]),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre[width*eni+:width]),
            .lz      (dummy_bufreg_lz[eni]),
            .z       (buff[width*eni+:width])
          );
        end
      end
    end
    else
    begin: FEED_THRU
      assign vd = vz;
      assign lz = ld;
      assign z = d;
      assign size = ld && !vz;
    end
    endgenerate

endmodule

//------------------------------------------------------------------
//-- PIPE ENTITIES
//------------------------------------------------------------------
/*
 *
 *             _______________________________________________
 * WRITER    |                                               |          READER
 *           |           MGC_PIPE                            |
 *           |           __________________________          |
 *        --<| vdout  --<| vd ---------------  vz<|-----ldin<|---
 *           |           |      FIFO              |          |
 *        ---|>ldout  ---|>ld ---------------- lz |> ---vdin |>--
 *        ---|>dout -----|>d  ---------------- dz |> ----din |>--
 *           |           |________________________|          |
 *           |_______________________________________________|
 */
// two clock pipe
module mgc_pipe (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, size, req_size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // width of size of elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter integer log2_sz = 3; // log2(fifo_sz)
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer pwropt  = 0; // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output [sz_width-1:0]      size;
    input              req_size;


    mgc_out_fifo_wait_core
    #(
        .rscid    (rscid),
        .width    (width),
        .sz_width (sz_width),
        .fifo_sz  (fifo_sz),
        .ph_clk   (ph_clk),
        .ph_en    (ph_en),
        .ph_arst  (ph_arst),
        .ph_srst  (ph_srst),
        .ph_log2  (log2_sz),
        .pwropt   (pwropt)
    )
    FIFO
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (vdin),
        .vz      (ldin),
        .z       (din),
        .size    (size)
    );

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   oh1015@EEWS104A-004
//  Generated date: Fri Mar 11 15:37:10 2016
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    mean_vga_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module mean_vga_core_fsm (
  clk, en, arst_n, fsm_output, st_for_tr0, st_ACC1_5_tr0
);
  input clk;
  input en;
  input arst_n;
  output [9:0] fsm_output;
  reg [9:0] fsm_output;
  input st_for_tr0;
  input st_ACC1_5_tr0;


  // FSM State Type Declaration for mean_vga_core_fsm_1
  parameter
    st_main = 4'd0,
    st_for = 4'd1,
    st_ACC1 = 4'd2,
    st_ACC1_1 = 4'd3,
    st_ACC1_2 = 4'd4,
    st_ACC1_3 = 4'd5,
    st_ACC1_4 = 4'd6,
    st_ACC1_5 = 4'd7,
    st_main_1 = 4'd8,
    st_main_2 = 4'd9,
    state_x = 4'b0000;

  reg [3:0] state_var;
  reg [3:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : mean_vga_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 10'b1;
        state_var_NS = st_for;
      end
      st_for : begin
        fsm_output = 10'b10;
        if ( st_for_tr0 ) begin
          state_var_NS = st_ACC1;
        end
        else begin
          state_var_NS = st_for;
        end
      end
      st_ACC1 : begin
        fsm_output = 10'b100;
        state_var_NS = st_ACC1_1;
      end
      st_ACC1_1 : begin
        fsm_output = 10'b1000;
        state_var_NS = st_ACC1_2;
      end
      st_ACC1_2 : begin
        fsm_output = 10'b10000;
        state_var_NS = st_ACC1_3;
      end
      st_ACC1_3 : begin
        fsm_output = 10'b100000;
        state_var_NS = st_ACC1_4;
      end
      st_ACC1_4 : begin
        fsm_output = 10'b1000000;
        state_var_NS = st_ACC1_5;
      end
      st_ACC1_5 : begin
        fsm_output = 10'b10000000;
        if ( st_ACC1_5_tr0 ) begin
          state_var_NS = st_main_1;
        end
        else begin
          state_var_NS = st_ACC1;
        end
      end
      st_main_1 : begin
        fsm_output = 10'b100000000;
        state_var_NS = st_main_2;
      end
      st_main_2 : begin
        fsm_output = 10'b1000000000;
        state_var_NS = st_main;
      end
      default : begin
        fsm_output = 10'b0000000000;
        state_var_NS = st_main;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= st_main;
    end
    else if ( en ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    mean_vga_core
// ------------------------------------------------------------------


module mean_vga_core (
  clk, en, arst_n, vin_rsc_mgc_in_wire_d, vout_rsc_mgc_out_stdreg_d
);
  input clk;
  input en;
  input arst_n;
  input [149:0] vin_rsc_mgc_in_wire_d;
  output [29:0] vout_rsc_mgc_out_stdreg_d;
  reg [29:0] vout_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations
  wire [9:0] fsm_output;
  wire and_dcpl_3;
  wire or_dcpl_10;
  wire or_dcpl_16;
  reg [149:0] regs_regs_2_sva;
  reg [149:0] regs_regs_1_sva;
  reg [149:0] regs_regs_3_sva;
  reg [149:0] regs_regs_0_sva;
  reg [149:0] regs_regs_0_lpi_2;
  reg [149:0] regs_regs_2_lpi_2;
  reg [149:0] regs_regs_1_lpi_2;
  reg [149:0] regs_regs_3_lpi_2;
  reg [149:0] regs_regs_4_lpi_2;
  reg [2:0] j_1_sva;
  reg [15:0] grey_1_sva;
  reg [149:0] regs_operator_din_sva;
  reg [149:0] regs_regs_0_lpi_2_dfm;
  reg [149:0] regs_regs_1_lpi_2_dfm;
  reg [149:0] regs_regs_2_lpi_2_dfm;
  reg [149:0] regs_regs_3_lpi_2_dfm;
  reg [149:0] regs_regs_4_lpi_2_dfm;
  reg [2:0] i_2_sva;
  reg or_seb_sva;
  reg [15:0] grey_1_sva_1;
  reg [2:0] i_2_sva_1;
  reg [11:0] ACC1_acc_28_itm;
  wire [12:0] nl_ACC1_acc_28_itm;
  reg [15:0] ACC1_mul_2_itm;
  reg [2:0] ACC1_acc_47_itm;
  reg [2:0] ACC1_acc_44_itm;
  reg [2:0] ACC1_acc_41_itm;
  reg [7:0] ACC1_slc_65_itm;
  reg [2:0] ACC1_acc_38_itm;
  reg [9:0] ACC1_slc_64_itm;
  reg [11:0] ACC1_slc_63_itm;
  reg ACC1_slc_5_itm;
  reg ACC1_slc_itm;
  reg [8:0] ACC1_slc_61_itm_1;
  reg [10:0] ACC1_slc_53_itm_1;
  reg SHIFT_i_1_sva_2_sg1;
  reg [1:0] SHIFT_i_1_sva_3;
  wire or_19_cse;
  reg reg_acc_imod_1_sva_tmp;
  reg reg_acc_17_psp_sva_tmp_2;
  reg [1:0] reg_acc_imod_13_sva_tmp;
  reg [2:0] reg_ACC1_acc_25_psp_sva_tmp_7;
  reg reg_ACC1_acc_21_psp_sva_tmp_8;
  wire [4:0] z_out;
  wire [5:0] nl_z_out;
  wire [4:0] z_out_1;
  wire [4:0] z_out_2;
  wire [15:0] z_out_3;
  wire [31:0] nl_z_out_3;
  wire [11:0] z_out_4;
  wire [12:0] nl_z_out_4;
  wire [2:0] z_out_5;
  wire [3:0] nl_z_out_5;
  wire [149:0] regs_regs_4_lpi_3;
  wire [149:0] SHIFT_if_else_else_else_slc_regs_regs_ctmp_sva;
  wire [2:0] acc_imod_1_sva_mx0w0;
  wire [3:0] nl_acc_imod_1_sva_mx0w0;
  wire [3:0] acc_17_psp_sva_mx0w0;
  wire [4:0] nl_acc_17_psp_sva_mx0w0;
  wire [2:0] acc_imod_13_sva_mx0w0;
  wire [3:0] nl_acc_imod_13_sva_mx0w0;
  wire [11:0] ACC1_acc_25_psp_sva_mx0w0;
  wire [12:0] nl_ACC1_acc_25_psp_sva_mx0w0;
  wire [11:0] ACC1_acc_21_psp_sva_mx0w0;
  wire [12:0] nl_ACC1_acc_21_psp_sva_mx0w0;
  wire [11:0] ACC1_acc_22_psp_sva;
  wire [12:0] nl_ACC1_acc_22_psp_sva;
  wire [11:0] ACC1_acc_24_psp_sva;
  wire [12:0] nl_ACC1_acc_24_psp_sva;
  wire [3:0] acc_1_psp_sva;
  wire [4:0] nl_acc_1_psp_sva;
  wire [2:0] acc_imod_4_sva;
  wire [3:0] nl_acc_imod_4_sva;
  wire [2:0] acc_imod_10_sva;
  wire [3:0] nl_acc_imod_10_sva;
  wire [3:0] acc_5_psp_sva;
  wire [4:0] nl_acc_5_psp_sva;
  wire [3:0] acc_13_psp_sva;
  wire [4:0] nl_acc_13_psp_sva;
  wire [11:0] ACC1_acc_23_psp_sva;
  wire [12:0] nl_ACC1_acc_23_psp_sva;
  wire [2:0] acc_imod_7_sva;
  wire [3:0] nl_acc_imod_7_sva;
  wire [3:0] acc_9_psp_sva;
  wire [4:0] nl_acc_9_psp_sva;
  wire [1:0] ACC1_acc_11_psp_sva;
  wire [2:0] nl_ACC1_acc_11_psp_sva;
  wire nand_1_tmp;
  wire or_48_tmp;
  wire or_49_tmp;
  wire or_50_tmp;
  wire [16:0] ACC1_acc_112_itm;
  wire [17:0] nl_ACC1_acc_112_itm;
  wire nor_6_cse;
  wire or_55_cse;

  wire[9:0] regs_operator_14_mux_nl;
  wire[9:0] regs_operator_13_mux_nl;
  wire[9:0] regs_operator_12_mux_nl;
  wire[9:0] regs_operator_2_mux_nl;
  wire[9:0] regs_operator_1_mux_nl;
  wire[9:0] regs_operator_mux_nl;
  wire[9:0] regs_operator_5_mux_nl;
  wire[9:0] regs_operator_4_mux_nl;
  wire[9:0] regs_operator_3_mux_nl;
  wire[9:0] regs_operator_11_mux_nl;
  wire[9:0] regs_operator_10_mux_nl;
  wire[9:0] regs_operator_9_mux_nl;
  wire[9:0] regs_operator_8_mux_nl;
  wire[9:0] regs_operator_7_mux_nl;
  wire[9:0] regs_operator_6_mux_nl;
  wire[2:0] mux_43_nl;
  wire[2:0] mux_38_nl;
  wire[2:0] mux_39_nl;
  wire[2:0] mux1h_24_nl;
  wire[11:0] mux1h_23_nl;
  wire[9:0] mux_40_nl;
  wire[0:0] mux_44_nl;
  wire[5:0] mux_41_nl;
  wire[1:0] mux_45_nl;

  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_mean_vga_core_fsm_inst_st_for_tr0;
  assign nl_mean_vga_core_fsm_inst_st_for_tr0 = (z_out[2]) & (~ (z_out_5[2]));
  wire [0:0] nl_mean_vga_core_fsm_inst_st_ACC1_5_tr0;
  assign nl_mean_vga_core_fsm_inst_st_ACC1_5_tr0 = ~ ACC1_slc_itm;
  mean_vga_core_fsm mean_vga_core_fsm_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .fsm_output(fsm_output),
      .st_for_tr0(nl_mean_vga_core_fsm_inst_st_for_tr0),
      .st_ACC1_5_tr0(nl_mean_vga_core_fsm_inst_st_ACC1_5_tr0)
    );
  assign nand_1_tmp = ~((SHIFT_i_1_sva_3[1]) & (SHIFT_i_1_sva_3[0]));
  assign or_48_tmp = (~ (SHIFT_i_1_sva_3[1])) | (SHIFT_i_1_sva_3[0]);
  assign or_49_tmp = (SHIFT_i_1_sva_3[1]) | (~ (SHIFT_i_1_sva_3[0]));
  assign or_50_tmp = or_dcpl_10 | SHIFT_i_1_sva_2_sg1;
  assign or_19_cse = or_dcpl_16 | (fsm_output[4]) | (fsm_output[5]) | (fsm_output[2])
      | (fsm_output[7]);
  assign nl_ACC1_acc_112_itm = ({(readslicef_17_16_1((({ACC1_mul_2_itm , 1'b1}) +
      conv_s2s_15_17({(readslicef_15_14_1((conv_s2s_14_15({1'b1 , (readslicef_13_12_1((({(z_out_3[8:0])
      , 2'b0 , reg_acc_imod_1_sva_tmp , 1'b1}) + ({1'b1 , ACC1_slc_53_itm_1 , (~
      reg_acc_17_psp_sva_tmp_2)})))) , 1'b1}) + conv_s2s_13_15({ACC1_slc_63_itm ,
      (~ (reg_acc_imod_13_sva_tmp[0]))})))) , (reg_acc_imod_13_sva_tmp[1])})))) ,
      1'b1}) + ({grey_1_sva , ACC1_slc_5_itm});
  assign ACC1_acc_112_itm = nl_ACC1_acc_112_itm[16:0];
  assign regs_regs_4_lpi_3 = MUX_v_150_2_2({SHIFT_if_else_else_else_slc_regs_regs_ctmp_sva
      , regs_regs_4_lpi_2}, or_dcpl_10 | (~ SHIFT_i_1_sva_2_sg1));
  assign SHIFT_if_else_else_else_slc_regs_regs_ctmp_sva = MUX_v_150_4_2({regs_regs_0_lpi_2
      , regs_regs_1_lpi_2 , regs_regs_2_lpi_2 , regs_regs_3_lpi_2}, z_out_1[1:0]);
  assign nl_acc_imod_1_sva_mx0w0 = conv_s2s_2_3(conv_s2s_1_2(acc_1_psp_sva[1]) +
      conv_u2s_1_2(acc_1_psp_sva[0])) + conv_s2s_2_3(acc_1_psp_sva[3:2]);
  assign acc_imod_1_sva_mx0w0 = nl_acc_imod_1_sva_mx0w0[2:0];
  assign nl_acc_17_psp_sva_mx0w0 = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_25_psp_sva_mx0w0[3])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_25_psp_sva_mx0w0[4])
      , (ACC1_acc_25_psp_sva_mx0w0[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_25_psp_sva_mx0w0[5])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_25_psp_sva_mx0w0[6])
      , (~ (ACC1_acc_25_psp_sva_mx0w0[7]))})))) , (ACC1_acc_25_psp_sva_mx0w0[10])}))))
      , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (ACC1_acc_25_psp_sva_mx0w0[1]))
      , 1'b1}) + conv_u2u_2_3({(ACC1_acc_25_psp_sva_mx0w0[2]) , (~ (ACC1_acc_25_psp_sva_mx0w0[9]))}))))
      , (~ (ACC1_acc_25_psp_sva_mx0w0[11]))})))) + ({3'b101 , (ACC1_acc_25_psp_sva_mx0w0[0])});
  assign acc_17_psp_sva_mx0w0 = nl_acc_17_psp_sva_mx0w0[3:0];
  assign nl_acc_imod_13_sva_mx0w0 = conv_s2s_2_3(conv_s2s_1_2(acc_17_psp_sva_mx0w0[1])
      + conv_u2s_1_2(acc_17_psp_sva_mx0w0[0])) + conv_s2s_2_3(acc_17_psp_sva_mx0w0[3:2]);
  assign acc_imod_13_sva_mx0w0 = nl_acc_imod_13_sva_mx0w0[2:0];
  assign regs_operator_14_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[129:120])
      , (regs_regs_1_lpi_2_dfm[129:120]) , (regs_regs_2_lpi_2_dfm[129:120]) , (regs_regs_3_lpi_2_dfm[129:120])
      , (regs_regs_4_lpi_2_dfm[129:120]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_13_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[139:130])
      , (regs_regs_1_lpi_2_dfm[139:130]) , (regs_regs_2_lpi_2_dfm[139:130]) , (regs_regs_3_lpi_2_dfm[139:130])
      , (regs_regs_4_lpi_2_dfm[139:130]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_12_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[149:140])
      , (regs_regs_1_lpi_2_dfm[149:140]) , (regs_regs_2_lpi_2_dfm[149:140]) , (regs_regs_3_lpi_2_dfm[149:140])
      , (regs_regs_4_lpi_2_dfm[149:140]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign nl_ACC1_acc_25_psp_sva_mx0w0 = conv_u2u_11_12(conv_u2u_10_11(regs_operator_14_mux_nl)
      + conv_u2u_10_11(regs_operator_13_mux_nl)) + conv_u2u_10_12(regs_operator_12_mux_nl);
  assign ACC1_acc_25_psp_sva_mx0w0 = nl_ACC1_acc_25_psp_sva_mx0w0[11:0];
  assign regs_operator_2_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[9:0]) , (regs_regs_1_lpi_2_dfm[9:0])
      , (regs_regs_2_lpi_2_dfm[9:0]) , (regs_regs_3_lpi_2_dfm[9:0]) , (regs_regs_4_lpi_2_dfm[9:0])
      , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_1_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[19:10]) ,
      (regs_regs_1_lpi_2_dfm[19:10]) , (regs_regs_2_lpi_2_dfm[19:10]) , (regs_regs_3_lpi_2_dfm[19:10])
      , (regs_regs_4_lpi_2_dfm[19:10]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[29:20]) , (regs_regs_1_lpi_2_dfm[29:20])
      , (regs_regs_2_lpi_2_dfm[29:20]) , (regs_regs_3_lpi_2_dfm[29:20]) , (regs_regs_4_lpi_2_dfm[29:20])
      , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign nl_ACC1_acc_21_psp_sva_mx0w0 = conv_u2u_11_12(conv_u2u_10_11(regs_operator_2_mux_nl)
      + conv_u2u_10_11(regs_operator_1_mux_nl)) + conv_u2u_10_12(regs_operator_mux_nl);
  assign ACC1_acc_21_psp_sva_mx0w0 = nl_ACC1_acc_21_psp_sva_mx0w0[11:0];
  assign regs_operator_5_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[39:30]) ,
      (regs_regs_1_lpi_2_dfm[39:30]) , (regs_regs_2_lpi_2_dfm[39:30]) , (regs_regs_3_lpi_2_dfm[39:30])
      , (regs_regs_4_lpi_2_dfm[39:30]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_4_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[49:40]) ,
      (regs_regs_1_lpi_2_dfm[49:40]) , (regs_regs_2_lpi_2_dfm[49:40]) , (regs_regs_3_lpi_2_dfm[49:40])
      , (regs_regs_4_lpi_2_dfm[49:40]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_3_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[59:50]) ,
      (regs_regs_1_lpi_2_dfm[59:50]) , (regs_regs_2_lpi_2_dfm[59:50]) , (regs_regs_3_lpi_2_dfm[59:50])
      , (regs_regs_4_lpi_2_dfm[59:50]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign nl_ACC1_acc_22_psp_sva = conv_u2u_11_12(conv_u2u_10_11(regs_operator_5_mux_nl)
      + conv_u2u_10_11(regs_operator_4_mux_nl)) + conv_u2u_10_12(regs_operator_3_mux_nl);
  assign ACC1_acc_22_psp_sva = nl_ACC1_acc_22_psp_sva[11:0];
  assign regs_operator_11_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[99:90]) ,
      (regs_regs_1_lpi_2_dfm[99:90]) , (regs_regs_2_lpi_2_dfm[99:90]) , (regs_regs_3_lpi_2_dfm[99:90])
      , (regs_regs_4_lpi_2_dfm[99:90]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_10_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[109:100])
      , (regs_regs_1_lpi_2_dfm[109:100]) , (regs_regs_2_lpi_2_dfm[109:100]) , (regs_regs_3_lpi_2_dfm[109:100])
      , (regs_regs_4_lpi_2_dfm[109:100]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_9_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[119:110])
      , (regs_regs_1_lpi_2_dfm[119:110]) , (regs_regs_2_lpi_2_dfm[119:110]) , (regs_regs_3_lpi_2_dfm[119:110])
      , (regs_regs_4_lpi_2_dfm[119:110]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign nl_ACC1_acc_24_psp_sva = conv_u2u_11_12(conv_u2u_10_11(regs_operator_11_mux_nl)
      + conv_u2u_10_11(regs_operator_10_mux_nl)) + conv_u2u_10_12(regs_operator_9_mux_nl);
  assign ACC1_acc_24_psp_sva = nl_ACC1_acc_24_psp_sva[11:0];
  assign nl_acc_1_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_21_psp_sva_mx0w0[3])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_21_psp_sva_mx0w0[4])
      , (ACC1_acc_21_psp_sva_mx0w0[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_21_psp_sva_mx0w0[5])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_21_psp_sva_mx0w0[6])
      , (~ (ACC1_acc_21_psp_sva_mx0w0[7]))})))) , (ACC1_acc_21_psp_sva_mx0w0[10])}))))
      , 1'b1}) + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (ACC1_acc_21_psp_sva_mx0w0[1]))
      , 1'b1}) + conv_u2u_2_3({(ACC1_acc_21_psp_sva_mx0w0[2]) , (~ (ACC1_acc_21_psp_sva_mx0w0[9]))}))))
      , (~ (ACC1_acc_21_psp_sva_mx0w0[11]))})))) + ({3'b101 , (ACC1_acc_21_psp_sva_mx0w0[0])});
  assign acc_1_psp_sva = nl_acc_1_psp_sva[3:0];
  assign nl_acc_imod_4_sva = conv_s2s_2_3(conv_s2s_1_2(acc_5_psp_sva[1]) + conv_u2s_1_2(acc_5_psp_sva[0]))
      + conv_s2s_2_3(acc_5_psp_sva[3:2]);
  assign acc_imod_4_sva = nl_acc_imod_4_sva[2:0];
  assign nl_acc_imod_10_sva = conv_s2s_2_3(conv_s2s_1_2(acc_13_psp_sva[1]) + conv_u2s_1_2(acc_13_psp_sva[0]))
      + conv_s2s_2_3(acc_13_psp_sva[3:2]);
  assign acc_imod_10_sva = nl_acc_imod_10_sva[2:0];
  assign nl_acc_5_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_22_psp_sva[3])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_22_psp_sva[4])
      , (ACC1_acc_22_psp_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_22_psp_sva[5])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_22_psp_sva[6])
      , (~ (ACC1_acc_22_psp_sva[7]))})))) , (ACC1_acc_22_psp_sva[10])})))) , 1'b1})
      + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (ACC1_acc_22_psp_sva[1]))
      , 1'b1}) + conv_u2u_2_3({(ACC1_acc_22_psp_sva[2]) , (~ (ACC1_acc_22_psp_sva[9]))}))))
      , (~ (ACC1_acc_22_psp_sva[11]))})))) + ({3'b101 , (ACC1_acc_22_psp_sva[0])});
  assign acc_5_psp_sva = nl_acc_5_psp_sva[3:0];
  assign nl_acc_13_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_24_psp_sva[3])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_24_psp_sva[4])
      , (ACC1_acc_24_psp_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_24_psp_sva[5])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_24_psp_sva[6])
      , (~ (ACC1_acc_24_psp_sva[7]))})))) , (ACC1_acc_24_psp_sva[10])})))) , 1'b1})
      + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (ACC1_acc_24_psp_sva[1]))
      , 1'b1}) + conv_u2u_2_3({(ACC1_acc_24_psp_sva[2]) , (~ (ACC1_acc_24_psp_sva[9]))}))))
      , (~ (ACC1_acc_24_psp_sva[11]))})))) + ({3'b101 , (ACC1_acc_24_psp_sva[0])});
  assign acc_13_psp_sva = nl_acc_13_psp_sva[3:0];
  assign regs_operator_8_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[69:60]) ,
      (regs_regs_1_lpi_2_dfm[69:60]) , (regs_regs_2_lpi_2_dfm[69:60]) , (regs_regs_3_lpi_2_dfm[69:60])
      , (regs_regs_4_lpi_2_dfm[69:60]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_7_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[79:70]) ,
      (regs_regs_1_lpi_2_dfm[79:70]) , (regs_regs_2_lpi_2_dfm[79:70]) , (regs_regs_3_lpi_2_dfm[79:70])
      , (regs_regs_4_lpi_2_dfm[79:70]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign regs_operator_6_mux_nl = MUX_v_10_8_2({(regs_regs_0_lpi_2_dfm[89:80]) ,
      (regs_regs_1_lpi_2_dfm[89:80]) , (regs_regs_2_lpi_2_dfm[89:80]) , (regs_regs_3_lpi_2_dfm[89:80])
      , (regs_regs_4_lpi_2_dfm[89:80]) , 10'b0 , 10'b0 , 10'b0}, i_2_sva);
  assign nl_ACC1_acc_23_psp_sva = conv_u2u_11_12(conv_u2u_10_11(regs_operator_8_mux_nl)
      + conv_u2u_10_11(regs_operator_7_mux_nl)) + conv_u2u_10_12(regs_operator_6_mux_nl);
  assign ACC1_acc_23_psp_sva = nl_ACC1_acc_23_psp_sva[11:0];
  assign nl_acc_imod_7_sva = conv_s2s_2_3(conv_s2s_1_2(acc_9_psp_sva[1]) + conv_u2s_1_2(acc_9_psp_sva[0]))
      + conv_s2s_2_3(acc_9_psp_sva[3:2]);
  assign acc_imod_7_sva = nl_acc_imod_7_sva[2:0];
  assign nl_acc_9_psp_sva = (readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_23_psp_sva[3])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_23_psp_sva[4])
      , (ACC1_acc_23_psp_sva[8])})))) , 1'b1}) + conv_u2u_3_4({(readslicef_3_2_1((conv_u2u_2_3({(~
      (ACC1_acc_23_psp_sva[5])) , 1'b1}) + conv_u2u_2_3({(ACC1_acc_23_psp_sva[6])
      , (~ (ACC1_acc_23_psp_sva[7]))})))) , (ACC1_acc_23_psp_sva[10])})))) , 1'b1})
      + conv_u2u_3_5({(readslicef_3_2_1((conv_u2u_2_3({(~ (ACC1_acc_23_psp_sva[1]))
      , 1'b1}) + conv_u2u_2_3({(ACC1_acc_23_psp_sva[2]) , (~ (ACC1_acc_23_psp_sva[9]))}))))
      , (~ (ACC1_acc_23_psp_sva[11]))})))) + ({3'b101 , (ACC1_acc_23_psp_sva[0])});
  assign acc_9_psp_sva = nl_acc_9_psp_sva[3:0];
  assign nl_ACC1_acc_11_psp_sva = (i_2_sva[2:1]) + 2'b1;
  assign ACC1_acc_11_psp_sva = nl_ACC1_acc_11_psp_sva[1:0];
  assign and_dcpl_3 = ~((fsm_output[9]) | (fsm_output[1]));
  assign or_dcpl_10 = (SHIFT_i_1_sva_3[1]) | (SHIFT_i_1_sva_3[0]);
  assign or_dcpl_16 = (fsm_output[3]) | (fsm_output[6]);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      regs_regs_3_lpi_2 <= 150'b0;
      regs_regs_2_lpi_2 <= 150'b0;
      regs_regs_1_lpi_2 <= 150'b0;
      regs_regs_0_lpi_2 <= 150'b0;
      SHIFT_i_1_sva_3 <= 2'b0;
      vout_rsc_mgc_out_stdreg_d <= 30'b0;
      grey_1_sva <= 16'b0;
      SHIFT_i_1_sva_2_sg1 <= 1'b0;
      regs_regs_4_lpi_2 <= 150'b0;
      regs_operator_din_sva <= 150'b0;
      j_1_sva <= 3'b0;
      i_2_sva <= 3'b0;
      regs_regs_4_lpi_2_dfm <= 150'b0;
      regs_regs_3_lpi_2_dfm <= 150'b0;
      regs_regs_2_lpi_2_dfm <= 150'b0;
      regs_regs_1_lpi_2_dfm <= 150'b0;
      regs_regs_0_lpi_2_dfm <= 150'b0;
      ACC1_slc_itm <= 1'b0;
      ACC1_acc_47_itm <= 3'b0;
      ACC1_slc_5_itm <= 1'b0;
      ACC1_acc_41_itm <= 3'b0;
      ACC1_slc_61_itm_1 <= 9'b0;
      ACC1_acc_44_itm <= 3'b0;
      ACC1_slc_65_itm <= 8'b0;
      ACC1_acc_38_itm <= 3'b0;
      ACC1_acc_28_itm <= 12'b0;
      or_seb_sva <= 1'b0;
      i_2_sva_1 <= 3'b0;
      ACC1_mul_2_itm <= 16'b0;
      ACC1_slc_64_itm <= 10'b0;
      ACC1_slc_53_itm_1 <= 11'b0;
      ACC1_slc_63_itm <= 12'b0;
      grey_1_sva_1 <= 16'b0;
      regs_regs_0_sva <= 150'b0;
      regs_regs_2_sva <= 150'b0;
      regs_regs_1_sva <= 150'b0;
      regs_regs_3_sva <= 150'b0;
      reg_acc_imod_1_sva_tmp <= 1'b0;
      reg_acc_17_psp_sva_tmp_2 <= 1'b0;
      reg_acc_imod_13_sva_tmp <= 2'b0;
      reg_ACC1_acc_25_psp_sva_tmp_7 <= 3'b0;
      reg_ACC1_acc_21_psp_sva_tmp_8 <= 1'b0;
    end
    else begin
      if ( en ) begin
        regs_regs_3_lpi_2 <= MUX1HOT_v_150_3_2({SHIFT_if_else_else_else_slc_regs_regs_ctmp_sva
            , regs_regs_3_lpi_2 , regs_regs_3_sva}, {((~ nand_1_tmp) & (fsm_output[1]))
            , ((nand_1_tmp & (fsm_output[1])) | and_dcpl_3) , (fsm_output[9])});
        regs_regs_2_lpi_2 <= MUX1HOT_v_150_3_2({SHIFT_if_else_else_else_slc_regs_regs_ctmp_sva
            , regs_regs_2_lpi_2 , regs_regs_2_sva}, {((~ or_48_tmp) & (fsm_output[1]))
            , ((or_48_tmp & (fsm_output[1])) | and_dcpl_3) , (fsm_output[9])});
        regs_regs_1_lpi_2 <= MUX1HOT_v_150_3_2({SHIFT_if_else_else_else_slc_regs_regs_ctmp_sva
            , regs_regs_1_lpi_2 , regs_regs_1_sva}, {((~ or_49_tmp) & (fsm_output[1]))
            , ((or_49_tmp & (fsm_output[1])) | and_dcpl_3) , (fsm_output[9])});
        regs_regs_0_lpi_2 <= MUX1HOT_v_150_3_2({regs_operator_din_sva , regs_regs_0_lpi_2
            , regs_regs_0_sva}, {((~ or_50_tmp) & (fsm_output[1])) , ((or_50_tmp
            & (fsm_output[1])) | and_dcpl_3) , (fsm_output[9])});
        SHIFT_i_1_sva_3 <= (z_out[1:0]) & (signext_2_1(fsm_output[1]));
        vout_rsc_mgc_out_stdreg_d <= MUX_v_30_2_2({vout_rsc_mgc_out_stdreg_d , ({((grey_1_sva_1[9:0])
            | ({4'b0 , (grey_1_sva_1[15:10])})) , (grey_1_sva_1[9:6]) , ((grey_1_sva_1[5:0])
            | (grey_1_sva_1[15:10])) , (grey_1_sva_1[9:0])})}, fsm_output[8]);
        grey_1_sva <= (MUX_v_16_2_2({(ACC1_acc_112_itm[16:1]) , grey_1_sva}, ~((fsm_output[7])
            | (fsm_output[0])))) & (signext_16_1(~ (fsm_output[0])));
        SHIFT_i_1_sva_2_sg1 <= ~ (fsm_output[1]);
        regs_regs_4_lpi_2 <= regs_regs_4_lpi_3;
        regs_operator_din_sva <= MUX_v_150_2_2({vin_rsc_mgc_in_wire_d , regs_operator_din_sva},
            fsm_output[1]);
        j_1_sva <= (z_out_2[2:0]) & (signext_3_1(fsm_output[1]));
        i_2_sva <= i_2_sva_1 & (signext_3_1(fsm_output[7]));
        regs_regs_4_lpi_2_dfm <= MUX_v_150_2_2({regs_regs_4_lpi_3 , regs_regs_4_lpi_2_dfm},
            or_19_cse);
        regs_regs_3_lpi_2_dfm <= MUX1HOT_v_150_3_2({SHIFT_if_else_else_else_slc_regs_regs_ctmp_sva
            , regs_regs_3_lpi_2 , regs_regs_3_lpi_2_dfm}, {(~(nand_1_tmp | or_19_cse))
            , (nand_1_tmp & (~ or_19_cse)) , or_19_cse});
        regs_regs_2_lpi_2_dfm <= MUX1HOT_v_150_3_2({SHIFT_if_else_else_else_slc_regs_regs_ctmp_sva
            , regs_regs_2_lpi_2 , regs_regs_2_lpi_2_dfm}, {(~(or_48_tmp | or_19_cse))
            , (or_48_tmp & (~ or_19_cse)) , or_19_cse});
        regs_regs_1_lpi_2_dfm <= MUX1HOT_v_150_3_2({SHIFT_if_else_else_else_slc_regs_regs_ctmp_sva
            , regs_regs_1_lpi_2 , regs_regs_1_lpi_2_dfm}, {(~(or_49_tmp | or_19_cse))
            , (or_49_tmp & (~ or_19_cse)) , or_19_cse});
        regs_regs_0_lpi_2_dfm <= MUX1HOT_v_150_3_2({regs_operator_din_sva , regs_regs_0_lpi_2
            , regs_regs_0_lpi_2_dfm}, {(~(or_50_tmp | or_19_cse)) , (or_50_tmp &
            (~ or_19_cse)) , or_19_cse});
        ACC1_slc_itm <= MUX_s_1_2_2({ACC1_slc_itm , (z_out_5[2])}, fsm_output[2]);
        ACC1_acc_47_itm <= MUX_v_3_2_2({ACC1_acc_47_itm , (conv_u2u_2_3((conv_u2u_1_2(ACC1_acc_21_psp_sva_mx0w0[11])
            + conv_u2u_1_2(ACC1_acc_22_psp_sva[11])) + conv_u2u_1_2(ACC1_acc_24_psp_sva[11]))
            + conv_u2u_1_3(ACC1_acc_25_psp_sva_mx0w0[11]))}, fsm_output[2]);
        ACC1_slc_5_itm <= MUX_s_1_2_2({ACC1_slc_5_itm , (readslicef_3_1_2((({1'b1
            , (acc_imod_13_sva_mx0w0[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_13_sva_mx0w0[1]))
            , (~ (acc_imod_13_sva_mx0w0[2]))}))))}, fsm_output[2]);
        ACC1_acc_41_itm <= MUX_v_3_2_2({ACC1_acc_41_itm , (conv_u2u_2_3((conv_u2u_1_2(ACC1_acc_21_psp_sva_mx0w0[10])
            + conv_u2u_1_2(ACC1_acc_22_psp_sva[10])) + conv_u2u_1_2(ACC1_acc_24_psp_sva[10]))
            + conv_u2u_1_3(ACC1_acc_25_psp_sva_mx0w0[10]))}, fsm_output[2]);
        ACC1_slc_61_itm_1 <= MUX_v_9_2_2({ACC1_slc_61_itm_1 , (z_out_4[9:1])}, fsm_output[2]);
        ACC1_acc_44_itm <= MUX_v_3_2_2({ACC1_acc_44_itm , (conv_u2u_2_3((conv_u2u_1_2(ACC1_acc_21_psp_sva_mx0w0[9])
            + conv_u2u_1_2(ACC1_acc_22_psp_sva[9])) + conv_u2u_1_2(ACC1_acc_24_psp_sva[9]))
            + conv_u2u_1_3(ACC1_acc_25_psp_sva_mx0w0[9]))}, fsm_output[2]);
        ACC1_slc_65_itm <= MUX_v_8_2_2({ACC1_slc_65_itm , (readslicef_9_8_1((({(readslicef_9_8_1((conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(~
            (ACC1_acc_25_psp_sva_mx0w0[7])) , 1'b1 , (~ (ACC1_acc_22_psp_sva[7]))
            , (~ (ACC1_acc_25_psp_sva_mx0w0[4])) , (signext_2_1(~ (ACC1_acc_22_psp_sva[9])))
            , 1'b1}) + conv_s2u_6_8({(readslicef_6_5_1((conv_s2s_5_6({(z_out[4:1])
            , 1'b1}) + conv_s2s_5_6({(readslicef_5_4_1((conv_u2s_3_5(signext_3_2({(~
            (ACC1_acc_24_psp_sva[9])) , 1'b1})) + conv_s2s_3_5({(~ (acc_17_psp_sva_mx0w0[3:2]))
            , (readslicef_3_1_2((({1'b1 , (acc_imod_1_sva_mx0w0[0]) , 1'b1}) + conv_u2s_2_3({(~
            (acc_imod_1_sva_mx0w0[1])) , (~ (acc_imod_1_sva_mx0w0[2]))}))))}))))
            , (readslicef_3_1_2((({1'b1 , (acc_imod_4_sva[0]) , 1'b1}) + conv_u2s_2_3({(~
            (acc_imod_4_sva[1])) , (~ (acc_imod_4_sva[2]))}))))})))) , (ACC1_acc_24_psp_sva[3])}))))
            , 1'b1}) + conv_u2u_7_9({(readslicef_7_6_1((conv_u2u_6_7({(readslicef_6_5_1((conv_u2u_5_6({(~
            (ACC1_acc_24_psp_sva[5])) , (~ (ACC1_acc_21_psp_sva_mx0w0[3])) , (signext_2_1(~
            (ACC1_acc_21_psp_sva_mx0w0[11]))) , 1'b1}) + conv_u2u_5_6({(~ (ACC1_acc_24_psp_sva[7]))
            , (~ (ACC1_acc_21_psp_sva_mx0w0[4])) , (signext_2_1(~ (ACC1_acc_21_psp_sva_mx0w0[5])))
            , (acc_imod_4_sva[2])})))) , 1'b1}) + conv_u2u_6_7({(readslicef_6_5_1((conv_u2u_5_6({(~
            (ACC1_acc_25_psp_sva_mx0w0[5])) , (~ (ACC1_acc_22_psp_sva[3])) , (signext_2_1(~
            (ACC1_acc_21_psp_sva_mx0w0[7]))) , 1'b1}) + conv_u2u_5_6({(~ (ACC1_acc_25_psp_sva_mx0w0[7]))
            , (~ (ACC1_acc_22_psp_sva[4])) , (signext_2_1(~ (ACC1_acc_21_psp_sva_mx0w0[9])))
            , (~ (acc_imod_4_sva[1]))})))) , (~ (ACC1_acc_24_psp_sva[2]))})))) ,
            (~ (acc_imod_10_sva[1]))})))) , 1'b1}) + conv_u2u_8_9({(readslicef_8_7_1((conv_s2u_7_8({(readslicef_7_6_1((conv_s2s_6_7({(readslicef_6_5_1((conv_s2s_4_6({(readslicef_4_3_1((conv_s2s_3_4({(~
            (acc_5_psp_sva[3:2])) , 1'b1}) + conv_s2s_3_4({(~ (acc_13_psp_sva[3:2]))
            , (~ (ACC1_acc_22_psp_sva[2]))})))) , 1'b1}) + conv_u2s_4_6({(readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(~
            (ACC1_acc_24_psp_sva[5])) , 1'b1})) + conv_u2u_3_4(signext_3_2({(~ (ACC1_acc_24_psp_sva[7]))
            , (~ (ACC1_acc_22_psp_sva[1]))}))))) , (~ (acc_5_psp_sva[1]))})))) ,
            1'b1}) + conv_u2s_5_7({(readslicef_5_4_1((conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(~
            (ACC1_acc_25_psp_sva_mx0w0[11])) , 1'b1})) + conv_u2u_3_4(signext_3_2({(~
            (ACC1_acc_25_psp_sva_mx0w0[5])) , (~ (acc_imod_1_sva_mx0w0[1]))})))))
            , 1'b1}) + conv_u2u_4_5({(readslicef_4_3_1((conv_u2u_3_4(signext_3_2({(~
            (ACC1_acc_25_psp_sva_mx0w0[7])) , 1'b1})) + conv_u2u_3_4(signext_3_2({(~
            (ACC1_acc_25_psp_sva_mx0w0[9])) , (~ (acc_1_psp_sva[1]))}))))) , (~ (ACC1_acc_22_psp_sva[4]))}))))
            , (~ (ACC1_acc_24_psp_sva[1]))})))) , 1'b1}) + conv_u2u_7_8({(~ (ACC1_acc_21_psp_sva_mx0w0[7]))
            , 1'b1 , (~ (ACC1_acc_21_psp_sva_mx0w0[5])) , (~ (ACC1_acc_24_psp_sva[3]))
            , (signext_2_1(~ (ACC1_acc_22_psp_sva[11]))) , (~ (acc_13_psp_sva[1]))}))))
            , (readslicef_3_1_2((({1'b1 , (acc_imod_10_sva[0]) , 1'b1}) + conv_u2s_2_3({(~
            (acc_imod_10_sva[1])) , (~ (acc_imod_10_sva[2]))}))))}))))}, fsm_output[2]);
        ACC1_acc_38_itm <= MUX_v_3_2_2({ACC1_acc_38_itm , (conv_u2u_2_3((conv_u2u_1_2(ACC1_acc_21_psp_sva_mx0w0[8])
            + conv_u2u_1_2(ACC1_acc_22_psp_sva[8])) + conv_u2u_1_2(ACC1_acc_24_psp_sva[8]))
            + conv_u2u_1_3(ACC1_acc_25_psp_sva_mx0w0[8]))}, fsm_output[2]);
        ACC1_acc_28_itm <= nl_ACC1_acc_28_itm[11:0];
        or_seb_sva <= ((ACC1_acc_11_psp_sva[0]) & (~((ACC1_acc_11_psp_sva[1]) | (i_2_sva[0]))))
            | ((ACC1_acc_11_psp_sva[0]) & (i_2_sva[0]) & (~ (ACC1_acc_11_psp_sva[1])))
            | ((ACC1_acc_11_psp_sva[1]) & (i_2_sva[0]) & (~ (ACC1_acc_11_psp_sva[0])))
            | ((ACC1_acc_11_psp_sva[1]) & (ACC1_acc_11_psp_sva[0]) & (~ (i_2_sva[0])));
        i_2_sva_1 <= MUX_v_3_2_2({(z_out_2[2:0]) , i_2_sva_1}, or_dcpl_16 | (fsm_output[4])
            | (fsm_output[5]));
        ACC1_mul_2_itm <= MUX_v_16_2_2({ACC1_mul_2_itm , z_out_3}, fsm_output[3]);
        ACC1_slc_64_itm <= MUX_v_10_2_2({ACC1_slc_64_itm , (z_out_4[10:1])}, fsm_output[4]);
        ACC1_slc_53_itm_1 <= MUX_v_11_2_2({ACC1_slc_53_itm_1 , (readslicef_12_11_1((conv_s2s_11_12({1'b1
            , ACC1_slc_61_itm_1 , 1'b1}) + ({(z_out_3[7:0]) , 2'b0 , reg_ACC1_acc_21_psp_sva_tmp_8
            , (reg_ACC1_acc_25_psp_sva_tmp_7[1])}))))}, fsm_output[5]);
        ACC1_slc_63_itm <= readslicef_13_12_1((({(z_out_3[11:0]) , 1'b1}) + conv_s2s_11_13({ACC1_slc_64_itm
            , (~ (reg_ACC1_acc_25_psp_sva_tmp_7[2]))})));
        grey_1_sva_1 <= ACC1_acc_112_itm[16:1];
        regs_regs_0_sva <= MUX_v_150_2_2({regs_regs_0_sva , regs_regs_0_lpi_2_dfm},
            fsm_output[7]);
        regs_regs_2_sva <= MUX_v_150_2_2({regs_regs_2_sva , regs_regs_2_lpi_2_dfm},
            fsm_output[7]);
        regs_regs_1_sva <= MUX_v_150_2_2({regs_regs_1_sva , regs_regs_1_lpi_2_dfm},
            fsm_output[7]);
        regs_regs_3_sva <= MUX_v_150_2_2({regs_regs_3_sva , regs_regs_3_lpi_2_dfm},
            fsm_output[7]);
        reg_acc_imod_1_sva_tmp <= MUX_s_1_2_2({reg_acc_imod_1_sva_tmp , (acc_imod_1_sva_mx0w0[2])},
            fsm_output[2]);
        reg_acc_17_psp_sva_tmp_2 <= MUX_s_1_2_2({reg_acc_17_psp_sva_tmp_2 , (acc_17_psp_sva_mx0w0[1])},
            fsm_output[2]);
        reg_acc_imod_13_sva_tmp <= MUX_v_2_2_2({reg_acc_imod_13_sva_tmp , (acc_imod_13_sva_mx0w0[2:1])},
            fsm_output[2]);
        reg_ACC1_acc_25_psp_sva_tmp_7 <= MUX_v_3_2_2({reg_ACC1_acc_25_psp_sva_tmp_7
            , (ACC1_acc_25_psp_sva_mx0w0[4:2])}, fsm_output[2]);
        reg_ACC1_acc_21_psp_sva_tmp_8 <= MUX_s_1_2_2({reg_ACC1_acc_21_psp_sva_tmp_8
            , (ACC1_acc_21_psp_sva_mx0w0[3])}, fsm_output[2]);
      end
    end
  end
  assign nl_ACC1_acc_28_itm  = conv_u2s_10_12({(ACC1_acc_23_psp_sva[11]) , (conv_u2u_8_9({(ACC1_acc_23_psp_sva[11])
      , 1'b0 , (ACC1_acc_23_psp_sva[11]) , 1'b0 , (ACC1_acc_23_psp_sva[11]) , 1'b0
      , (signext_2_1(ACC1_acc_23_psp_sva[7]))}) + conv_u2u_8_9(readslicef_9_8_1((({(ACC1_acc_23_psp_sva[9])
      , 1'b0 , (ACC1_acc_23_psp_sva[9]) , 1'b0 , (ACC1_acc_23_psp_sva[9]) , 1'b0
      , (signext_2_1(ACC1_acc_23_psp_sva[5])) , 1'b1}) + conv_u2u_8_9({(readslicef_8_7_1((conv_u2u_7_8({(ACC1_acc_23_psp_sva[7])
      , 1'b0 , (ACC1_acc_23_psp_sva[5]) , 1'b0 , (signext_2_1(ACC1_acc_23_psp_sva[9]))
      , 1'b1}) + conv_u2u_6_8({(ACC1_acc_23_psp_sva[6]) , 1'b0 , (ACC1_acc_23_psp_sva[6])
      , 1'b0 , (ACC1_acc_23_psp_sva[6]) , (acc_imod_7_sva[1])})))) , (~ (readslicef_3_1_2((({1'b1
      , (acc_imod_7_sva[0]) , 1'b1}) + conv_u2s_2_3({(~ (acc_imod_7_sva[1])) , (~
      (acc_imod_7_sva[2]))})))))})))))}) + conv_s2s_10_12(conv_u2s_9_10({(ACC1_acc_23_psp_sva[10])
      , 1'b0 , (ACC1_acc_23_psp_sva[10]) , 1'b0 , (ACC1_acc_23_psp_sva[10]) , 1'b0
      , (ACC1_acc_23_psp_sva[10]) , 1'b0 , (ACC1_acc_23_psp_sva[10])}) + conv_s2s_8_10(readslicef_9_8_1((conv_u2s_8_9({(ACC1_acc_23_psp_sva[8])
      , 1'b0 , (ACC1_acc_23_psp_sva[8]) , 1'b0 , (ACC1_acc_23_psp_sva[8]) , 1'b0
      , (ACC1_acc_23_psp_sva[8]) , 1'b1}) + conv_s2s_7_9({(readslicef_7_6_1((conv_s2s_5_7({(readslicef_5_4_1((conv_s2s_4_5({(z_out_1[3:1])
      , 1'b1}) + conv_s2s_3_5({(acc_9_psp_sva[3:2]) , (ACC1_acc_23_psp_sva[4])}))))
      , 1'b1}) + conv_u2s_5_7({(ACC1_acc_23_psp_sva[7]) , (ACC1_acc_23_psp_sva[4])
      , (signext_2_1(ACC1_acc_23_psp_sva[11])) , (acc_9_psp_sva[1])})))) , (~ (acc_imod_7_sva[2]))})))));
  assign mux_43_nl = MUX_v_3_2_2({({(readslicef_3_2_1((conv_u2u_2_3({(~ (ACC1_acc_21_psp_sva_mx0w0[1]))
      , 1'b1}) + conv_u2u_2_3({(~ (ACC1_acc_21_psp_sva_mx0w0[2])) , (~ (ACC1_acc_21_psp_sva_mx0w0[4]))}))))
      , 1'b1}) , ({SHIFT_i_1_sva_2_sg1 , SHIFT_i_1_sva_3})}, fsm_output[1]);
  assign nl_z_out = conv_u2u_3_5(mux_43_nl) + conv_s2u_3_5(({(~ (acc_1_psp_sva[3:2]))
      , (ACC1_acc_22_psp_sva[3])}) | (signext_3_1(fsm_output[1])));
  assign z_out = nl_z_out[4:0];
  assign mux_38_nl = MUX_v_3_2_2({({(ACC1_acc_23_psp_sva[3]) , (ACC1_acc_23_psp_sva[1])
      , 1'b1}) , ({{1{SHIFT_i_1_sva_3[1]}}, SHIFT_i_1_sva_3})}, fsm_output[1]);
  assign z_out_1 = signext_5_4(conv_u2s_3_4(mux_38_nl) + conv_s2s_3_4({1'b1 , (({(ACC1_acc_23_psp_sva[2])
      , (ACC1_acc_23_psp_sva[3])}) | (signext_2_1(fsm_output[1])))}));
  assign mux_39_nl = MUX_v_3_2_2({j_1_sva , i_2_sva}, fsm_output[2]);
  assign z_out_2 = {1'b0, conv_u2u_3_4(mux_39_nl) + 4'b1};
  assign nor_6_cse = ~((fsm_output[2]) | (fsm_output[4]) | (fsm_output[5]) | (fsm_output[6])
      | (fsm_output[7]));
  assign or_55_cse = nor_6_cse | (fsm_output[3]);
  assign mux1h_24_nl = MUX1HOT_v_3_6_2({(conv_u2u_2_3((conv_u2u_1_2(ACC1_acc_21_psp_sva_mx0w0[6])
      + conv_u2u_1_2(ACC1_acc_22_psp_sva[6])) + conv_u2u_1_2(ACC1_acc_24_psp_sva[6]))
      + conv_u2u_1_3(ACC1_acc_25_psp_sva_mx0w0[6])) , ({{2{or_seb_sva}}, or_seb_sva})
      , ACC1_acc_38_itm , ACC1_acc_44_itm , ACC1_acc_41_itm , ACC1_acc_47_itm}, {(fsm_output[2])
      , (fsm_output[3]) , (fsm_output[4]) , (fsm_output[5]) , (fsm_output[6]) , (fsm_output[7])});
  assign mux1h_23_nl = MUX1HOT_v_12_4_2({12'b111111101011 , ACC1_acc_28_itm , 12'b111110101011
      , 12'b111010101011}, {((fsm_output[2]) | (fsm_output[5])) , (fsm_output[3])
      , ((fsm_output[4]) | (fsm_output[7])) , (fsm_output[6])});
  assign nl_z_out_3 = conv_s2s_6_16({(or_seb_sva & nor_6_cse) , or_55_cse , or_55_cse
      , (mux1h_24_nl)}) * conv_s2s_12_16(mux1h_23_nl);
  assign z_out_3 = nl_z_out_3[15:0];
  assign mux_40_nl = MUX_v_10_2_2({(signext_10_9(readslicef_10_9_1((conv_s2s_9_10({(z_out_3[7:0])
      , 1'b1}) + conv_u2s_8_10({(readslicef_3_2_1((conv_u2u_2_3({(~ (ACC1_acc_22_psp_sva[7]))
      , 1'b1}) + conv_u2u_2_3({(~ (ACC1_acc_24_psp_sva[7])) , 1'b1})))) , (readslicef_6_5_1((({1'b1
      , (~ (ACC1_acc_21_psp_sva_mx0w0[7])) , (~ (ACC1_acc_24_psp_sva[4])) , (signext_2_1(~
      (ACC1_acc_22_psp_sva[5]))) , 1'b1}) + ({1'b1 , (~ (ACC1_acc_22_psp_sva[5]))
      , (~ (ACC1_acc_25_psp_sva_mx0w0[3])) , (signext_2_1(~ (ACC1_acc_22_psp_sva[7])))
      , (~ (ACC1_acc_24_psp_sva[4]))})))) , (acc_imod_10_sva[2])}))))) , (z_out_3[9:0])},
      fsm_output[4]);
  assign mux_44_nl = MUX_s_1_2_2({(~ (ACC1_acc_25_psp_sva_mx0w0[1])) , (~ (reg_ACC1_acc_25_psp_sva_tmp_7[0]))},
      fsm_output[4]);
  assign mux_41_nl = MUX_v_6_2_2({6'b101000 , (ACC1_slc_65_itm[7:2])}, fsm_output[4]);
  assign mux_45_nl = MUX_v_2_2_2({(signext_2_1(~ (ACC1_acc_24_psp_sva[11]))) , (ACC1_slc_65_itm[1:0])},
      fsm_output[4]);
  assign nl_z_out_4 = conv_u2u_11_12({(mux_40_nl) , (mux_44_nl)}) + conv_u2u_9_12({(mux_41_nl)
      , (mux_45_nl) , 1'b1});
  assign z_out_4 = nl_z_out_4[11:0];
  assign nl_z_out_5 = (z_out_2[2:0]) + 3'b11;
  assign z_out_5 = nl_z_out_5[2:0];

  function [15:0] readslicef_17_16_1;
    input [16:0] vector;
    reg [16:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_17_16_1 = tmp[15:0];
  end
  endfunction


  function [13:0] readslicef_15_14_1;
    input [14:0] vector;
    reg [14:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_15_14_1 = tmp[13:0];
  end
  endfunction


  function [11:0] readslicef_13_12_1;
    input [12:0] vector;
    reg [12:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_13_12_1 = tmp[11:0];
  end
  endfunction


  function [149:0] MUX_v_150_2_2;
    input [299:0] inputs;
    input [0:0] sel;
    reg [149:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[299:150];
      end
      1'b1 : begin
        result = inputs[149:0];
      end
      default : begin
        result = inputs[299:150];
      end
    endcase
    MUX_v_150_2_2 = result;
  end
  endfunction


  function [149:0] MUX_v_150_4_2;
    input [599:0] inputs;
    input [1:0] sel;
    reg [149:0] result;
  begin
    case (sel)
      2'b00 : begin
        result = inputs[599:450];
      end
      2'b01 : begin
        result = inputs[449:300];
      end
      2'b10 : begin
        result = inputs[299:150];
      end
      2'b11 : begin
        result = inputs[149:0];
      end
      default : begin
        result = inputs[599:450];
      end
    endcase
    MUX_v_150_4_2 = result;
  end
  endfunction


  function [3:0] readslicef_5_4_1;
    input [4:0] vector;
    reg [4:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_5_4_1 = tmp[3:0];
  end
  endfunction


  function [2:0] readslicef_4_3_1;
    input [3:0] vector;
    reg [3:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_4_3_1 = tmp[2:0];
  end
  endfunction


  function [1:0] readslicef_3_2_1;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_3_2_1 = tmp[1:0];
  end
  endfunction


  function [9:0] MUX_v_10_8_2;
    input [79:0] inputs;
    input [2:0] sel;
    reg [9:0] result;
  begin
    case (sel)
      3'b000 : begin
        result = inputs[79:70];
      end
      3'b001 : begin
        result = inputs[69:60];
      end
      3'b010 : begin
        result = inputs[59:50];
      end
      3'b011 : begin
        result = inputs[49:40];
      end
      3'b100 : begin
        result = inputs[39:30];
      end
      3'b101 : begin
        result = inputs[29:20];
      end
      3'b110 : begin
        result = inputs[19:10];
      end
      3'b111 : begin
        result = inputs[9:0];
      end
      default : begin
        result = inputs[79:70];
      end
    endcase
    MUX_v_10_8_2 = result;
  end
  endfunction


  function [149:0] MUX1HOT_v_150_3_2;
    input [449:0] inputs;
    input [2:0] sel;
    reg [149:0] result;
    integer i;
  begin
    result = inputs[0+:150] & {150{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*150+:150] & {150{sel[i]}});
    MUX1HOT_v_150_3_2 = result;
  end
  endfunction


  function [1:0] signext_2_1;
    input [0:0] vector;
  begin
    signext_2_1= {{1{vector[0]}}, vector};
  end
  endfunction


  function [29:0] MUX_v_30_2_2;
    input [59:0] inputs;
    input [0:0] sel;
    reg [29:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[59:30];
      end
      1'b1 : begin
        result = inputs[29:0];
      end
      default : begin
        result = inputs[59:30];
      end
    endcase
    MUX_v_30_2_2 = result;
  end
  endfunction


  function [15:0] MUX_v_16_2_2;
    input [31:0] inputs;
    input [0:0] sel;
    reg [15:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[31:16];
      end
      1'b1 : begin
        result = inputs[15:0];
      end
      default : begin
        result = inputs[31:16];
      end
    endcase
    MUX_v_16_2_2 = result;
  end
  endfunction


  function [15:0] signext_16_1;
    input [0:0] vector;
  begin
    signext_16_1= {{15{vector[0]}}, vector};
  end
  endfunction


  function [2:0] signext_3_1;
    input [0:0] vector;
  begin
    signext_3_1= {{2{vector[0]}}, vector};
  end
  endfunction


  function [0:0] MUX_s_1_2_2;
    input [1:0] inputs;
    input [0:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[1:1];
      end
      1'b1 : begin
        result = inputs[0:0];
      end
      default : begin
        result = inputs[1:1];
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function [2:0] MUX_v_3_2_2;
    input [5:0] inputs;
    input [0:0] sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[5:3];
      end
      1'b1 : begin
        result = inputs[2:0];
      end
      default : begin
        result = inputs[5:3];
      end
    endcase
    MUX_v_3_2_2 = result;
  end
  endfunction


  function [0:0] readslicef_3_1_2;
    input [2:0] vector;
    reg [2:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_3_1_2 = tmp[0:0];
  end
  endfunction


  function [8:0] MUX_v_9_2_2;
    input [17:0] inputs;
    input [0:0] sel;
    reg [8:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[17:9];
      end
      1'b1 : begin
        result = inputs[8:0];
      end
      default : begin
        result = inputs[17:9];
      end
    endcase
    MUX_v_9_2_2 = result;
  end
  endfunction


  function [7:0] MUX_v_8_2_2;
    input [15:0] inputs;
    input [0:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[15:8];
      end
      1'b1 : begin
        result = inputs[7:0];
      end
      default : begin
        result = inputs[15:8];
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function [7:0] readslicef_9_8_1;
    input [8:0] vector;
    reg [8:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_9_8_1 = tmp[7:0];
  end
  endfunction


  function [6:0] readslicef_8_7_1;
    input [7:0] vector;
    reg [7:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_8_7_1 = tmp[6:0];
  end
  endfunction


  function [4:0] readslicef_6_5_1;
    input [5:0] vector;
    reg [5:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_6_5_1 = tmp[4:0];
  end
  endfunction


  function [2:0] signext_3_2;
    input [1:0] vector;
  begin
    signext_3_2= {{1{vector[1]}}, vector};
  end
  endfunction


  function [5:0] readslicef_7_6_1;
    input [6:0] vector;
    reg [6:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_7_6_1 = tmp[5:0];
  end
  endfunction


  function [9:0] MUX_v_10_2_2;
    input [19:0] inputs;
    input [0:0] sel;
    reg [9:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[19:10];
      end
      1'b1 : begin
        result = inputs[9:0];
      end
      default : begin
        result = inputs[19:10];
      end
    endcase
    MUX_v_10_2_2 = result;
  end
  endfunction


  function [10:0] MUX_v_11_2_2;
    input [21:0] inputs;
    input [0:0] sel;
    reg [10:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[21:11];
      end
      1'b1 : begin
        result = inputs[10:0];
      end
      default : begin
        result = inputs[21:11];
      end
    endcase
    MUX_v_11_2_2 = result;
  end
  endfunction


  function [10:0] readslicef_12_11_1;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_12_11_1 = tmp[10:0];
  end
  endfunction


  function [1:0] MUX_v_2_2_2;
    input [3:0] inputs;
    input [0:0] sel;
    reg [1:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[3:2];
      end
      1'b1 : begin
        result = inputs[1:0];
      end
      default : begin
        result = inputs[3:2];
      end
    endcase
    MUX_v_2_2_2 = result;
  end
  endfunction


  function [4:0] signext_5_4;
    input [3:0] vector;
  begin
    signext_5_4= {{1{vector[3]}}, vector};
  end
  endfunction


  function [2:0] MUX1HOT_v_3_6_2;
    input [17:0] inputs;
    input [5:0] sel;
    reg [2:0] result;
    integer i;
  begin
    result = inputs[0+:3] & {3{sel[0]}};
    for( i = 1; i < 6; i = i + 1 )
      result = result | (inputs[i*3+:3] & {3{sel[i]}});
    MUX1HOT_v_3_6_2 = result;
  end
  endfunction


  function [11:0] MUX1HOT_v_12_4_2;
    input [47:0] inputs;
    input [3:0] sel;
    reg [11:0] result;
    integer i;
  begin
    result = inputs[0+:12] & {12{sel[0]}};
    for( i = 1; i < 4; i = i + 1 )
      result = result | (inputs[i*12+:12] & {12{sel[i]}});
    MUX1HOT_v_12_4_2 = result;
  end
  endfunction


  function [8:0] readslicef_10_9_1;
    input [9:0] vector;
    reg [9:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_10_9_1 = tmp[8:0];
  end
  endfunction


  function [9:0] signext_10_9;
    input [8:0] vector;
  begin
    signext_10_9= {{1{vector[8]}}, vector};
  end
  endfunction


  function [5:0] MUX_v_6_2_2;
    input [11:0] inputs;
    input [0:0] sel;
    reg [5:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[11:6];
      end
      1'b1 : begin
        result = inputs[5:0];
      end
      default : begin
        result = inputs[11:6];
      end
    endcase
    MUX_v_6_2_2 = result;
  end
  endfunction


  function signed [16:0] conv_s2s_15_17 ;
    input signed [14:0]  vector ;
  begin
    conv_s2s_15_17 = {{2{vector[14]}}, vector};
  end
  endfunction


  function signed [14:0] conv_s2s_14_15 ;
    input signed [13:0]  vector ;
  begin
    conv_s2s_14_15 = {vector[13], vector};
  end
  endfunction


  function signed [14:0] conv_s2s_13_15 ;
    input signed [12:0]  vector ;
  begin
    conv_s2s_13_15 = {{2{vector[12]}}, vector};
  end
  endfunction


  function signed [2:0] conv_s2s_2_3 ;
    input signed [1:0]  vector ;
  begin
    conv_s2s_2_3 = {vector[1], vector};
  end
  endfunction


  function signed [1:0] conv_s2s_1_2 ;
    input signed [0:0]  vector ;
  begin
    conv_s2s_1_2 = {vector[0], vector};
  end
  endfunction


  function signed [1:0] conv_u2s_1_2 ;
    input [0:0]  vector ;
  begin
    conv_u2s_1_2 = {1'b0, vector};
  end
  endfunction


  function  [4:0] conv_u2u_4_5 ;
    input [3:0]  vector ;
  begin
    conv_u2u_4_5 = {1'b0, vector};
  end
  endfunction


  function  [3:0] conv_u2u_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_4 = {1'b0, vector};
  end
  endfunction


  function  [2:0] conv_u2u_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2u_2_3 = {1'b0, vector};
  end
  endfunction


  function  [4:0] conv_u2u_3_5 ;
    input [2:0]  vector ;
  begin
    conv_u2u_3_5 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2u_11_12 = {1'b0, vector};
  end
  endfunction


  function  [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
  end
  endfunction


  function  [11:0] conv_u2u_10_12 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_12 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [1:0] conv_u2u_1_2 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_2 = {1'b0, vector};
  end
  endfunction


  function  [2:0] conv_u2u_1_3 ;
    input [0:0]  vector ;
  begin
    conv_u2u_1_3 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [2:0] conv_u2s_2_3 ;
    input [1:0]  vector ;
  begin
    conv_u2s_2_3 = {1'b0, vector};
  end
  endfunction


  function  [8:0] conv_u2u_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2u_8_9 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_s2u_6_8 ;
    input signed [5:0]  vector ;
  begin
    conv_s2u_6_8 = {{2{vector[5]}}, vector};
  end
  endfunction


  function signed [5:0] conv_s2s_5_6 ;
    input signed [4:0]  vector ;
  begin
    conv_s2s_5_6 = {vector[4], vector};
  end
  endfunction


  function signed [4:0] conv_u2s_3_5 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_5 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [4:0] conv_s2s_3_5 ;
    input signed [2:0]  vector ;
  begin
    conv_s2s_3_5 = {{2{vector[2]}}, vector};
  end
  endfunction


  function  [8:0] conv_u2u_7_9 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_9 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_7 = {1'b0, vector};
  end
  endfunction


  function  [5:0] conv_u2u_5_6 ;
    input [4:0]  vector ;
  begin
    conv_u2u_5_6 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_s2u_7_8 ;
    input signed [6:0]  vector ;
  begin
    conv_s2u_7_8 = {vector[6], vector};
  end
  endfunction


  function signed [6:0] conv_s2s_6_7 ;
    input signed [5:0]  vector ;
  begin
    conv_s2s_6_7 = {vector[5], vector};
  end
  endfunction


  function signed [5:0] conv_s2s_4_6 ;
    input signed [3:0]  vector ;
  begin
    conv_s2s_4_6 = {{2{vector[3]}}, vector};
  end
  endfunction


  function signed [3:0] conv_s2s_3_4 ;
    input signed [2:0]  vector ;
  begin
    conv_s2s_3_4 = {vector[2], vector};
  end
  endfunction


  function signed [5:0] conv_u2s_4_6 ;
    input [3:0]  vector ;
  begin
    conv_u2s_4_6 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [6:0] conv_u2s_5_7 ;
    input [4:0]  vector ;
  begin
    conv_u2s_5_7 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [11:0] conv_s2s_11_12 ;
    input signed [10:0]  vector ;
  begin
    conv_s2s_11_12 = {vector[10], vector};
  end
  endfunction


  function signed [12:0] conv_s2s_11_13 ;
    input signed [10:0]  vector ;
  begin
    conv_s2s_11_13 = {{2{vector[10]}}, vector};
  end
  endfunction


  function signed [11:0] conv_u2s_10_12 ;
    input [9:0]  vector ;
  begin
    conv_u2s_10_12 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [7:0] conv_u2u_6_8 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_8 = {{2{1'b0}}, vector};
  end
  endfunction


  function signed [11:0] conv_s2s_10_12 ;
    input signed [9:0]  vector ;
  begin
    conv_s2s_10_12 = {{2{vector[9]}}, vector};
  end
  endfunction


  function signed [9:0] conv_u2s_9_10 ;
    input [8:0]  vector ;
  begin
    conv_u2s_9_10 = {1'b0, vector};
  end
  endfunction


  function signed [9:0] conv_s2s_8_10 ;
    input signed [7:0]  vector ;
  begin
    conv_s2s_8_10 = {{2{vector[7]}}, vector};
  end
  endfunction


  function signed [8:0] conv_u2s_8_9 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_9 = {1'b0, vector};
  end
  endfunction


  function signed [8:0] conv_s2s_7_9 ;
    input signed [6:0]  vector ;
  begin
    conv_s2s_7_9 = {{2{vector[6]}}, vector};
  end
  endfunction


  function signed [6:0] conv_s2s_5_7 ;
    input signed [4:0]  vector ;
  begin
    conv_s2s_5_7 = {{2{vector[4]}}, vector};
  end
  endfunction


  function signed [4:0] conv_s2s_4_5 ;
    input signed [3:0]  vector ;
  begin
    conv_s2s_4_5 = {vector[3], vector};
  end
  endfunction


  function  [4:0] conv_s2u_3_5 ;
    input signed [2:0]  vector ;
  begin
    conv_s2u_3_5 = {{2{vector[2]}}, vector};
  end
  endfunction


  function signed [3:0] conv_u2s_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_4 = {1'b0, vector};
  end
  endfunction


  function signed [15:0] conv_s2s_6_16 ;
    input signed [5:0]  vector ;
  begin
    conv_s2s_6_16 = {{10{vector[5]}}, vector};
  end
  endfunction


  function signed [15:0] conv_s2s_12_16 ;
    input signed [11:0]  vector ;
  begin
    conv_s2s_12_16 = {{4{vector[11]}}, vector};
  end
  endfunction


  function signed [9:0] conv_s2s_9_10 ;
    input signed [8:0]  vector ;
  begin
    conv_s2s_9_10 = {vector[8], vector};
  end
  endfunction


  function signed [9:0] conv_u2s_8_10 ;
    input [7:0]  vector ;
  begin
    conv_u2s_8_10 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [11:0] conv_u2u_9_12 ;
    input [8:0]  vector ;
  begin
    conv_u2u_9_12 = {{3{1'b0}}, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    mean_vga
//  Generated from file(s):
//    7) $PROJECT_HOME/../../../../catapult_proj/vga_blur/blur.c
// ------------------------------------------------------------------


module mean_vga (
  vin_rsc_z, vout_rsc_z, clk, en, arst_n
);
  input [149:0] vin_rsc_z;
  output [29:0] vout_rsc_z;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire [149:0] vin_rsc_mgc_in_wire_d;
  wire [29:0] vout_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire #(.rscid(1),
  .width(150)) vin_rsc_mgc_in_wire (
      .d(vin_rsc_mgc_in_wire_d),
      .z(vin_rsc_z)
    );
  mgc_out_stdreg #(.rscid(2),
  .width(30)) vout_rsc_mgc_out_stdreg (
      .d(vout_rsc_mgc_out_stdreg_d),
      .z(vout_rsc_z)
    );
  mean_vga_core mean_vga_core_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .vin_rsc_mgc_in_wire_d(vin_rsc_mgc_in_wire_d),
      .vout_rsc_mgc_out_stdreg_d(vout_rsc_mgc_out_stdreg_d)
    );
endmodule



