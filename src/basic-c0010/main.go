package main

import (
	"fmt"
	"unsafe"
)

type demo0 struct {
	b int32
	c int32
	a struct{}
}

type demo1 struct {
	a struct{}
	b int32
	c int32
}

type demo2 struct {
	b int32
	a struct{}
	c int32
}

func main() {
	fmt.Println(unsafe.Sizeof(demo0{}), unsafe.Sizeof(demo1{}), unsafe.Sizeof(demo2{}))
}
