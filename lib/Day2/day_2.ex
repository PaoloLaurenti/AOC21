defmodule Aoc21.Day2 do
  def count_position!(input) do
    input
    |> File.stream!([], :line)
    |> Stream.map(fn item ->
      [command, value] = item |> String.trim() |> String.split()
      {value, _} = Integer.parse(value)
      {command, value}
    end)
    |> Stream.scan(%{horizontal: 0, depth: 0}, fn {command, value}, current_position ->
      process_command(command, value, current_position)
    end)
    |> Enum.reverse()
    |> hd()
  end

  defp process_command("forward", value, %{horizontal: horizontal} = position) do
    %{position | horizontal: horizontal + value}
  end

  defp process_command("down", value, %{depth: depth} = position) do
    %{position | depth: depth + value}
  end

  defp process_command("up", value, %{depth: depth} = position) do
    %{position | depth: depth - value}
  end
end
