----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2019 08:01:20 PM
-- Design Name: 
-- Module Name: crkt_4 - my_crkt_4
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

entity crkt_4 is
    Port( signal LDB4 : in std_logic;
          signal X : in std_logic_vector(7 downto 0);
          signal Y : in std_logic_vector(7 downto 0);
          signal S1 : in std_logic;
          signal LDA4 : in std_logic;
          signal RD : in std_logic;
          signal S0 : in std_logic;
          signal CLK4 : in std_logic;
          signal RB : out std_logic_vector(7 downto 0);
          signal RA : out std_logic_vector(7 downto 0)
          );
end crkt_4;

architecture my_crkt_4 of crkt_4 is

component mux2to1
    port ( A,B : in std_logic_vector(7 downto 0);
           SEL : in std_logic;
           mux_out : out std_logic_vector(7 downto 0)
           );
end component;
 
component reg8neg 
    port (CLK, LDA : in std_logic;
          reg_in : in std_logic_vector(7 downto 0);
          reg_out : out std_logic_vector(7 downto 0)
          );
end component;

signal mux1_out : std_logic_vector(7 downto 0);
signal regb_out_temp : std_logic_vector(7 downto 0);
signal mux2_out : std_logic_vector(7 downto 0);
signal into_LDB : std_logic;
signal into_LDA : std_logic;

begin

into_LDB <= LDB4 and not RD;
into_LDA <= LDA4 and RD;

mux1 : mux2to1
    port map( A => X,
              B => Y,
              SEL => S1,
              mux_out => mux1_out);

mux2 : mux2to1
    port map( A => regb_out_temp,
              B => Y,
              SEL => S0,
              mux_out => mux2_out);
              
regb : reg8neg
    port map( CLK => CLK4,
              LDA => into_LDB,
              reg_in => mux1_out,
              reg_out => regb_out_temp
              );

rega : reg8neg
    port map( CLK => CLK4,
              LDA => into_LDA,
              reg_in => mux2_out,
              reg_out => RA);

              
              
RB <= regb_out_temp;


end my_crkt_4;
