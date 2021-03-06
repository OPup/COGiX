-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    2011a.126 Production Release
--  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
-- 
--  Generated by:   oh1015@EEWS104A-004
--  Generated date: Fri Mar 04 16:29:38 2016
-- ----------------------------------------------------------------------

-- 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY mgc_hls;
USE mgc_hls.funcs.ALL;

PACKAGE mean_vga_mux_pkg IS 
  FUNCTION MUX_v_16_8_2(inputs : STD_LOGIC_VECTOR(127 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_10_8_2(inputs : STD_LOGIC_VECTOR(79 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_150_2_2(inputs : STD_LOGIC_VECTOR(299 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_150_4_2(inputs : STD_LOGIC_VECTOR(599 DOWNTO 0); sel : STD_LOGIC_VECTOR(1
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_150_3_2(inputs : STD_LOGIC_VECTOR(449 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_30_2_2(inputs : STD_LOGIC_VECTOR(59 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_16_2_2(inputs : STD_LOGIC_VECTOR(31 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_10_2_2(inputs : STD_LOGIC_VECTOR(19 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_6_2_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_7_2_2(inputs : STD_LOGIC_VECTOR(13 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_4_3_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_3_2_2(inputs : STD_LOGIC_VECTOR(5 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX1HOT_v_3_4_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
      DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;
  FUNCTION MUX_v_2_2_2(inputs : STD_LOGIC_VECTOR(3 DOWNTO 0); sel : STD_LOGIC)
    RETURN STD_LOGIC_VECTOR;
END mean_vga_mux_pkg;

PACKAGE BODY mean_vga_mux_pkg IS
FUNCTION MUX_v_16_8_2(inputs : STD_LOGIC_VECTOR(127 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(127 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN "111" =>
        result := inputs(15 DOWNTO 0);
      WHEN "110" =>
        result := inputs(31 DOWNTO 16);
      WHEN "101" =>
        result := inputs(47 DOWNTO 32);
      WHEN "100" =>
        result := inputs(63 DOWNTO 48);
      WHEN "011" =>
        result := inputs(79 DOWNTO 64);
      WHEN "010" =>
        result := inputs(95 DOWNTO 80);
      WHEN "001" =>
        result := inputs(111 DOWNTO 96);
      WHEN "000" =>
        result := inputs(127 DOWNTO 112);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 7 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*16-1 DOWNTO i*16);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*16-1 DOWNTO i*16));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_10_8_2(inputs : STD_LOGIC_VECTOR(79 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(79 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(9 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN "111" =>
        result := inputs(9 DOWNTO 0);
      WHEN "110" =>
        result := inputs(19 DOWNTO 10);
      WHEN "101" =>
        result := inputs(29 DOWNTO 20);
      WHEN "100" =>
        result := inputs(39 DOWNTO 30);
      WHEN "011" =>
        result := inputs(49 DOWNTO 40);
      WHEN "010" =>
        result := inputs(59 DOWNTO 50);
      WHEN "001" =>
        result := inputs(69 DOWNTO 60);
      WHEN "000" =>
        result := inputs(79 DOWNTO 70);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 7 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*10-1 DOWNTO i*10);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*10-1 DOWNTO i*10));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_150_2_2(inputs : STD_LOGIC_VECTOR(299 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(299 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(149 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(149 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(149 DOWNTO 0);
      WHEN '0' =>
        result := inputs(299 DOWNTO 150);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*150-1 DOWNTO i*150);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*150-1 DOWNTO
                i*150));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_150_4_2(inputs : STD_LOGIC_VECTOR(599 DOWNTO 0); sel : STD_LOGIC_VECTOR(1
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(599 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(149 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(149 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN "11" =>
        result := inputs(149 DOWNTO 0);
      WHEN "10" =>
        result := inputs(299 DOWNTO 150);
      WHEN "01" =>
        result := inputs(449 DOWNTO 300);
      WHEN "00" =>
        result := inputs(599 DOWNTO 450);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 3 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*150-1 DOWNTO i*150);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*150-1 DOWNTO
                i*150));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_150_3_2(inputs : STD_LOGIC_VECTOR(449 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(449 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(149 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(149 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 149 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*150-1 DOWNTO i*150) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_30_2_2(inputs : STD_LOGIC_VECTOR(59 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(59 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(29 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(29 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(29 DOWNTO 0);
      WHEN '0' =>
        result := inputs(59 DOWNTO 30);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*30-1 DOWNTO i*30);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*30-1 DOWNTO i*30));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_16_2_2(inputs : STD_LOGIC_VECTOR(31 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(31 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(15 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(15 DOWNTO 0);
      WHEN '0' =>
        result := inputs(31 DOWNTO 16);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*16-1 DOWNTO i*16);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*16-1 DOWNTO i*16));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_10_2_2(inputs : STD_LOGIC_VECTOR(19 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(19 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(9 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(9 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(9 DOWNTO 0);
      WHEN '0' =>
        result := inputs(19 DOWNTO 10);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*10-1 DOWNTO i*10);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*10-1 DOWNTO i*10));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_6_2_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(11 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(5 DOWNTO 0);
      WHEN '0' =>
        result := inputs(11 DOWNTO 6);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*6-1 DOWNTO i*6);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*6-1 DOWNTO i*6));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX_v_7_2_2(inputs : STD_LOGIC_VECTOR(13 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(13 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(6 DOWNTO 0);
      WHEN '0' =>
        result := inputs(13 DOWNTO 7);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*7-1 DOWNTO i*7);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*7-1 DOWNTO i*7));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_4_3_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC_VECTOR(2
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(11 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(3 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 3 DOWNTO 0) and tmp;
    FOR i in 1 TO 2 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*4-1 DOWNTO i*4) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_3_2_2(inputs : STD_LOGIC_VECTOR(5 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(5 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(2 DOWNTO 0);
      WHEN '0' =>
        result := inputs(5 DOWNTO 3);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*3-1 DOWNTO i*3);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*3-1 DOWNTO i*3));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

FUNCTION MUX1HOT_v_3_4_2(inputs : STD_LOGIC_VECTOR(11 DOWNTO 0); sel : STD_LOGIC_VECTOR(3
    DOWNTO 0))
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(11 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(2 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(2 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    tmp := (OTHERS=>sel(0));
    result := inputs( 2 DOWNTO 0) and tmp;
    FOR i in 1 TO 3 LOOP 
      tmp := (OTHERS=>sel(i));
      result := result or ( inputs((i+1)*3-1 DOWNTO i*3) and tmp);
    END LOOP;
  RETURN result;
END;

FUNCTION MUX_v_2_2_2(inputs : STD_LOGIC_VECTOR(3 DOWNTO 0); sel : STD_LOGIC)
RETURN STD_LOGIC_VECTOR IS
  VARIABLE or_inputs : STD_LOGIC_VECTOR(3 DOWNTO 0);
  VARIABLE result : STD_LOGIC_VECTOR(1 DOWNTO 0);
  VARIABLE tmp : STD_LOGIC_VECTOR(1 DOWNTO 0);
  VARIABLE result_new : STD_LOGIC;

  BEGIN
    CASE sel IS
      WHEN '1' =>
        result := inputs(1 DOWNTO 0);
      WHEN '0' =>
        result := inputs(3 DOWNTO 2);
      WHEN others =>
        result := (others => '0');
        -- pragma translate_off
        result_new := '1';
        FOR i IN 0 TO 1 LOOP
          IF ( result_new = '1' ) THEN
            result := inputs((i+1)*2-1 DOWNTO i*2);
            result_new := '0';
          ELSE
            result := resolve_std_logic_vector(result, inputs((i+1)*2-1 DOWNTO i*2));
          END IF;
        END LOOP;
        -- pragma translate_on
    END CASE;
  RETURN result;
END;

END mean_vga_mux_pkg;


