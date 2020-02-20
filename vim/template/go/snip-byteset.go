{{_cursor_}}

func newByteSet(input string) byteSet {
	s := newSet()
	for i := 0; i < len(input); i++ {
		s.add(input[i])
	}
	return s
}

type byteSet map[byte]none

func newSet() byteSet {
	return make(map[byte]none)
}

func (s byteSet) add(item byte) {
	s[item] = mark
}

func (s byteSet) doesContain(item byte) bool {
	_, ok := s[item]
	return ok
}

var mark none

type none struct{}
