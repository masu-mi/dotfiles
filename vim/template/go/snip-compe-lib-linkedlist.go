{{_cursor_}}
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

type basicLinkedList struct {
	size, deg int
	edges     []intSet
}

func newLinkedList(size int) *basicLinkedList {
	ll := &basicLinkedList{size: size, edges: make([]intSet, size)}
	for i := 0; i < size; i++ {
		ll.edges[i] = newIntSet()
	}
	return ll
}

func (ll *basicLinkedList) addEdge(a, b int) {
	ll.addDirectedEdge(a, b)
	ll.addDirectedEdge(b, a)
}

func (ll *basicLinkedList) addDirectedEdge(a, b int) {
	if ll.edges[a].add(b) {
		ll.deg++
	}
}

func (ll *basicLinkedList) exists(a, b int) bool {
	return ll.edges[a].doesContain(b)
}

func nextLinkedList(n, m int, sc *bufio.Scanner) *basicLinkedList {
	ll := newLinkedList(n)
	for i := 0; i < n; i++ {
		x, y := nextInt(sc), nextInt(sc)

		x--
		y--
		ll.addEdge(x, y)
	}
	return ll
}

func nextDirectedLinkedList(n, m int, sc *bufio.Scanner) *basicLinkedList {
	ll := newLinkedList(n)
	for i := 0; i < n; i++ {
		x, y := nextInt(sc), nextInt(sc)

		x--
		y--
		ll.addDirectedEdge(x, y)
	}
	return ll
}

type intSet map[int]none

func newIntSet() intSet {
	return map[int]none{}
}

func (s intSet) add(i int) (added bool) {
	_, ok := s[i]
	added = !ok
	s[i] = mark
	return
}

func (s intSet) remove(i int) (removed bool) {
	_, removed = s[i]
	delete(s, i)
	return
}

func (s intSet) doesContain(i int) bool {
	_, ok := s[i]
	return ok
}

func (s intSet) size() int {
	return len(s)
}

func (s intSet) members() chan int {
	ch := make(chan int)
	go func() {
		defer close(ch)
		for k := range s {
			ch <- k
		}
	}()
	return ch
}

type none struct{}

var mark none
