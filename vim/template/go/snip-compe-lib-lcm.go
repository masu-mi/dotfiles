{{_cursor_}}
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
