class Computer
  BINARY_OPERATION = -> (operator, memory, address1, address2, output_address) {
    memory[output_address] = memory[address1].send(operator, memory[address2])
  }
  SUM = BINARY_OPERATION.curry.(:+)
  MULTIPLICATION = BINARY_OPERATION.curry.(:*)
  HALT = ->(*) { false }

  OPERATIONS = {
    1 => SUM,
    2 => MULTIPLICATION,
    99 => HALT
  }

  INSTRUCTION_LENGTH = 4

  # by default the program runs with address 1 as noun, and address 2 as verb
  def run(program, noun = program[1], verb = program[2])
    # initialize memory
    memory = program.clone
    memory[1, 2] = [noun, verb]
    instruction_pointer = 0

    # run program from memory
    while true do
      opcode, *parameters = memory[instruction_pointer, INSTRUCTION_LENGTH]

      break unless OPERATIONS[opcode].call(memory, *parameters)

      instruction_pointer += INSTRUCTION_LENGTH
    end

    if block_given?
      return yield(memory)
    end

    memory[0]
  end
end
