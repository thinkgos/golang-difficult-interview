package main

import "fmt"

func main() {
	time.Unix(0, 0).Format(time.RFC1123)
}
