{{_cursor_}}
func upperBoundOfLowerSide(n int, lowerF func(i int) bool) int {
	return sort.Search(n, func(i int) bool { return !lowerF(i) }) - 1
}
