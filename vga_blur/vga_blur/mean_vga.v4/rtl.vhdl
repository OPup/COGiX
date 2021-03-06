-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    2011a.126 Production Release
--  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
-- 
--  Generated by:   oh1015@EEWS104A-006
--  Generated date: Tue Mar 08 14:42:49 2016
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    mean_vga_core_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;
USE work.mean_vga_mux_pkg.ALL;


ENTITY mean_vga_core_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    en : IN STD_LOGIC;
    arst_n : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    st_SHIFT_tr0 : IN STD_LOGIC;
    st_FRAME_2_tr0 : IN STD_LOGIC
  );
END mean_vga_core_fsm;

ARCHITECTURE v4 OF mean_vga_core_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for mean_vga_core_fsm_1
  TYPE mean_vga_core_fsm_1_ST IS (st_main, st_FRAME, st_SHIFT, st_FRAME_1, st_FRAME_2);

  SIGNAL state_var : mean_vga_core_fsm_1_ST;
  SIGNAL state_var_NS : mean_vga_core_fsm_1_ST;

BEGIN
  -- Default Constant Signal Assignments

  mean_vga_core_fsm_1 : PROCESS (st_SHIFT_tr0, st_FRAME_2_tr0, state_var)
  BEGIN
    CASE state_var IS
      WHEN st_main =>
        fsm_output <= STD_LOGIC_VECTOR'("00001");
        state_var_NS <= st_FRAME;
      WHEN st_FRAME =>
        fsm_output <= STD_LOGIC_VECTOR'("00010");
        state_var_NS <= st_SHIFT;
      WHEN st_SHIFT =>
        fsm_output <= STD_LOGIC_VECTOR'("00100");
        IF ( st_SHIFT_tr0 = '1' ) THEN
          state_var_NS <= st_FRAME_1;
        ELSE
          state_var_NS <= st_SHIFT;
        END IF;
      WHEN st_FRAME_1 =>
        fsm_output <= STD_LOGIC_VECTOR'("01000");
        state_var_NS <= st_FRAME_2;
      WHEN st_FRAME_2 =>
        fsm_output <= STD_LOGIC_VECTOR'("10000");
        IF ( st_FRAME_2_tr0 = '1' ) THEN
          state_var_NS <= st_main;
        ELSE
          state_var_NS <= st_FRAME;
        END IF;
      WHEN OTHERS =>
        fsm_output <= "00000";
        state_var_NS <= st_main;
    END CASE;
  END PROCESS mean_vga_core_fsm_1;

  mean_vga_core_fsm_1_REG : PROCESS (clk, arst_n)
  BEGIN
    IF ( arst_n = '0' ) THEN
      state_var <= st_main;
    ELSIF clk'event AND ( clk = '1' ) THEN
      IF ( en = '1' ) THEN
        state_var <= state_var_NS;
      END IF;
    END IF;
  END PROCESS mean_vga_core_fsm_1_REG;

END v4;

-- ------------------------------------------------------------------
--  Design Unit:    mean_vga_core
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;
USE work.mean_vga_mux_pkg.ALL;


ENTITY mean_vga_core IS
  PORT(
    clk : IN STD_LOGIC;
    en : IN STD_LOGIC;
    arst_n : IN STD_LOGIC;
    vin_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (749 DOWNTO 0);
    vout_rsc_mgc_out_stdreg_d : OUT STD_LOGIC_VECTOR (149 DOWNTO 0)
  );
END mean_vga_core;

