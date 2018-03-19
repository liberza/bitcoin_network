defmodule Hexdump do
  def to_string(data) when is_binary(data) do
    data
    |> :binary.bin_to_list()
    |> Enum.chunk_every(16)
    |> Enum.map(&Enum.chunk_every(&1, 8))
    |> Enum.map(fn
      [one] -> [one, []]
      [one, two] -> [one, two]
    end)
    |> Enum.with_index()
    |> Enum.map(&print_line/1)
    |> Enum.join("\n")
  end

  def to_string(data), do: IO.inspect(data)

  def print_line({parts, index}) do
    count =
      index
      |> Kernel.*(16)
      |> :binary.encode_unsigned()
      |> Base.encode16(case: :lower)
      |> String.pad_leading(8, "0")

    bytes =
      parts
      |> Enum.map(fn bytes ->
        bytes
        |> Enum.map(fn byte ->
          byte
          |> :binary.encode_unsigned()
          |> Base.encode16(case: :lower)
        end)
        |> Enum.join(" ")
        |> String.pad_trailing(23, " ")
      end)

    ascii =
      parts
      |> List.flatten()
      |> Enum.map(fn byte ->
        case byte <= 0x7E && byte >= 0x20 do
          true -> <<byte>>
          false -> "."
        end
      end)
      |> Enum.join("")

    [count, bytes, ascii]
    |> List.flatten()
    |> Enum.join("  ")
  end
end
