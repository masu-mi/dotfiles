{{_cursor_}}
func lowerBound(n int, f func(i int) bool) int {
	return sort.Search(n, f)
}

func upperBound(n int, f func(i int) bool) int {
	return sort.Search(n, func(i int) bool { return !f(i) }) - 1
}
