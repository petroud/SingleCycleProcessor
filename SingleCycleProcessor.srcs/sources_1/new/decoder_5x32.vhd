---------------------------------------------------------------------------------- 
-- Engineer: Dimitrios Petrou       
-- Create Date: 03/11/2022 02:49:28 PM
-- Module Name: Decoder 5x32 Module
-- Project Name: SingleCycleProcessor
-- Revision 1.00 - File Created
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder_5x32 is
    Port (
        input: in std_logic_vector(4 downto 0);
        output: out std_logic_vector(31 downto 0)   
    );
end decoder_5x32;

architecture Behavioral of decoder_5x32 is

signal local_out: std_logic_vector(31 downto 0);
begin

operation:
    for i in 0 to 31 generate
        local_out(i) <= '1' when TO_INTEGER(unsigned(input)) = i else '0';
    end generate;

    output <= local_out after 10ns;
end Behavioral;
