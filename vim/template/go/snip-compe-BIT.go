{{_cursor_}}
type BIT struct {
	size int
  list []{{_input_:type}}
}

var ErrInvalidIndex = errors.New("BIT index require > 0")

func newBIT(size int) *BIT {
	return &BIT{size: size, list: make([]{{_input_:type}}, size+1)}
}

func (b *BIT) add(index int, v {{_input_:type}}) {
	if index == 0 {
		panic(ErrInvalidIndex)
	}
	for i := index; i <= b.size; i += (i & -i) {
		b.list[i] += v
	}
}

func (b *BIT) accum(index int) (a {{_input_:type}}) {
	if index <= 0 {
		return 0
	}
	for i := index; i > 0; i -= (i & -i) {
		a += b.list[i]
	}
	return a
}

func (b *BIT) sum(s, e int) {{_input_:type}} {
	return b.accum(e) - b.accum(s-1)
}

func (b *BIT) value(i int) {{_input_:type}} {
	return b.accum(i) - b.accum(i-1)
}
