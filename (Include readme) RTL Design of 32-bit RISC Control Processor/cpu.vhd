library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;
use work.defines.all ;
use work.components.all ;

entity cpu is
port (
reset, clock : in std_logic ; 
pc_value : out addr ; 
instr_value : out iword ; 
data_aluout : out dword 
) ;
end cpu ;

architecture rtl of cpu is
signal ip : addr ; 
signal instr : iword ; 
signal ramout : dword ; 
signal acc : dword ; 
signal zero, negative : std_logic ;
signal aluop : alu_opcode ; 
signal pcop : pc_opcode ;
signal write : std_logic ;
signal add : addr ; 
begin
add <= unsigned(instr(26 downto 0)) ;
pc1: pc port map ( add, pcop, reset, clock, ip ) ;
rom1: rom port map ( ip, instr ) ;
ram1: ram port map ( acc, add, write, clock, ramout ) ;
alu1: alu port map ( ramout, add, aluop, clock, acc,
zero, negative) ;
decoder1:
decoder port map ( instr, zero, negative,
aluop, pcop, write ) ;
pc_value <= ip ;
instr_value <= instr ;
data_aluout <= acc ;
end rtl ;