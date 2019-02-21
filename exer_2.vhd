----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2019 09:50:43 PM
-- Design Name: 
-- Module Name: exer_2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--2:1 Decoder entity
entity decoder2t1 is
    Port ( signal DS : in std_logic;
           signal OUT_1 : out std_logic;
           signal OUT_0 : out std_logic);
end decoder2t1;

--2:1 Decoder architecture
architecture my_decode of decoder2t1 is
begin

OUT_0 <= not DS;
OUT_1 <= DS;
    
end my_decode;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Register entity
entity reg8neg is
    Port ( signal CLK : in std_logic;
           signal LDA : in std_logic;
           signal reg_in : in std_logic_vector(7 downto 0);
           signal reg_out : out std_logic_vector(7 downto 0));
 end reg8neg;


--Architecture for register
architecture my_register of reg8neg is
begin
reg: process(CLK)
begin
    if(falling_edge(CLK)) then
        if(LDA = '1') then
            reg_out <= reg_in;
         end if;
    end if;
 end process;
 end my_register;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Mux 4:1 entity
entity mux4to1 is
    Port ( signal W : in  std_logic_vector(7 downto 0);
           signal X : in  std_logic_vector(7 downto 0);
           signal Y : in std_logic_vector(7 downto 0);
           signal Z : in std_logic_vector(7 downto 0);
           signal SEL : in std_logic_vector(1 downto 0);
           signal mux_out : out std_logic_vector(7 downto 0));
end mux4to1;


--Mux 4:1 architecture
architecture my_mux4 of mux4to1 is

begin
 
 with SEL select
    mux_out <= W when "11",
               X when "10",
               Y when "01",
               Z when "00",
               (others => '0') when others;


end my_mux4;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--Entity for my second structural circuit
entity crkt_2 is
    Port( signal IN_1 : in std_logic_vector(7 downto 0);
          signal IN_2 : in std_logic_vector(7 downto 0);
          signal IN_3 : in std_logic_vector(7 downto 0);
          signal MS : in std_logic_vector(1 downto 0);
          signal ClocK :  in std_logic;
          signal decode_in : in std_logic;
          signal RB : out std_logic_vector(7 downto 0);
          signal RA : out std_logic_vector(7 downto 0));
end crkt_2;

--Architecture for my second structural circuit
architecture my_crkt_2 of crkt_2 is
component  mux4to1
    port ( W,X,Y,Z : in std_logic_vector(7 downto 0);
           SEL : in std_logic_vector(1 downto 0);
           mux_out : out std_logic_vector(7 downto 0));
end component;

component reg8neg
    port( CLK :  in std_logic;
          LDA : in std_logic;
          reg_in : in std_logic_vector(7 downto 0);
          reg_out : out std_logic_vector(7 downto 0));
end component;

component decoder2t1
    port( DS : in std_logic;
          OUT_1 : out std_logic;
          OUT_0 : out std_logic);
end component;
signal dout_1 : std_logic;
signal dout_0 : std_logic;
signal mux_result_temp2 : std_logic_vector(7 downto 0);
signal RA_internal : std_logic_vector(7 downto 0);
signal RB_internal : std_logic_vector(7 downto 0);
begin
    ra2: reg8neg port map( CLK => Clock, LDA => dout_0, reg_in => mux_result_temp2, reg_out => RA_internal);
    rb2: reg8neg port map( CLK => Clock, LDA => dout_1, reg_in => RA_internal, reg_out => RB_internal);
    mux: mux4to1 port map(W => IN_1, X => IN_2, Y => IN_3, Z => RB_internal, SEL => MS, mux_out => mux_result_temp2);
    decode: decoder2t1 port map (DS => decode_in , OUT_1 => dout_1, OUT_0 => dout_0);
    
    RA <= RA_internal;
    RB <= RB_internal;
end my_crkt_2;
    

