package main

func main() {
	x := make([]int, 2, 10)
	_ = x[6:10]
	_ = x[6:]
	_ = x[2:]
}
