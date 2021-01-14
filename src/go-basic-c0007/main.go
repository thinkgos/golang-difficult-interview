package main

import (
	"fmt"
)

type N int

func (n N) test() {
	fmt.Println(n)
}

func main() {
	var n N = 10
	p := &n

	n++
	f1 := n.test

	n++
	f2 := p.test

	n++
	fmt.Println(n)

	f1()
	f2()
}
