package main

import (
	"fmt"
	"io"
	"os"
)

func main() {
	fmt.Printf("%d\n", resolve(parseProblem(os.Stdin)))
}

func parseProblem(r io.Reader) int {
	var n int
	fmt.Fscanf(r, "%d", &n)
	return n
}

func resolve(n int) int {
	return n
}
