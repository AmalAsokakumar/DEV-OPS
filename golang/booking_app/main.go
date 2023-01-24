package main // usually a package is needed 

import "fmt" // this is from the print function is imported from. 

func main() { // to show the starting point or where to start, per application one main is needed. 
	var name string = "movie booking" // we can explicitly set the data type of the variable here
	var ticketPrice float64= 50 // create contestant keyword 
	const ticketNumber  = 50 // uint unsigned integer which prevent user for entering a negative number.
	var remainingTickets uint = 50

	variable_ := "value" // in golang this is an alternative to assign value to a variable. it cannot be used to create a constant and cannot creat a variable of explicit type.
	fmt.Printf("variable type is %T", variable_)

	fmt.Println("welcome to",name, "app")
	fmt.Println("ticket price is ",ticketPrice)
	fmt.Println("we have a total of",ticketNumber,"tickets left")
	// here we can use place holders instead 
	fmt.Printf("Welcome to %+v app \n", name)
	fmt.Printf("ticket price is %v \n", ticketPrice)
	fmt.Printf("total number of ticket purchased is %v \n",ticketNumber - remainingTickets)
	fmt.Printf("we have a total of %v tickets left \n", ticketNumber)

	// we need to let go know what kind of dat that we are going to store in this variable 
	var userName string  = ""
	var age uint
	userName = "Tom" 
	// getting username 
	// print the type of Variables
	fmt.Printf("\nname is %T \n ticketPrice is %T\n ticketNumber is %T \n remainingTickets is %T \n userName is %T\n",name, ticketPrice, ticketNumber, remainingTickets, userName)
	fmt.Println(userName)


	//user input 
	// fmt.Scan()
	fmt.Println("asking user for inputs  ") // a simple code for asking user input.
	fmt.Println("enter the user name: ") //
	fmt.Scan(&userName) // add a pointer to store the user input value in variable in the memory address of the variable
	fmt.Println("enter your age")
	fmt.Scan(&age)
	fmt.Println("userName is : ", userName )
	fmt.Println("age is ", age)
}
//38; minutes into annas video