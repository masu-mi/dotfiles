{{_cursor_}}
func scan{{_input_:Suffix}}(sc *bufio.Scanner) {{_input_:type}} {
	sc.Scan()
	i, _ := strconv.Atoi(sc.Text())
	return {{_input_:type}}(i)
}
