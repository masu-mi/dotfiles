{{_cursor_}}
const (
	wallByte = '#'
)

func loadGrid(sc *bufio.Scanner) (h, w int, grid []string) {
	h, w = nextInt(sc), nextInt(sc)
	grid = make([]string, h+2)
	wall := createWall(w)
	grid[0] = wall
	for i := 1; i <= h; i++ {
		sc.Scan()
		buf := bytes.NewBuffer([]byte{})
		buf.Write([]byte{wallByte})
		buf.WriteString(sc.Text())
		buf.Write([]byte{wallByte})
		grid[i] = buf.String()
	}
	grid[h+1] = wall
	return h, w, grid
}

func createWall(w int) string {
	buf := bytes.NewBuffer([]byte{})
	for i := 0; i < w+2; i++ {
		buf.Write([]byte{wallByte})
	}
	return buf.String()
}

func newBooleanGrid(h, w int) (r [][]bool) {
	r = make([][]bool, h+2)
	for i := range r {
		r[i] = make([]bool, w+2)
	}
	return r
}

func getByte(g []string, p pos) byte {
	return g[p.x][p.y]
}

type pos struct{ x, y int }

func findBytes(g []string, str string) map[byte]pos {
	targets := map[byte]struct{}{}
	result := map[byte]pos{}
	for i := range str {
		targets[str[i]] = struct{}{}
	}
	for i := 1; i < len(g); i++ {
		for j := 1; j < len(g[i]); j++ {
			b := g[i][j]
			if _, ok := targets[b]; ok {
				result[b] = pos{i, j}
			}
		}
	}
	return result
}
func nextInt(sc *bufio.Scanner) int {
	sc.Scan()
	a, _ := strconv.Atoi(sc.Text())
	return int(a)
}

func nextString(sc *bufio.Scanner) string {
	sc.Scan()
	return sc.Text()
}

func nextIntSlice(sc *bufio.Scanner, n int) (a []int) {

	a = make([]int, n)
	for i := 0; i < n; i++ {
		a[i] = nextInt(sc)
	}
	return a
}
