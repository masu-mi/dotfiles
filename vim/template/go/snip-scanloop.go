sc := bufio.NewScanner({{_input_:reader}})
sc.Split(bufio.ScanWords)
for i := 0; i < {{_input_:repeat_num}}; i++ {
	sc.Scan()
	sc.Text()
	{{_cursor_}}
}
