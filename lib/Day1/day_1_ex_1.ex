defmodule Aoc21.Day1Ex1 do
  def count_increases!(input) do
    counter =
      input
      |> File.stream!([], :line)
      |> Stream.map(fn item ->
        {int_value, _} = item |> String.trim() |> Integer.parse()
        int_value
      end)
      |> Stream.scan({nil, 0}, fn current, {_, previous} ->
        if current > previous do
          {:inc, current}
        else
          {:dec, current}
        end
      end)
      |> Stream.filter(fn {trend, _} -> trend == :inc end)
      |> Enum.count()

    counter - 1
  end

  def count_sum_increases!(input) do
    counter =
      input
      |> File.stream!([], :line)
      |> Stream.map(fn item ->
        {int_value, _} = item |> String.trim() |> Integer.parse()
        int_value
      end)
      |> Stream.chunk_every(3, 1, :discard)
      |> Stream.scan({nil, 0}, fn [first, second, third], {_, previous} ->
        current_total = first + second + third

        if current_total > previous do
          {:inc, current_total}
        else
          {:dec, current_total}
        end
      end)
      |> Stream.filter(fn {trend, _} -> trend == :inc end)
      |> Enum.count()

    counter - 1
  end
end
