
{{_cursor_}}
// package: gocom
// packed src of [/Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/int_util.go] with goone.

func pow(n, i int) (res int) {
	res = 1
	for i > 0 {
		if i&1 == 1 {
			res *= n
		}
		i >>= 1
		n *= n
	}
	return res
}

func enumDivisors(n int) (r []int) {
	max := int(math.Sqrt(float64(n))) + 1
	for i := 1; i < max; i++ {
		if n%i == 0 {
			r = append(r, i)
			if n/i != i {
				r = append(r, n/i)
			}
		}
	}
	sort.Sort(sort.IntSlice(r))
	return r
}
