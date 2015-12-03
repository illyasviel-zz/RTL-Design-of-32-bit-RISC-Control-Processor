library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;
use work.defines.all ;

entity alu is
port (
data_aluin : in dword ;
instr_address : in addr ;
alu_opcode : in alu_opcode ; 
clock : in std_logic ; 
data_aluout : out dword ;
zero, negative : out std_logic
) ;
end alu ;

architecture rtl of alu is
signal a, nexta : dword ;
begin
with alu_opcode select nexta <=
data_aluin when load,
unsigned("00000" & instr_address) when loadi,
data_aluin + a when addop,
--1 + a when addop,
unsigned(not
std_logic_vector(a)) when notop,
unsigned(std_logic_vector(data_aluin) and
std_logic_vector(a)) when andop,
a when others ;
zero <=
'1' when a = 0 else
'0' ;
negative <= a(26) ;
process(clock)
begin
if clock'event and clock = '1' then
a <= nexta ;
end if ;
end process ;
data_aluout <= a ;
end rtl ;