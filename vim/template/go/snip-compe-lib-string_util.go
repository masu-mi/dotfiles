{{_cursor_}}
func reverseString(str string) string {
	buf := bytes.NewBufferString("")
	writeReverse(buf, str)
	return buf.String()
}

func reverseStrings(strs ...string) (rev []string) {
	for i := len(strs); i > 0; i-- {
		rev = append(rev, strs[i-1])
	}
	return
}

func writeStrings(w io.Writer, strs ...string) {
	ch := make(chan string)
	go func() {
		for _, s := range strs {
			ch <- s
		}
		close(ch)
	}()
	writeWithChanString(w, ch)
}

func writeFlattenStrings(r io.Writer, strss ...[]string) {
	ch := make(chan string)
	go func() {
		for _, strs := range strss {
			for _, s := range strs {
				ch <- s
			}
		}
		close(ch)
	}()
	writeWithChanString(r, ch)
}

func writeWithChanString(r io.Writer, strs chan string) {
	for s := range strs {
		r.Write(([]byte)(s))
	}
}

func writeReverse(r io.Writer, str string) {
	runes := []rune(str)
	for i := len(runes); i > 0; i-- {
		r.Write(([]byte)(string(runes[i-1])))
	}
}
