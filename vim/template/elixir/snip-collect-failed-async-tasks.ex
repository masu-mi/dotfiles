result =
  {{_input_:reducable}}
  |> Task.async_stream(
    fn item ->
      # TODO implement
      {{_cursor_}}
    end,
    max_concurrency: 200,
    timeout: timeout,
    on_timeout: :kill_task
  )
  |> Enum.group_by(&match?({:ok, _}, &1))

succeded =
  result[true] || []
  |> Enum.map(fn {:ok, item} -> item end)
failed = result[false] || []
if length(failed) > 0 do
  # TODO error, warn, ..
  raise "failed #{inspect(failed, 2)}"
end
