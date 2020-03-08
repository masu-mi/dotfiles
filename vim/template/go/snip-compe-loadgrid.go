{{_cursor_}}
func loadGrid(r io.Reader) (h, w int, grid []string) {
	fmt.Fscan(r, &h, &w)
	grid = make([]string, h+2)
	wall := createWall(w)
	grid[0] = wall
	sc := bufio.NewScanner(r)
	for i := 1; i <= h; i++ {
		sc.Scan()
		buf := bytes.NewBuffer([]byte{})
    buf.Write([]byte{'{{_input_:wall_byte}}'})
		buf.WriteString(sc.Text())
    buf.Write([]byte{'{{_input_:wall_byte}}'})
		grid[i] = buf.String()
	}
	grid[h+1] = wall
	return h, w, grid
}
func createWall(w int) string {
	buf := bytes.NewBuffer([]byte{})
	for i := 0; i < w+2; i++ {
    buf.Write([]byte{'{{_input_:wall_byte}}'})
	}
	return buf.String()
}
