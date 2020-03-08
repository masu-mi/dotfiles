{{_cursor_}}
func reLU(a {{_input_:type}}) {{_input_:type}} {
	if a < 0 {
		return 0
	}
	return a
}
