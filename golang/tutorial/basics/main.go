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

// package main

// import (
// 	"fmt"
// 	"reflect"
// )

// func main() {
// 	fmt.Println("please enter your name ")
// 	var name string
// 	fmt.Scanf("%s",&name) // similar to c programming.
// 	fmt.Printf(" %s is really your name \n", name)
// 	fmt.Printf("it is stored in this %v location.\n",&name) // memory location of the variable
// 	var var1, var2 string
// 	fmt.Printf("enter 2 values ")
// 	fmt.Scanf("%s %s",&var1, &var2)
// 	fmt.Println("the variable name is type of ",reflect.TypeOf(name))
// 	fmt.Println("the variable var is type of : ",reflect.TypeOf(name).Kind())
// 	fmt.Printf("the type of variable 'name' : %T \n", name)
// }

// package main

// import (
// 	"fmt"
// 	"reflect"
// 	"strconv"
// )
// func main() {
// 	var s string = "200"
// 	fmt.Println("printing s ",s)
// 	fmt.Println("the type of s is ", reflect.TypeOf(s))
// 	i, err := strconv.Atoi(s)
// 	fmt.Println("the type of i is ", reflect.TypeOf(i))
// 	fmt.Println("printing i ",i)
// 	fmt.Println("the error is ", err)
// }

// package main

// import "fmt"

// func main() {
// 	a := 10 //binary 10 -> 1010
// 	b := 2
// 	r := a >> b // move the 2 position to right
// 	l := a << b // move the 2 position to left
// 	fmt.Println("here are the shifted results ")
// 	fmt.Printf("%v is the right shifted result \n", r)
// 	fmt.Printf("%v is the left shifted result\n", l)

// }

// package main

// import "fmt"

// func main() {
// 	var str string = "hello"
// 	var str_1 string;
// 	var str_2 string;
// 	fmt.Printf("enter a string \t")
// 	fmt.Scanf("%s", &str_1)
// 	if (str == str_1) {
// 		fmt.Println("the entered string match ")
// 	}
// 	fmt.Printf("what is his favorite game ")
// 	fmt.Scanf("%s", &str_2)
// 	if str_2 != "football" {
// 		fmt.Printf("%v is not his favorite game \n", str_2)
// 	} else {
// 		fmt.Printf("%v is his favorite game",str_2)
// 	}
// }

////////////////////////////////////////////////////////////////
// switch case

// package main

// import "fmt"

// func main() {
// 	var i int = 20
// 	switch i {
// 		case 100:
// 			fmt.Println("i is 100")
// 		case 200, 300:
// 			fmt.Println("i is either 200 or 300")
// 		default:
// 			fmt.Println("i is neither 0, 100 or 300")

// 	}
// }

// swithch fall through

// package main

// import "fmt"

// func main ()  {
// 	var i int = 10
// 	switch i {
// 		case -5:
// 			fmt.Println("-5")
// 		case 10:
// 			fmt.Println("10")
// 			fallthrough
// 		case 20:
// 			fmt.Println("20")
// 			fallthrough
// 		default:
// 			fmt.Println("default")
// 	}

// }

////////////////////////////////////////////////////////////////

// loop for loop 

// package main //

// import "fmt"
// func main() {
// 	fmt.Println("Now printing the squares")
// 	for i :=0; i <=3; i++ {
// 		fmt.Println(i*i)
// 	}
// 	fmt.Println("Now printing the cubes")
// 	var i int = 1
// 	for i <= 5 {
// 		fmt.Println(i*i*i)
// 		i += 1
// 	}
// }

// break and continue 
// [package main //

// import "fmt"
// func main() {
// 	fmt.Println("Now printing the squares")
// 	for i :=0; i <=3; i++ {
// 		fmt.Println(i*i)
// 	}
// 	fmt.Println("Now printing the cubes")
// 	var i int = 1
// 	for i <= 5 {
// 		if i == 4 {
// 			fmt.Println("i")
// 			break
// 		} else if i == 2 {
// 			continue
// 		}else{
// 			fmt.Println(i*i*i)
// 		}
// 		i += 1
// 	}]
}