ARCHITECTURE v4 OF mean_vga_core IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL vout_rsc_mgc_out_stdreg_d_drv : STD_LOGIC_VECTOR (149 DOWNTO 0);

  -- Interconnect Declarations
  SIGNAL fsm_output : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL regs_regs_0_1_lpi_2 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg1_lpi_2 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg2_lpi_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_1_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg3_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg5_lpi_2 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg6_lpi_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg4_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg7_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg9_lpi_2 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg10_lpi_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg8_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg11_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg13_lpi_2 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg14_lpi_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg12_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg15_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg17_lpi_2 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg18_lpi_2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg16_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg19_lpi_2 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL FRAME_p_1_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL regs_regs_0_1_lpi_3 : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL regs_operator_din_1_sva : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL regs_regs_0_1_lpi_3_dfm : STD_LOGIC_VECTOR (29 DOWNTO 0);
  SIGNAL equal_tmp : STD_LOGIC;
  SIGNAL equal_tmp_1 : STD_LOGIC;
  SIGNAL equal_tmp_2 : STD_LOGIC;
  SIGNAL equal_tmp_3 : STD_LOGIC;
  SIGNAL io_read_vout_rsc_d_sdt_sg19_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg18_lpi_2_dfm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg17_lpi_2_dfm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg16_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg15_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg14_lpi_2_dfm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg13_lpi_2_dfm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg12_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg11_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg10_lpi_2_dfm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg9_lpi_2_dfm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg8_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg7_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg6_lpi_2_dfm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg5_lpi_2_dfm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg4_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg3_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg2_lpi_2_dfm : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg1_lpi_2_dfm : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_1_lpi_2_dfm : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL FRAME_p_1_sva_1 : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL FRAME_slc_itm : STD_LOGIC;
  SIGNAL SHIFT_i_1_sva_2_sg1 : STD_LOGIC;
  SIGNAL SHIFT_i_1_sva_3 : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL and_13_cse : STD_LOGIC;
  SIGNAL nor_9_cse : STD_LOGIC;
  SIGNAL nor_7_cse : STD_LOGIC;
  SIGNAL nor_8_cse : STD_LOGIC;
  SIGNAL FRAME_acc_7_psp_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL z_out : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg19_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg18_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg17_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg16_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg15_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg14_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg13_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg12_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg11_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg10_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg9_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg8_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg7_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg6_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg5_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg4_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg3_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg2_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_sg1_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL io_read_vout_rsc_d_sdt_1_lpi_2_dfm_mx0 : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL FRAME_or_3_psp_sva : STD_LOGIC_VECTOR (5 DOWNTO 0);
  SIGNAL FRAME_or_psp_sva : STD_LOGIC_VECTOR (9 DOWNTO 0);
  SIGNAL FRAME_acc_6_psp_sva : STD_LOGIC_VECTOR (11 DOWNTO 0);
  SIGNAL acc_imod_1_sva : STD_LOGIC_VECTOR (2 DOWNTO 0);
  SIGNAL acc_1_psp_sva : STD_LOGIC_VECTOR (3 DOWNTO 0);
  SIGNAL or_161_tmp : STD_LOGIC;
  SIGNAL and_cse : STD_LOGIC;
  SIGNAL and_34_cse : STD_LOGIC;

  SIGNAL mux_47_nl : STD_LOGIC_VECTOR (2 DOWNTO 0);
  COMPONENT mean_vga_core_fsm
    PORT(
      clk : IN STD_LOGIC;
      en : IN STD_LOGIC;
      arst_n : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      st_SHIFT_tr0 : IN STD_LOGIC;
      st_FRAME_2_tr0 : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL mean_vga_core_fsm_inst_fsm_output : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL mean_vga_core_fsm_inst_st_SHIFT_tr0 : STD_LOGIC;
  SIGNAL mean_vga_core_fsm_inst_st_FRAME_2_tr0 : STD_LOGIC;

BEGIN
  -- Default Constant Signal Assignments

  -- Output Reader Assignments
  vout_rsc_mgc_out_stdreg_d <= vout_rsc_mgc_out_stdreg_d_drv;

  mean_vga_core_fsm_inst : mean_vga_core_fsm
    PORT MAP(
      clk => clk,
      en => en,
      arst_n => arst_n,
      fsm_output => mean_vga_core_fsm_inst_fsm_output,
      st_SHIFT_tr0 => mean_vga_core_fsm_inst_st_SHIFT_tr0,
      st_FRAME_2_tr0 => mean_vga_core_fsm_inst_st_FRAME_2_tr0
    );
  fsm_output <= mean_vga_core_fsm_inst_fsm_output;
  mean_vga_core_fsm_inst_st_SHIFT_tr0 <= z_out(2);
  mean_vga_core_fsm_inst_st_FRAME_2_tr0 <= NOT FRAME_slc_itm;

  or_161_tmp <= (SHIFT_i_1_sva_3(0)) OR (SHIFT_i_1_sva_3(1)) OR SHIFT_i_1_sva_2_sg1;
  and_cse <= (NOT or_161_tmp) AND (fsm_output(2));
  and_34_cse <= or_161_tmp AND (fsm_output(2));
  nor_9_cse <= NOT((FRAME_p_1_sva(1)) OR (FRAME_p_1_sva(0)));
  nor_7_cse <= NOT((FRAME_p_1_sva(2)) OR (FRAME_p_1_sva(1)));
  nor_8_cse <= NOT((FRAME_p_1_sva(2)) OR (FRAME_p_1_sva(0)));
  io_read_vout_rsc_d_sdt_sg19_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg19_lpi_2
      & FRAME_or_psp_sva, equal_tmp_3);
  io_read_vout_rsc_d_sdt_sg18_lpi_2_dfm_mx0 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg18_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 6)), equal_tmp_3);
  io_read_vout_rsc_d_sdt_sg17_lpi_2_dfm_mx0 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg17_lpi_2
      & FRAME_or_3_psp_sva, equal_tmp_3);
  io_read_vout_rsc_d_sdt_sg16_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg16_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 0)), equal_tmp_3);
  io_read_vout_rsc_d_sdt_sg15_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg15_lpi_2
      & FRAME_or_psp_sva, equal_tmp_2);
  io_read_vout_rsc_d_sdt_sg14_lpi_2_dfm_mx0 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg14_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 6)), equal_tmp_2);
  io_read_vout_rsc_d_sdt_sg13_lpi_2_dfm_mx0 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg13_lpi_2
      & FRAME_or_3_psp_sva, equal_tmp_2);
  io_read_vout_rsc_d_sdt_sg12_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg12_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 0)), equal_tmp_2);
  io_read_vout_rsc_d_sdt_sg11_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg11_lpi_2
      & FRAME_or_psp_sva, equal_tmp_1);
  io_read_vout_rsc_d_sdt_sg10_lpi_2_dfm_mx0 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg10_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 6)), equal_tmp_1);
  io_read_vout_rsc_d_sdt_sg9_lpi_2_dfm_mx0 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg9_lpi_2
      & FRAME_or_3_psp_sva, equal_tmp_1);
  io_read_vout_rsc_d_sdt_sg8_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg8_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 0)), equal_tmp_1);
  io_read_vout_rsc_d_sdt_sg7_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg7_lpi_2
      & FRAME_or_psp_sva, equal_tmp);
  io_read_vout_rsc_d_sdt_sg6_lpi_2_dfm_mx0 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg6_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 6)), equal_tmp);
  io_read_vout_rsc_d_sdt_sg5_lpi_2_dfm_mx0 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg5_lpi_2
      & FRAME_or_3_psp_sva, equal_tmp);
  io_read_vout_rsc_d_sdt_sg4_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg4_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 0)), equal_tmp);
  io_read_vout_rsc_d_sdt_sg3_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg3_lpi_2
      & FRAME_or_psp_sva, and_13_cse);
  io_read_vout_rsc_d_sdt_sg2_lpi_2_dfm_mx0 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg2_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 6)), and_13_cse);
  io_read_vout_rsc_d_sdt_sg1_lpi_2_dfm_mx0 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg1_lpi_2
      & FRAME_or_3_psp_sva, and_13_cse);
  io_read_vout_rsc_d_sdt_1_lpi_2_dfm_mx0 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_1_lpi_2
      & (FRAME_acc_7_psp_sva(9 DOWNTO 0)), and_13_cse);
  FRAME_acc_7_psp_sva <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED(TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(11))
      & STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(11))
      & TO_STDLOGICVECTOR('0') & TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(11)) & TO_STDLOGICVECTOR('0')
      & TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(11)) & TO_STDLOGICVECTOR('0') & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(FRAME_acc_6_psp_sva(7),
      1),2))), 9) + CONV_UNSIGNED(UNSIGNED(readslice(STD_LOGIC_VECTOR(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(9))
      & TO_STDLOGICVECTOR('0') & TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(9)) & TO_STDLOGICVECTOR('0')
      & TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(9)) & TO_STDLOGICVECTOR('0') & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(FRAME_acc_6_psp_sva(5),
      1),2)) & TO_STDLOGICVECTOR('1')) + CONV_UNSIGNED(UNSIGNED((readslice(STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(7))
      & TO_STDLOGICVECTOR('0') & TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(5)) & TO_STDLOGICVECTOR('0')
      & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(FRAME_acc_6_psp_sva(9), 1),2)) &
      TO_STDLOGICVECTOR('1')), 8) + CONV_UNSIGNED(UNSIGNED'((FRAME_acc_6_psp_sva(6))
      & '0' & (FRAME_acc_6_psp_sva(6)) & '0' & (FRAME_acc_6_psp_sva(6)) & (acc_imod_1_sva(1))),
      8), 8)), 1, 7)) & TO_STDLOGICVECTOR(NOT (readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'('1'
      & (acc_imod_1_sva(0)) & '1') + CONV_SIGNED(UNSIGNED'((NOT (acc_imod_1_sva(1)))
      & (NOT (acc_imod_1_sva(2)))), 3), 3)), 2)))), 9), 9)), 1, 8)), 9), 9))), 12)
      + CONV_SIGNED(CONV_SIGNED(UNSIGNED'((FRAME_acc_6_psp_sva(10)) & '0' & (FRAME_acc_6_psp_sva(10))
      & '0' & (FRAME_acc_6_psp_sva(10)) & '0' & (FRAME_acc_6_psp_sva(10)) & '0' &
      (FRAME_acc_6_psp_sva(10))), 10) + CONV_SIGNED(SIGNED(readslice(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED'((FRAME_acc_6_psp_sva(8))
      & '0' & (FRAME_acc_6_psp_sva(8)) & '0' & (FRAME_acc_6_psp_sva(8)) & '0' & (FRAME_acc_6_psp_sva(8))
      & '1'), 9) + CONV_SIGNED(SIGNED((readslice(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED((readslice(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED((readslice(STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(UNSIGNED'((FRAME_acc_6_psp_sva(3))
      & (FRAME_acc_6_psp_sva(1)) & '1'), 4) + CONV_SIGNED(SIGNED'('1' & (FRAME_acc_6_psp_sva(2))
      & (FRAME_acc_6_psp_sva(3))), 4), 4)), 1, 3)) & TO_STDLOGICVECTOR('1')), 5)
      + CONV_SIGNED(SIGNED((acc_1_psp_sva(3 DOWNTO 2)) & TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(4))),
      5), 5)), 1, 4)) & TO_STDLOGICVECTOR('1')), 7) + CONV_SIGNED(UNSIGNED(TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(7))
      & TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(4)) & STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(FRAME_acc_6_psp_sva(11),
      1),2)) & TO_STDLOGICVECTOR(acc_1_psp_sva(1))), 7), 7)), 1, 6)) & TO_STDLOGICVECTOR(NOT
      (acc_imod_1_sva(2)))), 9), 9)), 1, 8)), 10), 12), 12));
  FRAME_or_3_psp_sva <= (FRAME_acc_7_psp_sva(5 DOWNTO 0)) OR STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(FRAME_acc_7_psp_sva(11
      DOWNTO 10)),6));
  FRAME_or_psp_sva <= (FRAME_acc_7_psp_sva(9 DOWNTO 0)) OR (STD_LOGIC_VECTOR'("0000")
      & STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(FRAME_acc_7_psp_sva(11 DOWNTO 10)),6)));
  FRAME_acc_6_psp_sva <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(regs_regs_0_1_lpi_3_dfm(9
      DOWNTO 0)), 11) + CONV_UNSIGNED(UNSIGNED(regs_regs_0_1_lpi_3_dfm(19 DOWNTO
      10)), 11), 12) + CONV_UNSIGNED(UNSIGNED(regs_regs_0_1_lpi_3_dfm(29 DOWNTO 20)),
      12), 12));
  acc_imod_1_sva <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(CONV_SIGNED(CONV_SIGNED(acc_1_psp_sva(1),
      1), 2) + CONV_SIGNED(CONV_UNSIGNED(acc_1_psp_sva(0), 1), 2), 3) + CONV_SIGNED(SIGNED(acc_1_psp_sva(3
      DOWNTO 2)), 3), 3));
  acc_1_psp_sva <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(readslice(STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((readslice(STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED((readslice(STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'((NOT
      (FRAME_acc_6_psp_sva(3))) & '1'), 3) + CONV_UNSIGNED(UNSIGNED'((FRAME_acc_6_psp_sva(4))
      & (FRAME_acc_6_psp_sva(8))), 3), 3)), 1, 2)) & TO_STDLOGICVECTOR('1')), 4)
      + CONV_UNSIGNED(UNSIGNED((readslice(STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'((NOT
      (FRAME_acc_6_psp_sva(5))) & '1'), 3) + CONV_UNSIGNED(UNSIGNED'((FRAME_acc_6_psp_sva(6))
      & (NOT (FRAME_acc_6_psp_sva(7)))), 3), 3)), 1, 2)) & TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(10))),
      4), 4)), 1, 3)) & TO_STDLOGICVECTOR('1')), 5) + CONV_UNSIGNED(UNSIGNED((readslice(STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED'((NOT
      (FRAME_acc_6_psp_sva(1))) & '1'), 3) + CONV_UNSIGNED(UNSIGNED'((FRAME_acc_6_psp_sva(2))
      & (NOT (FRAME_acc_6_psp_sva(9)))), 3), 3)), 1, 2)) & TO_STDLOGICVECTOR(NOT
      (FRAME_acc_6_psp_sva(11)))), 5), 5)), 1, 4)) + SIGNED(STD_LOGIC_VECTOR'("101")
      & TO_STDLOGICVECTOR(FRAME_acc_6_psp_sva(0))), 4));
  and_13_cse <= (NOT(equal_tmp_2 OR equal_tmp_1)) AND (NOT(equal_tmp OR equal_tmp_3));
  PROCESS (clk, arst_n)
  BEGIN
    IF ( arst_n = '0' ) THEN
      FRAME_p_1_sva <= STD_LOGIC_VECTOR'("000");
      io_read_vout_rsc_d_sdt_1_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg1_lpi_2 <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_sg2_lpi_2 <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg3_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg4_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg5_lpi_2 <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_sg6_lpi_2 <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg7_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg8_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg9_lpi_2 <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_sg10_lpi_2 <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg11_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg12_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg13_lpi_2 <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_sg14_lpi_2 <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg15_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg16_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg17_lpi_2 <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_sg18_lpi_2 <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg19_lpi_2 <= STD_LOGIC_VECTOR'("0000000000");
      vout_rsc_mgc_out_stdreg_d_drv <= STD_LOGIC_VECTOR'("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
      SHIFT_i_1_sva_2_sg1 <= '0';
      SHIFT_i_1_sva_3 <= STD_LOGIC_VECTOR'("00");
      regs_regs_0_1_lpi_3 <= STD_LOGIC_VECTOR'("000000000000000000000000000000");
      regs_regs_0_1_lpi_2 <= STD_LOGIC_VECTOR'("000000000000000000000000000000");
      regs_operator_din_1_sva <= STD_LOGIC_VECTOR'("000000000000000000000000000000");
      equal_tmp <= '0';
      equal_tmp_1 <= '0';
      equal_tmp_2 <= '0';
      equal_tmp_3 <= '0';
      regs_regs_0_1_lpi_3_dfm <= STD_LOGIC_VECTOR'("000000000000000000000000000000");
      FRAME_slc_itm <= '0';
      FRAME_p_1_sva_1 <= STD_LOGIC_VECTOR'("000");
      io_read_vout_rsc_d_sdt_sg19_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg18_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg17_lpi_2_dfm <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_sg16_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg15_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg14_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg13_lpi_2_dfm <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_sg12_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg11_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg10_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg9_lpi_2_dfm <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_sg8_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg7_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg6_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg5_lpi_2_dfm <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_sg4_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg3_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
      io_read_vout_rsc_d_sdt_sg2_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000");
      io_read_vout_rsc_d_sdt_sg1_lpi_2_dfm <= STD_LOGIC_VECTOR'("000000");
      io_read_vout_rsc_d_sdt_1_lpi_2_dfm <= STD_LOGIC_VECTOR'("0000000000");
    ELSIF clk'EVENT AND ( clk = '1' ) THEN
      IF ( en = '1' ) THEN
        FRAME_p_1_sva <= (MUX_v_3_2_2(FRAME_p_1_sva_1 & FRAME_p_1_sva, NOT((fsm_output(4))
            OR (fsm_output(0))))) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(NOT
            (fsm_output(0)), 1),3));
        io_read_vout_rsc_d_sdt_1_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_1_lpi_2
            & io_read_vout_rsc_d_sdt_1_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg1_lpi_2 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg1_lpi_2
            & io_read_vout_rsc_d_sdt_sg1_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg2_lpi_2 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg2_lpi_2
            & io_read_vout_rsc_d_sdt_sg2_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg3_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg3_lpi_2
            & io_read_vout_rsc_d_sdt_sg3_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg4_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg4_lpi_2
            & io_read_vout_rsc_d_sdt_sg4_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg5_lpi_2 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg5_lpi_2
            & io_read_vout_rsc_d_sdt_sg5_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg6_lpi_2 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg6_lpi_2
            & io_read_vout_rsc_d_sdt_sg6_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg7_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg7_lpi_2
            & io_read_vout_rsc_d_sdt_sg7_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg8_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg8_lpi_2
            & io_read_vout_rsc_d_sdt_sg8_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg9_lpi_2 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg9_lpi_2
            & io_read_vout_rsc_d_sdt_sg9_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg10_lpi_2 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg10_lpi_2
            & io_read_vout_rsc_d_sdt_sg10_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg11_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg11_lpi_2
            & io_read_vout_rsc_d_sdt_sg11_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg12_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg12_lpi_2
            & io_read_vout_rsc_d_sdt_sg12_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg13_lpi_2 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg13_lpi_2
            & io_read_vout_rsc_d_sdt_sg13_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg14_lpi_2 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg14_lpi_2
            & io_read_vout_rsc_d_sdt_sg14_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg15_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg15_lpi_2
            & io_read_vout_rsc_d_sdt_sg15_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg16_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg16_lpi_2
            & io_read_vout_rsc_d_sdt_sg16_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg17_lpi_2 <= MUX_v_6_2_2(io_read_vout_rsc_d_sdt_sg17_lpi_2
            & io_read_vout_rsc_d_sdt_sg17_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg18_lpi_2 <= MUX_v_4_2_2(io_read_vout_rsc_d_sdt_sg18_lpi_2
            & io_read_vout_rsc_d_sdt_sg18_lpi_2_dfm, fsm_output(4));
        io_read_vout_rsc_d_sdt_sg19_lpi_2 <= MUX_v_10_2_2(io_read_vout_rsc_d_sdt_sg19_lpi_2
            & io_read_vout_rsc_d_sdt_sg19_lpi_2_dfm, fsm_output(4));
        vout_rsc_mgc_out_stdreg_d_drv <= MUX_v_150_2_2(vout_rsc_mgc_out_stdreg_d_drv
            & (io_read_vout_rsc_d_sdt_sg19_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_sg18_lpi_2_dfm_mx0
            & io_read_vout_rsc_d_sdt_sg17_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_sg16_lpi_2_dfm_mx0
            & io_read_vout_rsc_d_sdt_sg15_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_sg14_lpi_2_dfm_mx0
            & io_read_vout_rsc_d_sdt_sg13_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_sg12_lpi_2_dfm_mx0
            & io_read_vout_rsc_d_sdt_sg11_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_sg10_lpi_2_dfm_mx0
            & io_read_vout_rsc_d_sdt_sg9_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_sg8_lpi_2_dfm_mx0
            & io_read_vout_rsc_d_sdt_sg7_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_sg6_lpi_2_dfm_mx0
            & io_read_vout_rsc_d_sdt_sg5_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_sg4_lpi_2_dfm_mx0
            & io_read_vout_rsc_d_sdt_sg3_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_sg2_lpi_2_dfm_mx0
            & io_read_vout_rsc_d_sdt_sg1_lpi_2_dfm_mx0 & io_read_vout_rsc_d_sdt_1_lpi_2_dfm_mx0),
            fsm_output(3));
        SHIFT_i_1_sva_2_sg1 <= NOT (fsm_output(2));
        SHIFT_i_1_sva_3 <= (z_out(1 DOWNTO 0)) AND STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(fsm_output(2),
            1),2));
        regs_regs_0_1_lpi_3 <= MUX1HOT_v_30_4_2(regs_regs_0_1_lpi_2 & regs_operator_din_1_sva
            & regs_regs_0_1_lpi_3 & regs_regs_0_1_lpi_3_dfm, STD_LOGIC_VECTOR'((fsm_output(0))
            & and_cse & (and_34_cse OR (NOT((fsm_output(4)) OR (fsm_output(2)) OR
            (fsm_output(0))))) & (fsm_output(4))));
        regs_regs_0_1_lpi_2 <= regs_regs_0_1_lpi_3_dfm;
        regs_operator_din_1_sva <= MUX1HOT_v_30_6_2((vin_rsc_mgc_in_wire_d(29 DOWNTO
            0)) & (vin_rsc_mgc_in_wire_d(179 DOWNTO 150)) & (vin_rsc_mgc_in_wire_d(329
            DOWNTO 300)) & (vin_rsc_mgc_in_wire_d(479 DOWNTO 450)) & (vin_rsc_mgc_in_wire_d(629
            DOWNTO 600)) & regs_operator_din_1_sva, STD_LOGIC_VECTOR'((NOT((FRAME_p_1_sva(2))
            OR (FRAME_p_1_sva(1)) OR (FRAME_p_1_sva(0)) OR (fsm_output(2)))) & ((FRAME_p_1_sva(0))
            AND nor_7_cse AND (NOT (fsm_output(2)))) & ((FRAME_p_1_sva(1)) AND nor_8_cse
            AND (NOT (fsm_output(2)))) & ((FRAME_p_1_sva(1)) AND (FRAME_p_1_sva(0))
            AND (NOT (FRAME_p_1_sva(2))) AND (NOT (fsm_output(2)))) & ((FRAME_p_1_sva(2))
            AND nor_9_cse AND (NOT (fsm_output(2)))) & (fsm_output(2))));
        equal_tmp <= (FRAME_p_1_sva(0)) AND nor_7_cse;
        equal_tmp_1 <= (FRAME_p_1_sva(1)) AND nor_8_cse;
        equal_tmp_2 <= (FRAME_p_1_sva(1)) AND (FRAME_p_1_sva(0)) AND (NOT (FRAME_p_1_sva(2)));
        equal_tmp_3 <= (FRAME_p_1_sva(2)) AND nor_9_cse;
        regs_regs_0_1_lpi_3_dfm <= MUX1HOT_v_30_3_2(regs_regs_0_1_lpi_3_dfm & regs_operator_din_1_sva
            & regs_regs_0_1_lpi_3, STD_LOGIC_VECTOR'((NOT (fsm_output(2))) & and_cse
            & and_34_cse));
        FRAME_slc_itm <= readindex(STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED(z_out(2 DOWNTO
            0)) + CONV_SIGNED(UNSIGNED'("11"), 3), 3)), 2);
        FRAME_p_1_sva_1 <= z_out(2 DOWNTO 0);
        io_read_vout_rsc_d_sdt_sg19_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg19_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg18_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg18_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg17_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg17_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg16_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg16_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg15_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg15_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg14_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg14_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg13_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg13_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg12_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg12_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg11_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg11_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg10_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg10_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg9_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg9_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg8_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg8_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg7_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg7_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg6_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg6_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg5_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg5_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg4_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg4_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg3_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg3_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg2_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg2_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_sg1_lpi_2_dfm <= io_read_vout_rsc_d_sdt_sg1_lpi_2_dfm_mx0;
        io_read_vout_rsc_d_sdt_1_lpi_2_dfm <= io_read_vout_rsc_d_sdt_1_lpi_2_dfm_mx0;
      END IF;
    END IF;
  END PROCESS;
  mux_47_nl <= MUX_v_3_2_2((TO_STDLOGICVECTOR(SHIFT_i_1_sva_2_sg1) & SHIFT_i_1_sva_3)
      & FRAME_p_1_sva, fsm_output(3));
  z_out <= STD_LOGIC_VECTOR(CONV_UNSIGNED(CONV_UNSIGNED(UNSIGNED(mux_47_nl), 4) +
      CONV_UNSIGNED(SIGNED'((fsm_output(2)) & '1'), 4), 4));
END v4;

-- ------------------------------------------------------------------
--  Design Unit:    mean_vga
--  Generated from file(s):
--    7) $PROJECT_HOME/../provided_files/student_files_2015/prj2/catapult_proj/vga_blur/blur.c
-- ------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;
USE work.mean_vga_mux_pkg.ALL;


ENTITY mean_vga IS
  PORT(
    vin_rsc_z : IN STD_LOGIC_VECTOR (749 DOWNTO 0);
    vout_rsc_z : OUT STD_LOGIC_VECTOR (149 DOWNTO 0);
    clk : IN STD_LOGIC;
    en : IN STD_LOGIC;
    arst_n : IN STD_LOGIC
  );
END mean_vga;

ARCHITECTURE v4 OF mean_vga IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL vin_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (749 DOWNTO 0);
  SIGNAL vout_rsc_mgc_out_stdreg_d : STD_LOGIC_VECTOR (149 DOWNTO 0);

  SIGNAL vin_rsc_mgc_in_wire_d_1 : STD_LOGIC_VECTOR (749 DOWNTO 0);
  SIGNAL vin_rsc_mgc_in_wire_z : STD_LOGIC_VECTOR (749 DOWNTO 0);

  SIGNAL vout_rsc_mgc_out_stdreg_d_1 : STD_LOGIC_VECTOR (149 DOWNTO 0);
  SIGNAL vout_rsc_mgc_out_stdreg_z : STD_LOGIC_VECTOR (149 DOWNTO 0);

  COMPONENT mean_vga_core
    PORT(
      clk : IN STD_LOGIC;
      en : IN STD_LOGIC;
      arst_n : IN STD_LOGIC;
      vin_rsc_mgc_in_wire_d : IN STD_LOGIC_VECTOR (749 DOWNTO 0);
      vout_rsc_mgc_out_stdreg_d : OUT STD_LOGIC_VECTOR (149 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL mean_vga_core_inst_vin_rsc_mgc_in_wire_d : STD_LOGIC_VECTOR (749 DOWNTO
      0);
  SIGNAL mean_vga_core_inst_vout_rsc_mgc_out_stdreg_d : STD_LOGIC_VECTOR (149 DOWNTO
      0);

BEGIN
  -- Default Constant Signal Assignments

  vin_rsc_mgc_in_wire : mgc_hls.mgc_ioport_comps.mgc_in_wire
    GENERIC MAP(
      rscid => 1,
      width => 750
      )
    PORT MAP(
      d => vin_rsc_mgc_in_wire_d_1,
      z => vin_rsc_mgc_in_wire_z
    );
  vin_rsc_mgc_in_wire_d <= vin_rsc_mgc_in_wire_d_1;
  vin_rsc_mgc_in_wire_z <= vin_rsc_z;

  vout_rsc_mgc_out_stdreg : mgc_hls.mgc_ioport_comps.mgc_out_stdreg
    GENERIC MAP(
      rscid => 2,
      width => 150
      )
    PORT MAP(
      d => vout_rsc_mgc_out_stdreg_d_1,
      z => vout_rsc_mgc_out_stdreg_z
    );
  vout_rsc_mgc_out_stdreg_d_1 <= vout_rsc_mgc_out_stdreg_d;
  vout_rsc_z <= vout_rsc_mgc_out_stdreg_z;

  mean_vga_core_inst : mean_vga_core
    PORT MAP(
      clk => clk,
      en => en,
      arst_n => arst_n,
      vin_rsc_mgc_in_wire_d => mean_vga_core_inst_vin_rsc_mgc_in_wire_d,
      vout_rsc_mgc_out_stdreg_d => mean_vga_core_inst_vout_rsc_mgc_out_stdreg_d
    );
  mean_vga_core_inst_vin_rsc_mgc_in_wire_d <= vin_rsc_mgc_in_wire_d;
  vout_rsc_mgc_out_stdreg_d <= mean_vga_core_inst_vout_rsc_mgc_out_stdreg_d;

END v4;



