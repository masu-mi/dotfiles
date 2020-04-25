{{_cursor_}}
func bitCombinations(num int) chan uint {
	ch := make(chan uint)
	go func() {
		defer close(ch)
		for i := 0; i < 1<<uint(num); i++ {
			ch <- uint(i)
		}
	}()
	return ch
}

func bitCombinationsOverSubsets(nums ...int) chan uint {
	ch := make(chan uint)
	s := uint(0)
	for _, v := range nums {
		s |= 1 << uint(v)
	}
	go func() {
		defer close(ch)
		for bit := s; ; bit = (bit - 1) & s {
			ch <- uint(bit)
			if bit == 0 {
				break
			}
		}
	}()
	return ch
}

func bitCombinationsWithSize(num, size int) chan uint {
	ch := make(chan uint)
	bit := uint(1<<uint(size) - 1)
	go func() {
		defer close(ch)
		for ; bit < 1<<uint(num); bit = nextBitCombination(uint(bit)) {
			ch <- bit
		}
	}()
	return ch
}

func nextBitCombination(cur uint) uint {
	x := cur & -cur // rightest bit only         '10100' -> '00100'
	y := cur + x    // carry at rightest 1-block '10111' -> '11000'
	return (((cur & ^y) / x) >> 1) | y
}
