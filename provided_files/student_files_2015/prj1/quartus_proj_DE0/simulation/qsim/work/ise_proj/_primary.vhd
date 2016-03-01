library verilog;
use verilog.vl_types.all;
entity ise_proj is
    port(
        VGA_CLK         : out    vl_logic;
        VGA_SYNC        : out    vl_logic;
        VGA_BLANK       : out    vl_logic;
        VGA_VS          : out    vl_logic;
        VGA_HS          : out    vl_logic;
        HEX0_D          : out    vl_logic_vector(6 downto 0);
        LEDG            : out    vl_logic_vector(9 downto 0);
        VGA_B           : out    vl_logic_vector(3 downto 0);
        VGA_G           : out    vl_logic_vector(3 downto 0);
        VGA_R           : out    vl_logic_vector(3 downto 0);
        BUTTON          : in     vl_logic_vector(2 downto 0);
        SW              : in     vl_logic_vector(9 downto 0);
        PS2_MSDAT       : in     vl_logic;
        PS2_MSCLK       : in     vl_logic;
        CLOCK_50        : in     vl_logic;
        CLOCK_50_2      : in     vl_logic
    );
end ise_proj;
