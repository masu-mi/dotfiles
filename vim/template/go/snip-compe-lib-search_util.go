
{{_cursor_}}
// package: gocom
// packed src of [/Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/search_util.go] with goone.

func upperBoundOfLowerSide(n int, lowerF func(i int) bool) int {
	return sort.Search(n, func(i int) bool { return !lowerF(i) }) - 1
}
