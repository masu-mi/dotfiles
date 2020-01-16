#! /usr/bin/env elixir


defmodule Disassemble do
  @moduledoc false
  @command __ENV__.file |> Path.basename()

  @usage """
  NAME:
      #{@command} -- disassemble beam

  SYNOPSIS:
      #{@command} file
  """

  def usage(), do: @usage

  def run(path) do
    result = :beam_lib.chunks(path, [:abstract_code])
    {:ok, {_, [{:abstract_code, {_, ac}}]}} = result
    IO.puts(:erl_prettypr.format(:erl_syntax.form_list(ac)))
  end
end

if 0 < length(System.argv()) do
  hd(System.argv())
  |> to_charlist()
  |> Disassemble.run()
else
    IO.puts(Disassemble.usage())
end

