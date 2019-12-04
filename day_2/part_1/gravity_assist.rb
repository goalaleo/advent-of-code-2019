# read initial program
program_path = ARGV[0]
require program_path
program = $program.clone

# define operations
binary_operation = -> (operator, input1_index, input2_index, output_index) {
  program[output_index] = program[input1_index].send(operator, program[input2_index])
}
sum = binary_operation.curry.(:+)
multiplication = binary_operation.curry.(:*)

OPERATIONS = {
  1 => sum,
  2 => multiplication,
}

# run program
program_counter = 0
INSTRUCTION_LENGTH = 4
HALT_OPCODE = 99

while true do
  instruction = program[program_counter * INSTRUCTION_LENGTH, INSTRUCTION_LENGTH]
  break if instruction[0] == HALT_OPCODE

  OPERATIONS[instruction[0]].call(*instruction[1..3])
  program_counter += 1
end

# output end result
program.each_slice(4) { |instruction| puts(instruction.join(", ")) }
