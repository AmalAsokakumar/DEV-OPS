package main

import (
	"fmt"
	"os"
)

func main() {
	args := os.Args
	if len(args) < 2 {
		fmt.Printf("Usage: ./hello-world <arguments>\n")
		os.Exit(1)
	}
	fmt.Printf("The first Argument is : %v\n",args[1:]) // to print a specif element.
}