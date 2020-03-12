{{_cursor_}}
func moduloAdd(a, b, modulo int64) int64 {
	result := a%modulo + b%modulo
	if result < 0 {
		result += modulo
	}
	return result % modulo
}

func moduloSub(a, b, modulo int64) int64 {
	result := a%modulo - b%modulo
	if result < 0 {
		result += modulo
	}
	return result % modulo
}

func moduloMul(a, b, modulo int64) int64 {
	return a % modulo * b % modulo
}

func moduloDiv(a, b, modulo int64) int64 {
	return a % moduloInv(b, modulo) % modulo
}

func moduloInv(a, modulo int64) int64 {
	b := modulo
	u, v := int64(1), int64(0)
	for b > 0 {
		t := a / b
		a, b = b, a-t*b
		u, v = v, u-t*v
	}
	u %= modulo
	if u < 0 {
		u += modulo
	}
	return u
}

func moduloPow(a, b, modulo int64) int64 {
	res := int64(1)
	for b > 0 {
		if b&1 == 1 {
			res = res * a % modulo
		}
		a = a * a % modulo
		b >>= 1
	}
	return res
}

const length = 510000

var (
	_fac  = map[int64][]int64{}
	_finv = map[int64][]int64{}
	_inv  = map[int64][]int64{}
)

func moduloCombiInit(modulo int64) {
	fac := make([]int64, length)
	finv := make([]int64, length)
	inv := make([]int64, length)

	defer func() {
		_fac[modulo] = fac
		_finv[modulo] = finv
		_inv[modulo] = inv
	}()

	fac[0], fac[1] = 1, 1
	finv[0], finv[1] = 1, 1
	inv[1] = 1
	for i := int64(2); i < length; i++ {
		fac[i] = fac[i-1] * i % modulo
		inv[i] = modulo - inv[modulo%i]*(modulo/i)%modulo
		finv[i] = finv[i-1] * inv[i] % modulo
	}
}

func moduloCombi(n, k, modulo int64) int64 {
	if n < k {
		return 0
	}
	if n < 0 || k < 0 {
		return 0
	}
	return _fac[modulo][n] * (_finv[modulo][k] * _finv[modulo][n-k] % modulo) % modulo
}
