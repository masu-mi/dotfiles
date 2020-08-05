
{{_cursor_}}
// package: gocom
// packed src of [/Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/exhaustive_permutations.go] with goone.

func permutations(l int) chan []int {
	ch := make(chan []int)
	go func() {
		dfsPermutations(0, make([]bool, l), []int{}, func(perm []int) bool {
			p := make([]int, len(perm))
			copy(p, perm)
			ch <- p
			return false
		})
		close(ch)
	}()
	return ch
}

func dfsPermutations(pos int, used []bool, perm []int, atLeaf func(perm []int) (halt bool)) (halt bool) {
	l := len(used)
	if pos == l {
		if atLeaf(perm) {
			return true
		}
	}

	for i := 0; i < l; i++ {
		if used[i] {
			continue
		}
		used[i] = true
		if dfsPermutations(pos+1, used, append(perm, i), atLeaf) {
			return true
		}
		used[i] = false
	}
	return false
}
