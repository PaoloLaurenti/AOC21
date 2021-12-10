defmodule Aoc21.Day1Test do
  use ExUnit.Case
  alias Aoc21.Day1

  test "increases count" do
    input_file_path = "./test/Day1/input_ex_1.txt"

    result = Day1.count_increases!(input_file_path)

    assert result == 7
  end

  test "increases sum count" do
    input_file_path = "./test/Day1/input_ex_1.txt"

    result = Day1.count_sum_increases!(input_file_path)

    assert result == 5
  end
end
