
{{_cursor_}}
// package: gocom
// packed src of [/Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/compressed_id.go] with goone.

type compressedID struct {
	idx map[int]int
	l   []int
}

func newCompressedID() *compressedID {
	return &compressedID{idx: make(map[int]int)}
}

func (ci *compressedID) addItem(item int) {
	ci.l = append(ci.l, item)
}

func (ci *compressedID) build() {
	sort.Sort(sort.IntSlice(ci.l))
	uniq(&ci.l)
	for id, name := range ci.l {
		ci.idx[name] = id
	}
}
func uniq(l *[]int) {
	if len(*l) == 0 {
		return
	}
	li := *l
	r := make([]int, 0, len(li))
	pre := li[0]
	r = append(r, li[0])
	for i := 1; i < len(li); i++ {
		if pre == li[i] {
			continue
		}
		r = append(r, li[i])
		pre = li[i]
	}
	*l = r
}

func (ci *compressedID) name(id int) int {
	return ci.l[id]
}
func (ci *compressedID) id(name int) int {
	return ci.idx[name]
}
