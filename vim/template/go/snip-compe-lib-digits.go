
{{_cursor_}}
// package: gocom
// packed src of [/Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/digits.go] with goone.

func digits(n int) (d int) {
	return digitsWithBase(n, 10)
}

func digitsWithBase(n int, b int) (d int) {
	tmp := n
	for tmp > 0 {
		d++
		tmp /= b
	}
	return
}
