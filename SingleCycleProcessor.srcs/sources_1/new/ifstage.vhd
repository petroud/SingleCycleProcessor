---------------------------------------------------------------------------------- 
-- Engineer: Dimitrios Petrou       
-- Create Date: 03/11/2022 02:49:28 PM
-- Module Name: IFSTAGE - Behavioral Module
-- Project Name: SingleCycleProcessor
-- Revision 1.00 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ifstage is
    Port (
        -- Entity inputs
        PC_Immed: in std_logic_vector(31 downto 0);
        PC_sel: in std_logic;
        PC_LdEn: in std_logic;
        RST: in std_logic;
        CLK: in std_logic;
        -- Entity outputs
        PC: out std_logic_vector(31 downto 0)
    );
end ifstage;

architecture Behavioral of ifstage is
    
begin


end Behavioral;
