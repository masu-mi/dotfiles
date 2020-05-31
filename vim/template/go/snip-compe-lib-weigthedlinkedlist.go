{{_cursor_}}
type weightedLinkedList struct {
	size, deg int
	edges     []map[int]int
}

func newWeightedLinkedList(size int) *weightedLinkedList {
	ll := &weightedLinkedList{size: size, edges: make([]map[int]int, size)}
	for i := 0; i < size; i++ {
		ll.edges[i] = map[int]int{}
	}
	return ll
}

func (ll *weightedLinkedList) addEdge(a, b, w int) {
	ll.addDirectedEdge(a, b, w)
	ll.addDirectedEdge(b, a, w)
}

func (ll *weightedLinkedList) addDirectedEdge(a, b, w int) {
	if _, ok := ll.edges[a][b]; !ok {
		ll.edges[a][b] = w
		ll.deg++
	}
}

func (ll *weightedLinkedList) weight(a, b int) (int, bool) {
	w, ok := ll.edges[a][b]
	return w, ok
}

func nextWeightedLinkedList(n, m int, sc *bufio.Scanner) *weightedLinkedList {
	ll := newWeightedLinkedList(n)
	for i := 0; i < n; i++ {
		x, y, w := nextInt(sc), nextInt(sc), nextInt(sc)

		x--
		y--
		ll.addEdge(x, y, w)
	}
	return ll
}

func nextDirectedWeightedLinkedList(n, m int, sc *bufio.Scanner) *weightedLinkedList {
	ll := newWeightedLinkedList(n)
	for i := 0; i < n; i++ {
		x, y, w := nextInt(sc), nextInt(sc), nextInt(sc)

		x--
		y--
		ll.addDirectedEdge(x, y, w)
	}
	return ll
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
