package main

import (
	"testing"
)

func TestResolve(t *testing.T) {
	type testCase struct{ in, exp int }
	for _, c := range []testCase{} {
		got := resolve(c.in)
		if got != c.exp {
			t.Fatalf("want %v, but %v:", c.exp, got)
		}
	}
}
