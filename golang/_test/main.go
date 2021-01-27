package main

import (
	"fmt"
	"sync"
)

func main() {
	wg := sync.WaitGroup{}
	dog := make(chan struct{})
	cat := make(chan struct{})
	fish := make(chan struct{})

	wg.Add(3)
	go Dog(&wg, dog, cat)
	go Cat(&wg, cat, fish)
	go Fish(&wg, fish, dog)
	dog <- struct{}{}

	wg.Wait()
}

func Dog(wg *sync.WaitGroup, dog, cat chan struct{}) {
	var count uint64

	defer wg.Done()
	for {
		_, ok := <-dog
		if !ok {
			close(cat)
			fmt.Printf("dog count: %d\r\n", count)
			return
		}
		count++
		fmt.Println("dog")
		cat <- struct{}{}
	}
}

func Cat(wg *sync.WaitGroup, cat, fish chan struct{}) {
	var count uint64

	defer wg.Done()
	for {
		_, ok := <-cat
		if !ok {
			close(fish)
			fmt.Printf("cat count: %d\n", count)
			return
		}
		count++
		fmt.Println("cat")
		fish <- struct{}{}
	}
}

func Fish(wg *sync.WaitGroup, fish, dog chan struct{}) {
	var count uint64

	defer wg.Done()
	for {
		_, ok := <-fish
		if !ok {
			return
		}
		fmt.Println("fish")
		if count++; count >= 100 {
			close(dog)
			fmt.Printf("fish count: %d\n", count)
			return
		}
		dog <- struct{}{}
	}
}
