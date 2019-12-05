# How to run
Start the computer
```
require "./lib/computer"

computer = Computer.new
```
Run a program on the computer. If no noun or verb is provided, address 1 and 2 of
the program are left as is.

If no block is given, the return value is the value of address 0. If a block is given the
return value is the return value of the block
```
program = [2,3,0,3,99]

computer.run(program) do |memory|
  memory
end

# => [2, 3, 0, 6, 99]
```
The main program, which can calculate the gravity assist, can be loaded into `$program` by requiring it
```
require "./main_program"
```
You can then run it with any noun and verb
```
computer.run($program, 12, 2)
```

## Tests
Run with
```
rake test
```
