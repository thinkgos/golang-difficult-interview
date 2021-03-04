package main

import "fmt"

type T struct {
	ls []int
}

func foo(t T) {
	t.ls[0] = 100
}

func main() {
	var t = T{
		ls: []int{1, 2, 3},
	}

	foo(t)
	fmt.Println(t.ls[0])
}
