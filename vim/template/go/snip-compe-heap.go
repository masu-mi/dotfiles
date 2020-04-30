{{_cursor_}}
type {{_input_:type}} []{{_input_:item_type}}

func (h *{{_input_:type}}) Len() int {
	return len(*h)
}

func (h *{{_input_:type}}) Less(i, j int) bool {
	items := *h
	return items[i] < items[j]
}

func (h *{{_input_:type}}) Swap(i, j int) {
	items := *h
	items[i], items[j] = items[j], items[i]
}

func (h *{{_input_:type}}) Push(x interface{}) {
	*h = append(*h, x)
}

func (h *{{_input_:type}}) Pop() interface{} {
	items := *h
	l := items[len(items)-1]
	*h = items[0 : len(items)-1]
	return l
}

func (h *{{_input_:type}}) top() {{_input_:item_type}} {
	return (*h)[h.Len()-1]
}
