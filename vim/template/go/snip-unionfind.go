{{_cursor_}}
type {{_input_:type}} struct {
	card      int
	connected bool

	parent []int
	rank   []int
	childs []int
}

func newUnifonFind(size int) *{{_input_:type}} {
	uf := &{{_input_:type}}{
		card:   size,
		parent: make([]int, size),
		rank:   make([]int, size),
		childs: make([]int, size),
	}
	for i := 0; i < size; i++ {
		uf.parent[i] = i
	}
	return uf
}

func (u *{{_input_:type}}) find(x int) int {
	p := u.parent[x]
	if p == x {
		return x
	}
	r := u.find(p)
	u.parent[x] = r
	return r
}

func (u *{{_input_:type}}) same(x, y int) bool {
	return u.find(x) == u.find(y)
}

func (u *{{_input_:type}}) union(x, y int) {
	xR, yR := u.find(x), u.find(y)
	if xR == yR {
		return
	}
	if rankX, rankY := u.rank[xR], u.rank[yR]; rankX < rankY {
		u.parent[xR] = yR
		u.childs[yR] += u.childs[xR] + 1
		u.connected = u.card == u.childs[yR]+1
	} else {
		u.parent[yR] = xR
		u.childs[xR] += u.childs[yR] + 1
		u.connected = u.card == u.childs[xR]+1
		if rankX == rankY {
			u.rank[xR]++
		}
	}
}

func (u *{{_input_:type}}) size(x int) int {
	return u.childs[u.find(x)] + 1
}
