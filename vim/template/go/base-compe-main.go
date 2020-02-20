package main

import (
	"fmt"
	"io"
	"os"
)

func main() {
	n := parseProblem(os.Stdin)
	fmt.Printf("%d\n", resolve(n))
}

func parseProblem(r io.Reader) int {
	var n int
	fmt.Fscanf(r, "%d", &n)
	return n
}

func resolve(n int) int {
	return n
}
