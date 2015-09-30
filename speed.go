package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
)

func main() {
	a := [256]uint{}
	file, _ := os.Open(os.Args[1])
	rd := bufio.NewReader(file)
	for b, err := rd.ReadByte(); err != io.EOF; {
		a[b] += 1
		b, err = rd.ReadByte()
	}
	fmt.Printf("   ")
	for n := 0; n < 8; n++ {
		fmt.Printf("%8x", n)
	}
	for n := 0; n < 256; n++ {
		if n%8 == 0 {
			fmt.Printf("\n%02x ", n)
		}
		fmt.Printf("%8d", a[n])
	}
}
