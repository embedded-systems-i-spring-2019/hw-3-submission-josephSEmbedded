----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 07:25:10 PM
-- Design Name: 
-- Module Name: exer_3 - Behavioral
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

entity crkt_3 is
    Port ( signal LDB3: in std_logic;
           signal LDA3 : in std_logic;
           signal X : in std_logic_vector(7 downto 0);
           signal S1 : in std_logic;
           signal S0 : in std_logic;
           signal CLK3 : in std_logic;
           signal Y : in std_logic_vector(7 downto 0);
           signal RB : out std_logic_vector(7 downto 0)
           );
end crkt_3;

architecture my_crkt_3 of crkt_3 is

component mux2to1 
    port ( A,B : in std_logic_vector(7 downto 0);
           SEL : in std_logic;
           mux_out : out std_logic_vector(7 downto 0)
           );
end component;

component reg8 
    port ( CLK, LDA : in std_logic;
           reg_in : in std_logic_vector(7 downto 0);
           reg_out : out std_logic_vector(7 downto 0)
           );
 end component;
 
signal mux1_out : std_logic_vector(7 downto 0);
signal REGA_out : std_logic_vector(7 downto 0);
signal mux2_out : std_logic_vector(7 downto 0);
signal regb_out_temp : std_logic_vector(7 downto 0);


begin
mux1 : mux2to1 
    port map (A => X, 
              B => regb_out_temp, 
              SEL => S1, 
              mux_out => mux1_out);

regA : reg8
    port map(LDA => LDA3, 
             reg_in => mux1_out,
             CLK => CLK3,
             reg_out => REGA_out);
             
mux2 : mux2to1
    port map(A => REGA_out,
             B => Y,
             SEL => S0,
             mux_out => mux2_out);
     
regB : reg8
    port map(LDA => LDB3,
             reg_in => mux2_out,
             CLK => CLK3,
             reg_out => regb_out_temp);
             

RB <= regb_out_temp;
end my_crkt_3;
