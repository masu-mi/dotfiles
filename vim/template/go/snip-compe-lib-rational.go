
{{_cursor_}}
// package: gocom
// packed src of [/Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/rational.go /Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/gcd.go /Users/masumi/dev/src/github.com/masu-mi/gamemo/lib/gocom/next.go] with goone.

type rational struct {
	frac, denomi int
	neg          int
}

func newRational(frac, denomi int) rational {
	r := rational{frac: frac, denomi: denomi}
	r.canonicalize()
	return r
}

func ratMul(x, y rational) rational {
	r := rational{
		frac:   x.frac * y.frac,
		denomi: x.denomi * y.denomi,
	}
	r.canonicalize()
	return r
}

func ratDiv(x, y rational) rational {
	return ratMul(x, ratInv(y))
}

func ratInv(x rational) rational {
	return rational{frac: x.denomi, denomi: x.frac}
}

func ratAdd(x, y rational) rational {
	r := rational{
		frac:   x.frac*y.denomi + y.frac*x.denomi,
		denomi: x.denomi * y.denomi,
	}
	r.canonicalize()
	return r
}

func ratSub(x, y rational) rational {
	return ratAdd(x, rational{frac: -y.frac, denomi: y.denomi})
}

func (r rational) Float64() float64 {
	b := float64(r.frac) / float64(r.denomi)
	if r.neg == 1 {
		return -b
	}
	return b
}

func (r rational) String() string {
	b := fmt.Sprintf("%d/%d", r.frac, r.denomi)
	if r.neg == 1 {
		return "-" + b
	}
	return b
}

func (r rational) equal(other rational) bool {
	r.canonicalize()
	other.canonicalize()

	return r.neg == other.neg &&
		r.frac == other.frac &&
		r.denomi == other.denomi
}

func (r *rational) canonicalize() {
	if r.frac < 0 {
		r.neg ^= 1
		r.frac = -r.frac
	}
	if r.denomi < 0 {
		r.neg ^= 1
		r.denomi = -r.denomi
	}
	d := gcd(r.frac, r.denomi)
	r.frac /= d
	r.denomi /= d
}

func nextRational(sc *bufio.Scanner) rational {
	s := nextString(sc)
	i := strings.Index(s, ".")
	if i != -1 {
		decimalDigit := len(s) - i - 1
		fr, _ := strconv.Atoi(strings.Replace(s, ".", "", 1))
		return newRational(fr, int(math.Pow10(decimalDigit)))
	}
	i = strings.Index(s, "/")
	if i != -1 {
		fr, _ := strconv.Atoi(s[0:i])
		de, _ := strconv.Atoi(s[i+1 : len(s)])
		return newRational(fr, de)
	}
	fr, _ := strconv.Atoi(s)
	return newRational(fr, 1)
}
func gcd(a, b int) int {
	for b > 0 {
		t := a / b
		a, b = b, a-t*b
	}
	return a
}
func nextInt(sc *bufio.Scanner) int {
	sc.Scan()
	a, _ := strconv.Atoi(sc.Text())
	return int(a)
}

func nextString(sc *bufio.Scanner) string {
	sc.Scan()
	return sc.Text()
}

func nextIntSlice(sc *bufio.Scanner, n int) (a []int) {

	a = make([]int, n)
	for i := 0; i < n; i++ {
		a[i] = nextInt(sc)
	}
	return a
}
