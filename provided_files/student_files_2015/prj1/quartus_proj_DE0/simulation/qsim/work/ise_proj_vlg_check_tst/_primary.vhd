library verilog;
use verilog.vl_types.all;
entity ise_proj_vlg_check_tst is
    port(
        HEX0_D          : in     vl_logic_vector(6 downto 0);
        LEDG            : in     vl_logic_vector(9 downto 0);
        VGA_B           : in     vl_logic_vector(3 downto 0);
        VGA_BLANK       : in     vl_logic;
        VGA_CLK         : in     vl_logic;
        VGA_G           : in     vl_logic_vector(3 downto 0);
        VGA_HS          : in     vl_logic;
        VGA_R           : in     vl_logic_vector(3 downto 0);
        VGA_SYNC        : in     vl_logic;
        VGA_VS          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ise_proj_vlg_check_tst;
