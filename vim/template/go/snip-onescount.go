{{_cursor_}}
func onesCount(bits {{_input_:type}}) (num {{_input_:type}}) {
	num = (bits >> 1) & 03333333333
	num = bits - num - ((num >> 1) & 03333333333)
	num = ((num + (num >> 3)) & 0707070707) % 077
	return
}
