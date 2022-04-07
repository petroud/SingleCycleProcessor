---------------------------------------------------------------------------------- 
-- Engineer: Dimitrios Petrou       
-- Create Date: 03/14/2022 12:31:08 PM
-- Module Name: decstage - Behavioral
-- Project Name: SingleCycleProcessor
-- Revision 1.00 - Decode Stage Testbench implemented
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decstage_tb is
end decstage_tb;

architecture Behavioral of decstage_tb is

    component decstage
      Port (
          Instr: in std_logic_vector(31 downto 0);
          RF_WrEn: in std_logic;
          ALU_out: in std_logic_vector(31 downto 0);
          MEM_out: in std_logic_vector(31 downto 0);
          RF_WrData_sel: in std_logic;
          RF_B_sel: in std_logic;
          ImmExt: in std_logic_vector(1 downto 0);
          CLK: in std_logic;
          RST: in std_logic;
          Immed: out std_logic_vector(31 downto 0);
          RF_A: out std_logic_vector(31 downto 0);
          RF_B: out std_logic_vector(31 downto 0)         
      );
    end component;

    signal Instr: std_logic_vector(31 downto 0);
    signal RF_WrEn: std_logic;
    signal ALU_out: std_logic_vector(31 downto 0);
    signal MEM_out: std_logic_vector(31 downto 0);
    signal RF_WrData_sel: std_logic;
    signal RF_B_sel: std_logic;
    signal ImmExt: std_logic_vector(1 downto 0);
    signal CLK: std_logic;
    signal RST: std_logic;
    signal Immed: std_logic_vector(31 downto 0);
    signal RF_A: std_logic_vector(31 downto 0);
    signal RF_B: std_logic_vector(31 downto 0);
    
    signal inner_termin: std_logic;
    
begin

    uut: decstage port map ( 
        Instr         => Instr,                 
        RF_WrEn       => RF_WrEn,
        ALU_out       => ALU_out,
        MEM_out       => MEM_out,
        RF_WrData_sel => RF_WrData_sel,
        RF_B_sel      => RF_B_sel,
        ImmExt        => ImmExt,
        CLK           => CLK,
        RST           => RST,
        Immed         => Immed,
        RF_A          => RF_A,
        RF_B          => RF_B 
    );
    
     --Process for generating clock signal 
    clkProcess: process begin
        --Vary the clock signal for low to high every 30ns 
        --Period = 100ns
        CLK <= '0';
        wait for 50ns;
        CLK <= '1';
        wait for 50ns;
        
        --The terminationg flag will be HIGH after a certain time 
        --The clock is generated for this amount of time 
        inner_termin<='1' after 3000ns;
        
        --Checking if we should terminate the clock generation
        if inner_termin ='1' then
            CLK<='0';  --Set clock signal to low 
            wait; --End the clock generation process
        end if;
    end process;
    
    
    
    simProcess: process begin
    
        RST<='1';
        wait for 100ns;
        RST<='0';
        
        Instr <= x"80021800";
        ALU_out<=x"00000002";
        MEM_out<=x"00000000";
        RF_WrEn<='1';
        RF_WrData_sel <='0'; --Writing from the ALU out
        RF_B_sel <= '1';
          
    
        wait;
    end process;
    
    
    



end Behavioral;
