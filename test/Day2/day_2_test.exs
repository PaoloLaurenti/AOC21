defmodule Aoc21.Day1Test do
  use ExUnit.Case
  alias Aoc21.Day2

  test "submarine position" do
    input_file_path = "./test/Day2/input_ex_1.txt"

    result = Day2.count_position!(input_file_path)

    assert result == %{horizontal: 15, depth: 10}
  end

  test "submarine position with aim" do
    input_file_path = "./test/Day2/input_ex_1.txt"

    result = Day2.count_position_with_aim!(input_file_path)

    assert %{horizontal: 15, depth: 60} = result
  end

end
