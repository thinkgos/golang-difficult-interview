package main

import (
	"fmt"
)

func main() {
	a := [2]int{5, 6}
	b := [2]int{5, 6}

	// ①
	if a == b {
		fmt.Println("equal")
	} else {
		fmt.Println("not equal")
	}

	// ②
	// if a[:] == b[:] {
	// 	fmt.Println("equal")
	// } else {
	// 	fmt.Println("not equal")
	// }
}
