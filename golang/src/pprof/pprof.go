package main

import (
	"fmt"
	"math/rand"
	"net/http"
	"os"
	"strconv"
	"time"

	_ "net/http/pprof"
)

func main() {
	fmt.Println(os.Getpid())
	fmt.Println("http://localhost:8080/debug/pprof")
	go func() {
		http.ListenAndServe(":8080", nil)
	}()
	// busy working....
	// Force the GC to work to make the plots "move".
	m := map[string][]byte{}

	for {
		b := make([]byte, 512+rand.Intn(16*1024))
		m[strconv.Itoa(len(m)%(10*100))] = b

		if len(m)%(10*100) == 0 {
			m = make(map[string][]byte)
		}

		time.Sleep(10 * time.Millisecond)
	}
}
