{{_cursor_}}
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
