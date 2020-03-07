{{_cursor_}}
func reverseString(str string) string {
	buf := bytes.NewBufferString("")
	reverseFprint(buf, str)
	return buf.String()
}

func reverseFprint(r io.Writer, str string) {
	runes := []rune(str)
	for i := len(runes); i > 0; i-- {
		r.Write(([]byte)(string(runes[i-1])))
	}
}
