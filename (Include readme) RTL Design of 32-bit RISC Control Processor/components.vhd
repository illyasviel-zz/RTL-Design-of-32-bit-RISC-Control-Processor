library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;
use work.defines.all ;

package components is
component ram
port (
data_ramin : in dword ;
instr_address : in addr ;
write, clock : in std_logic ;
data_ramout : out dword
) ;
end component ;
component rom
port (
pc_value : in addr ;
instr_value : out iword
) ;
end component ;
component alu
port (
data_aluin : in dword ;
instr_address : in addr ;
alu_opcode : in alu_opcode ; 
clock : in std_logic ; 
data_aluout : out dword ;
zero, negative : out std_logic
) ;
end component ;
component pc
port (
instr_address : in addr ;
pc_opcode : in pc_opcode ; 
reset : in std_logic ;
clock : in std_logic ;
pc_value : out addr 
) ;
end component ;
component decoder
port (
instr_value : in iword ;
zero, negative : in std_logic ; 
alu_opcode : out opcode ; 
pc_opcode : out pc_opcode ; 
write : out std_logic 
) ;
end component ;
end components;