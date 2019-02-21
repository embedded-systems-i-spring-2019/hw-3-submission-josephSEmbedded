----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 09:00:53 PM
-- Design Name: 
-- Module Name: exer_5 - Behavioral
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

entity crkt_5 is
    Port( signal A5 : in std_logic_vector(7 downto 0);
          signal SL15 : in std_logic;
          signal B5 : in std_logic_vector(7 downto 0);
          signal C5 : in std_logic_vector(7 downto 0);
          signal SL25 : in std_logic;
          signal CLK5 : in std_logic;
          signal RAX : out std_logic_vector(7 downto 0);
          signal RBX : out std_logic_vector(7 downto 0)
          );
end crkt_5;

architecture my_crkt_5 of crkt_5 is

component decoder2t1 
    port ( DS : in std_logic;
           OUT_1 : out std_logic;
           OUT_0 : out std_logic
           );
 end component;
 
 
component reg8
    port( CLK : in std_logic;
          LDA : in std_logic;
          reg_in : in std_logic_vector(7 downto 0);
          reg_out : out std_logic_vector(7 downto 0)
          );
          
 end component;

component mux2to1
    port (A,B : in std_logic_vector(7 downto 0);
          SEL : in std_logic;
          mux_out : out std_logic_vector(7 downto 0)
          );
end component;

signal decoder_out1 : std_logic;
signal decoder_out0  : std_logic;
signal mux_out_temp : std_logic_vector(7 downto 0);




begin

decoder5 : decoder2t1
    port map(DS => SL15,
             OUT_1 => decoder_out1,
             OUT_0 => decoder_out0
             );

regA5 : reg8
    port map( CLK => CLK5,
              LDA => decoder_out1,
              reg_in => A5,
              reg_out => RAX 
              );
regB5 : reg8
    port map(CLK => CLK5,
             LDA => decoder_out0,
             reg_in => mux_out_temp,
             reg_out => RBX
             );
mux5 : mux2to1
    port map( A => B5,
              B => C5,
              SEL => SL25,
              mux_out => mux_out_temp
              );



end my_crkt_5;
