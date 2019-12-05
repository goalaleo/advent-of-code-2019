require "minitest/autorun"
require "computer"

class TestComputer < Minitest::Test
  def setup
    @computer = Computer.new
  end

  def test_example_program1
    memory = @computer.run([1,0,0,0,99], &:itself)
    assert_equal memory, [2,0,0,0,99]
  end

  def test_example_program2
    memory = @computer.run([2,3,0,3,99], &:itself)
    assert_equal memory, [2,3,0,6,99]
  end

  def test_example_program3
    memory = @computer.run([2,4,4,5,99,0], &:itself)
    assert_equal memory, [2,4,4,5,99,9801]
  end

  def test_example_program4
    memory = @computer.run([1,1,1,4,99,5,6,0,99], &:itself)
    assert_equal memory, [30,1,1,4,2,5,6,0,99]
  end
end
