----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2019 09:03:22 PM
-- Design Name: 
-- Module Name: exer_1 - structural
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


--Mux 2:1 entity
entity mux2to1 is
    Port ( signal A : in  std_logic_vector(7 downto 0);
           signal B : in  std_logic_vector(7 downto 0);
           signal SEL : in std_logic;
           signal mux_out : out std_logic_vector(7 downto 0));
end mux2to1;


--Mux 2:1 architecture
architecture my_mux of mux2to1 is

begin
 
 with SEL select
    mux_out <= A when '1',
               B when '0',
               (others => '0') when others;


end my_mux;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Register entity
entity reg8 is
    Port ( signal CLK : in std_logic;
           signal LDA : in std_logic;
           signal reg_in : in std_logic_vector(7 downto 0);
           signal reg_out : out std_logic_vector(7 downto 0));
 end reg8;


--Architecture for register
architecture my_register of reg8 is
begin
reg: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(LDA = '1') then
            reg_out <= reg_in;
         end if;
    end if;
 end process;
 end my_register;
 
 
 library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;

--Entity for my structural circuit 
 entity crkt_1 is
 
 Port( signal MUX_IN1 : in std_logic_vector(7 downto 0);
       signal MUX_IN2 : in std_logic_vector(7 downto 0);
       signal MUX_SEL : in std_logic;
       signal clock : in std_logic;
       signal LOAD : in std_logic;
       signal register_OUT: out std_logic_vector(7 downto 0));
       
end crkt_1;

--Architecture for my structural circuit
architecture my_crkt1 of crkt_1 is
    component mux2to1
        port ( A,B : in std_logic_vector(7 downto 0);
               SEL : in std_logic;
               MUX_OUT : out std_logic_vector(7 downto 0));
    end component;
    
    component reg8 
        port( CLK : in std_logic;
              LDA : in std_logic;
              reg_in: in std_logic_vector(7 downto 0);
              reg_out : out std_logic_vector(7 downto 0));
    end component;
    
    signal temp_mux_result : std_logic_vector(7 downto 0);
  begin 
    exer_1MUX: mux2to1 port map (A => MUX_IN1, B => MUX_IN2, SEL => MUX_SEL, mux_out => temp_mux_result);
            
    exer_1REG8 : reg8 port map(CLK => clock, LDA => LOAD, reg_in => temp_mux_result, reg_out => register_OUT);
end my_crkt1;


    
       
 
 
 
        
            
    






