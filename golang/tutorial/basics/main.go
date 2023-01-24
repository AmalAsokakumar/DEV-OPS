// package main

// import "fmt"

// func main() {

// 	fmt.Println("hello world")  // mode 2

// 	var greeting string = "good morning"  // variable declaration and assignment
// 	fmt.Println(greeting)

// 	var newName string // declaring the variable.
// 	new := "hello this is a test that i have just created"
// 	fmt.Print("lets see what this message is \n",new,"\n") // mode 1
// 	newName = "test"  // assigning values to the variable.

// 	new_variable := "test-data" // this is a short hand operator to create a variable and assigning the value to it
// 	fmt.Printf("%v \n", new) // mode 3 - format specifiers,
// 	fmt.Printf("%s \n", newName)
// 	fmt.Printf("%v \n", new_variable) // mode

// }

////////////////////////////////////////////////////////////////
// package main

// import "fmt"

// var x int // x is automatically assigned the zero value of 0

// func main() {
//     var y string // y is automatically assigned the zero value of ""
//     fmt.Println(x, y) // Output: "0 "
// }

////////////////////////////////////////////////////////////////
// package main

// import "fmt"

// type Person struct{
// 	name string
// 	age int
// }

// func main() {
//     var p Person // p.name and p.age are automatically assigned the zero values of "" and 0 respectively
//     fmt.Println(p) // Output: "{  0}"
// }

////////////////////////////////////////////////////////////////

package main

import (
	"fmt"
	"reflect"
)

func main() {
	fmt.Println("please enter your name ")
	var name string
	fmt.Scanf("%s",&name) // similar to c programming.
	fmt.Printf(" %s is really your name \n", name)
	fmt.Printf("it is stored in this %v location.\n",&name) // memory location of the variable
	var var1, var2 string
	fmt.Printf("enter 2 values ")
	fmt.Scanf("%s %s",&var1, &var2)
	fmt.Println("the variable name is type of ",reflect.TypeOf(name))
	fmt.Println("the variable var is type of : ",reflect.TypeOf(name).Kind())
	fmt.Printf("the type of variable 'name' : %T \n", name)
}