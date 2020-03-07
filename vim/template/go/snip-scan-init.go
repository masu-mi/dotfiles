const (
  initialBufSize = 100000
  maxBufSize     = 1000000
)
buf := make([]byte, initialBufSize)

sc := bufio.NewScanner({{_input_:reader}})
sc.Buffer(buf, maxBufSize)
sc.Split(bufio.ScanWords) // bufio.ScanLines
{{_cursor_}}
