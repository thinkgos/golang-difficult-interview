package main

import (
	"fmt"
)

type N int

func (n *N) test() {
	fmt.Println(*n)
}

func main() {
	var n N = 10

	n++
	f1 := n.test

	n++
	f2 := n.test

	n++
	fmt.Println(n)

	f1()
	f2()
}
