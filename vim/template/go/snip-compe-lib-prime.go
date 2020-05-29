{{_cursor_}}
func isPrime(n int) bool {
	max := int(math.Sqrt(float64(n)))
	for i := 2; i <= max+1; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}
