package main

import (
	"log"
)

func main() {

	var x int

	inc := func() int {
		x++
		return x
	}
	log.Println(func() (int, int) {
		return inc(), inc()
	}())
}
