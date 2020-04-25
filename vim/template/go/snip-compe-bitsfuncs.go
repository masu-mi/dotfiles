{{_cursor_}}
func onesCount(x uint64) (num int) {
	const m0 = 0x5555555555555555 // 01010101 ...
	const m1 = 0x3333333333333333 // 00110011 ...
	const m2 = 0x0f0f0f0f0f0f0f0f // 00001111 ...

	const m = 1<<64 - 1
	x = x>>1&(m0&m) + x&(m0&m)
	x = x>>2&(m1&m) + x&(m1&m)
	x = (x>>4 + x) & (m2 & m)
	x += x >> 8
	x += x >> 16
	x += x >> 32
	return int(x) & (1<<7 - 1)
}

func ntz(bits uint64) (num int) {
  // number of trailing zero
	return onesCount(bits&(-bits) - 1)
}

func nlz(bits uint64) (num int) {
	// number of leading zero
	bits = bits | (bits >> 1)
	bits = bits | (bits >> 2)
	bits = bits | (bits >> 4)
	bits = bits | (bits >> 8)
	bits = bits | (bits >> 16)
	bits = bits | (bits >> 32)
	return onesCount(^bits)
}

func refBit(i uint64, b uint) int {
	return int((i >> b) & 1)
}
