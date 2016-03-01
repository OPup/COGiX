library verilog;
use verilog.vl_types.all;
entity ise_proj_vlg_sample_tst is
    port(
        BUTTON          : in     vl_logic_vector(2 downto 0);
        CLOCK_50        : in     vl_logic;
        CLOCK_50_2      : in     vl_logic;
        PS2_MSCLK       : in     vl_logic;
        PS2_MSDAT       : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        sampler_tx      : out    vl_logic
    );
end ise_proj_vlg_sample_tst;
