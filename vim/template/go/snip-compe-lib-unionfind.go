
{{_cursor_}}
// package: gocom
// packed src of [/Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/unionfind.go] with goone.

type unionfind struct {
	card      int
	connected bool

	parent []int
	rank   []int
	childs []int
}

func newUnifonFind(card int) *unionfind {
	uf := &unionfind{
		card:      card,
		parent:    make([]int, card),
		rank:      make([]int, card),
		childs:    make([]int, card),
		connected: card == 1,
	}
	for i := 0; i < card; i++ {
		uf.parent[i] = i
	}
	return uf
}

func (u *unionfind) find(x int) int {
	p := u.parent[x]
	if p == x {
		return x
	}
	r := u.find(p)
	u.parent[x] = r
	return r
}

func (u *unionfind) same(x, y int) bool {
	return u.find(x) == u.find(y)
}

func (u *unionfind) union(x, y int) {
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

func (u *unionfind) size(x int) int {
	return u.childs[u.find(x)] + 1
}
