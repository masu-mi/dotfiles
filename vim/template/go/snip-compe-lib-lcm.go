
{{_cursor_}}
// package: gocom
// packed src of [/Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/lcm.go /Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/gcd.go] with goone.

func lcm(a, b int) int {
	return a * b / gcd(a, b)
}
func gcd(a, b int) int {
	for b > 0 {
		t := a / b
		a, b = b, a-t*b
	}
	return a
}
