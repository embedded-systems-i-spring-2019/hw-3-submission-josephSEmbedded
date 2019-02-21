----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 09:33:10 PM
-- Design Name: 
-- Module Name: exer_6 - Behavioral
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

entity crkt_6 is
    Port( signal A6 : in std_logic_vector(7 downto 0);
          signal B6 : in std_logic_vector(7 downto 0);
          signal SEL1 : in std_logic;
          signal CLK6 : in std_logic;
          signal C6 : in std_logic_vector(7 downto 0);
          signal SEL2 : in std_logic;
          signal RAP : out std_logic_vector(7 downto 0);
          signal RBP : out std_logic_vector(7 downto 0)
          );
end crkt_6;

architecture my_crkt_6 of crkt_6 is

signal mux_out_temp : std_logic_vector(7 downto 0);
signal decode6_out_1 : std_logic;
signal decode6_out_0 : std_logic;

component mux2to1
    port (A,B : in std_logic_vector(7 downto 0);
          SEL : in std_logic;
          mux_out : out std_logic_vector(7 downto 0)
          );
end component;


component reg8
    port( CLK : in std_logic;
          reg_in : in std_logic_vector(7 downto 0);
          reg_out : out std_logic_vector(7 downto 0);
          LDA : in std_logic
          );
end component;
 
component decoder2t1
    port( DS : in std_logic;
          OUT_1 : out std_logic;
          OUT_0 : out std_logic
          );
end component; 
  

begin

mux6 : mux2to1
    port map( A => A6,
              B => B6,
              SEL => SEL1,
              mux_out => mux_out_temp
              );

regA6 : reg8
    port map( CLK => CLK6,
              LDA => decode6_out_1,
              reg_in => mux_out_temp,
              reg_out => RAP
              );

regB6 : reg8
    port map(CLK => CLK6,
             LDA => decode6_out_0,
             reg_in => C6,
             reg_out => RBP
             );
             
decoder6 : decoder2t1
    port map( DS => SEL2,
              OUT_1 => decode6_out_1,
              OUT_0 => decode6_out_0
              );             



end my_crkt_6;
