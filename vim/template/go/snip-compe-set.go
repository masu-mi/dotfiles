{{_cursor_}}
type {{_input_:set_type}} map[{{_input_:item_type}}]none

func newSet() {{_input_:set_type}} {
  return make(map[{{_input_:item_type}}]none)
}

func (s {{_input_:set_type}}) add(item {{_input_:item_type}}) {
	s[item] = mark
}

func (s {{_input_:set_type}}) doesContain(item {{_input_:item_type}}) bool {
	_, ok := s[item]
	return ok
}

func (s {{_input_:set_type}}) size() int {
	return len(s)
}

func (s {{_input_:set_type}}) members() (l []{{_input_:item_type}}) {
	for k := range s {
		l = append(l, k)
	}
	return l
}

var mark none

type none struct{}
