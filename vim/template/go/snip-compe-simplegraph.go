{{_cursor_}}
type graph struct {
	size  int
	edges []nodeSet
}

func newGraph(n int) *graph {
	g := &graph{
		size:  n,
		edges: make([]nodeSet, n),
	}
	for i := 0; i < n; i++ {
		g.edges[i] = newSet()
	}
	return g
}

func scanGraph(n int, sc *bufio.Scanner) *graph {
	g := newGraph(n)
	for i := 0; i < n; i++ {
		x, y := scanInt(sc), scanInt(sc)
		// 0-indexed
		x--
		y--
		g.addEdge(x, y)
	}
	return g
}

func (g *graph) addEdge(x, y int) {
	g.edges[x].add(y)
	g.edges[y].add(x)
}

func (g *graph) addDirectedEdge(x, y int) {
	g.edges[x].add(y)
}

func (g *graph) exists(x, y int) bool {
	return g.edges[x].doesContain(y)
}

type nodeSet map[int]none

func newSet() nodeSet {
	return make(map[int]none)
}

func (s nodeSet) add(item int) {
	s[item] = mark
}

func (s nodeSet) doesContain(item int) bool {
	_, ok := s[item]
	return ok
}

func (s nodeSet) size() int {
	return len(s)
}

func (s nodeSet) members() (l []int) {
	for k := range s {
		l = append(l, k)
	}
	return l
}

var mark none

type none struct{}
