<!-- 
    color combination used in this readme.txt file 

    heading : teal
    data type : gold
    variable : yellow
    values : pink
    variable type : cyan
    packages : red
 -->


# <span style="color:teal">GO </span>

1. [introduction](#introduction )
2. [variables, data types, assignment](#variables)
3. [print variables](#print_variables)
4. [Format specifiers](#format_specifiers)
5. [Scope of variables](#scope_of_variables)
6. [Zero Values](#zero_values)
7. [User input](#user_input)
8. [Find variable type](#find_the_variable_type_)


## introduction 
To create a Go Lang project, you will need to create a new directory for your project and then create a file called main.go within that directory. In this file, you can write your Go code.

<span style="color:green"> </span>
Here's an example of a basic main.go file:

```
package main

import "fmt"

func main() {
    fmt.Println("Hello, Go Lang!")
}
```
You can run this code by using the following command in the terminal:

```
go run main.go
```
This command will run the <span style="color:green">main </span>  function in the <span style="color:orange">main.go</span> file and will output `"Hello, Go Lang!"` to the console

## Datatypes 

1. <span style="color:gold">string </span>
2.  <span style="color:gold">number </span> <br> <span style="color:cyan">integer </span> <br> <span style="color:cyan"> float</span>
3. <span style="color:gold">boolean </span>
4. <span style="color:gold"> array</span>
5. <span style="color:gold">map </span>


## variables

In the programming language Go, a variable is a <span style="color:cyan"> storage location</span> for a value. Variables are declared with a specific type, such as <span style="color:cyan"> int</span>  for integers, <span style="color:cyan">float64 </span> for floating-point numbers, or <span style="color:cyan">string  </span>for strings. The syntax for declaring a variable in Go is:

```
var <variable_name> <data_type> = <value>
var variableName type
```
```
var s string = "hello world"
var i int = 100
var b bool = false // value can only be true or false
var f float64 = 77.90
```
```
var x int = 5
var y string = "hello"
var z bool = true
```

In the above example, <span style="color:yellow">x </span>  is an <span style="color:gold">integer</span> variable with a value of <span style="color:pink">5 </span>, <span style="color:yellow">y</span> is a <span style="color:gold">string </span>variable with a value of <span style="color:pink">"hello" </span>, and <span style="color:yellow">z </span>is a <span style="color:gold">boolean </span> variable with a value of <span style="color:pink">true</span>.

You can also declare multiple variables at once:

```
var a, b, c int
```

For example, to declare an <span style="color:green"> </span>integer variable called age, you would write:

```
var age int
```
You can also initialize a variable when you declare it by assigning a value to it. For example:

```
var name string = "John"
var name, address string = "John" , "john bhavan"
```
Alternatively Go also have shorthand notation for declaration and initialization

###### short variable declaration.
```
name := "John"

```
Once a variable is declared, you can assign a new value to it using the assignment operator <span style="color:green"> </span>(=). For example, to assign the value 42 to the age variable, you would write:

```
age = 42
```
You can then use the variable in your code by referencing its name. For example, to print the value of the age variable, you would write:

```
fmt.Println(age)
```
`It will print 42`

You can also specify the type of variable and the value:

```
x := 5 // x is of type int
y := "hello" // y is of type string
```
You can also use the <span style="color:green"> </span>"new" keyword to create a new variable and allocate <span style="color:green"> </span>memory for it:

```
x := new(int)
*x = 5
```
In this example, the <span style="color:green"> </span>`"new"` keyword creates a new variable of type <span style="color:green"> </span>`"int"`, and the <span style="color:green"> </span>`"*x = 5"` assigns the value of <span style="color:green"> </span>5 to the <span style="color:green"> </span>`memory location` `pointed` to by the <span style="color:green"> </span>`x` variable.

You can also use the shorthand notation to assign a value to a variable:

```
x := 5
x = x + 1
x += 1
```
In this example, <span style="color:green"> </span>x = x + 1 and <span style="color:green"> </span>x += 1 both add 1 to the value of x, resulting in x being equal to 6.

In addition to the basic variable declaration and assignment, Go also has a number of other ways to declare and work with variables.

One of these is using the <span style="color:green"> </span>`"const"` keyword to declare a <span style="color:green"> </span>constant variable, which cannot be changed once it is set. For example:

```
const pi = 3.14
```
You can also use the <span style="color:green"> </span>"&" operator to get the <span style="color:green"> </span>memory address of a variable:

```
x := 5
fmt.Println(&x)
```
In this example, <span style="color:green"> </span>`"&x"` returns the <span style="color:green"> </span>memory address of the <span style="color:green"> </span>`x` variable, and `fmt.Println()` prints it out.

You can also use the <span style="color:green"> </span>`"*"` operator to access the value stored at a memory address:

```
x := 5
p := &x
fmt.Println(*p) // prints 5
```
In this example,<span style="color:green"> </span> "p" is a <span style="color:green"> </span>`pointer` to the memory address of <span style="color:green"> </span>x, and <span style="color:green"> </span>`"*p"` is the value stored at that address.

You can also use the <span style="color:green"> </span>"new" keyword to create a new variable and <span style="color:green"> </span>allocate memory for it:

```
x := new(int)
*x = 5
```
In this example, the <span style="color:green"> </span>"new" keyword creates a new variable of type <span style="color:green"> </span>"int", and the <span style="color:green"> </span>"*x = 5" assigns the value of <span style="color:green"> </span>5 to the <span style="color:green"> </span>memory location pointed to by the <span style="color:green"> </span>x variable.

You can also <span style="color:green"> </span>declare variables with <span style="color:green"> </span>package level scope, which are <span style="color:green"> </span>accessible within the package where they are declared and also to the <span style="color:green"> </span>imported packages.


## print_variables

In Go, there are several ways to display the value of a variable. The most common method is to use the fmt package and its Println() function.

```
package main

import "fmt"

func main() {
    x := 5
    fmt.Println(x)
}
```
In this example, `fmt.Println(x)` is used to display the value of the` x` variable, which is `5`.

You can also use the `Printf()` function to format the output of a variable.


```
fmt.Printf("The value of x is: %d\n", x)
```
In this example, `%d` is a placeholder for an `integer` value, and `x` is the variable that will be displayed.

You can also use the `%v` placeholder to display the value of a variable `in` its `default forma`t.

```
fmt.Printf("x: %v\n", x)
```
You can also use the `%T` placeholder to display the `type` of a `variable.`

```
fmt.Printf("x is of type: %T\n", x)
```
In addition, you can also use the `Print()` function, which is similar to Println(), but it `doesn't add` a `newline character` at the end of the output.

```
fmt.Print(x)
```
You can also use the `println()` function from the `log package` to print variables, this package is `similar to` the fmt package and it prints to `standard error`.

```
log.Println(x)
```

## format_specifiers

Format specifiers are placeholders in a string that indicate where a variable value should be inserted. They are used in conjunction with the `printf()` function in C programming and the `format()` method in Python, among other programming languages, to specify the type and format of the value that will be inserted into the string. Examples of format specifiers include %d for integers, %f for floating-point numbers, and %s for strings.


In Go, format specifiers are used in the` Printf()` and `Sprintf()` functions to specify the type and format of the values that will be inserted into a string. Here are a few examples of the most commonly used format specifiers in Go:

- %d: for integers
- %f: for floating-point numbers
- %s: for strings
- %v: for any value
- %t: for boolean values
- %x: for hexadecimal representation of integers

Here's an example of how these format specifiers can be used in Go:

```
package main

import (
	"fmt"
)

func main() {
    age := 30
    price := 9.99
    name := "John Doe"
    isStudent := true

    fmt.Printf("Name: %s\n", name)
    fmt.Printf("Age: %d\n", age)
    fmt.Printf("Price: $%f\n", price)
    fmt.Printf("isStudent: %t\n", isStudent)
    fmt.Printf("Age in Hex: %x\n", age)
}
```
In this example, %s, %d, %f, %t, %x are format specifiers. The %s specifies that a string should be inserted, the %d specifies that an integer should be inserted, the %f specifies that a floating point number should be inserted, %t for boolean value and %x for hexadecimal representation of integers.

You can also use positional arguments to format string in Go.

```
fmt.Printf("Name: %[1]s, Age: %[2]d, Price: $%[3]f", name, age, price)
```
Here the place holder is %[] and we are passing the values through positional arguments.

In addition to the basic format specifiers, Go also provides a number of additional options for formatting values. Here are a few examples:

- %+d: for signed integers (e.g. +30 or -30)
- %.2f: for floating-point numbers with 2 decimal places (e.g. 9.99)
- %9s: for strings with a minimum width of 9 characters
- %-9s: for left-justified strings with a minimum width of 9 characters
- %09d: for integers with leading zeroes for values less than 9 characters wide
- %#x: for hexadecimal representation with leading 0x
Here's an example that demonstrates how these additional options can be used:

```
package main

import (
	"fmt"
)

func main() {
    age := 30
    price := 9.99
    name := "John Doe"
    isStudent := true

    fmt.Printf("Name: %-9s\n", name)
    fmt.Printf("Age: %+d\n", age)
    fmt.Printf("Price: $%.2f\n", price)
    fmt.Printf("isStudent: %t\n", isStudent)
    fmt.Printf("Age in Hex: %#x\n", age)
}
```
In this example, `%+d`, `%.2f`, `%-9s`, `%#x` are additional format specifiers. The `%+d` adds a sign to the number, `%.2f` limits the decimal places, `%-9s `left justifies the string with width of 9, `%#x` adds leading 0x to hexadecimal representation.

It's important to note that in Go, you don't have to use the same format specifier for each value. You can use different format specifiers for different values.

In addition to the above-mentioned format specifiers, Go has many more format specifiers to handle different types of data or formatting requirements. It's always a good idea to check the official documentation for a full list of the available format specifiers and their options

## scope_of_variables

In Go, variables have a specific scope, which determines where in the program they can be accessed.

The two main types of variable scope in Go are:

`Package level` scope: Variables declared at the package level (outside of any function) have package level scope and can be `accessed from any file within the package`.

`Function level` scope: Variables declared within a function have function level scope and can `only be accessed within that function`.

Additionally, Go also has `block level scope`, which means that variables declared inside a block (such as an if statement or for loop) `can only be accessed within that block`.

It's also worth noting that Go has a special variable called `"blank identifier"` which can be used to discard a value, this variable is usually represented by` _.`


Here are some examples of variable scope in Go:



###### Package level scope:
```
package main

var x int = 5 // x has package level scope and can be accessed from any file within the main package

func main() {
    fmt.Println(x) // This will output "5"
}
```



###### Function level scope:
```
func main() {
    y := 10 // y has function level scope and can only be accessed within the main function
    fmt.Println(y) // This will output "10"
}

func otherFunction() {
    fmt.Println(y) // This will cause an error, because y is not in scope
}
```



###### Block level scope:
```
func main() {
    if true {
        z := 15 // z has block level scope and can only be accessed within the if block
        fmt.Println(z) // This will output "15"
    }
    fmt.Println(z) // This will cause an error, because z is not in scope
}
```



###### Blank identifier:
```
func main() {
    _, _, name := getName()
    fmt.Println(name) // This will output the "name" variable
}

func getName() (string, string, string) {
    return "John", "Doe", "John Doe"
}
```


In this example, the first two returned values are being discarded using the blank identifier.

It's worth noting that variable shadowing is also possible. Where a variable with the same name is declared in a inner scope and it will override the outer scope variable with the same name.

## zero_values

In Go, when a variable is declared but not initialized, it is assigned a "zero value". The zero value is different for each data type and is as follows:

- Numeric types (int, float, etc.) have a zero value of 0.

- Boolean type has a zero value of false.

- Strings have a zero value of "".

- Pointers, functions, interfaces, slices, channels, and maps have a zero value of nil.

It's important to note that zero values are different from the default values. Default values are the values that a variable is assigned when a new instance of a struct is created. Go does not have a `built-in way` to `specify default values` for struct fields, but it's common practice to use a constructor function to set default values.

```
type Person struct {
    name string
    age int
}

func NewPerson(name string) *Person {
    return &Person{name: name, age: 0}
}

func main() {
    p := NewPerson("John")
    fmt.Println(p) // &{John 0}
}
```

In this example, the NewPerson function creates and returns a new instance of the Person struct with the name field set to the given value and the age field set to 0.

in Go when a variable is declared without being explicitly initialized, it is automatically assigned the zero value for its data type. This is true for variables declared at both package and function level scope, as well as for struct fields.

```
package main

var x int // x is automatically assigned the zero value of 0

func main() {
    var y string // y is automatically assigned the zero value of ""
    fmt.Println(x, y) // Output: "0 "
}
```

```
type Person struct {
    name string
    age int
}

func main() {
    var p Person // p.name and p.age are automatically assigned the zero values of "" and 0 respectively
    fmt.Println(p) // Output: "{  0}"
}
```

It's worth noting that it's considered a best practice to initialize variables with an appropriate value rather than relying on the zero value, this is especially important when working with pointers, slices, channels and maps as they could cause panic if used before initialization.



## User_Input

In Go, you can use the fmt package to read input from the user. The fmt.Scanf() function is commonly used for this purpose. Here's an example of how to use fmt.Scanf() to read a string from the user:

```
package main

import "fmt"

func main() {
    var name string
    fmt.Print("Enter your name: ")
    fmt.Scanf("%s", &name)
    fmt.Println("Hello, ", name)
}
```

In this example, fmt.Print("Enter your name: ") is used to prompt the user to enter their name. Then, fmt.Scanf("%s", &name) is used to read the input as a string and store it in the variable name. Finally, fmt.Println("Hello, ", name) is used to print a greeting to the user.

Here's an example of how to read a number from the user:

```
package main

import "fmt"

func main() {
    var age int
    fmt.Print("Enter your age: ")
    fmt.Scanf("%d", &age)
    fmt.Println("Your age is: ", age)
}
```

In this example, fmt.Print("Enter your age: ") is used to prompt the user to enter their age. Then, fmt.Scanf("%d", &age) is used to read the input as an int and store it in the variable age. Finally, fmt.Println("Your age is: ", age) is used to print the age that the user entered.

You can also use fmt.Scanln() and fmt.Scan() for similar purposes.

Alternatively you could use the bufio package to read input from the user. For example,

```
package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter text: ")
    text, _ := reader.ReadString('\n')
    fmt.Println(text)
}
```

This example uses bufio.NewReader(os.Stdin) to create a new buffered reader for the standard input, fmt.Print("Enter text: ") to prompt the user to enter some text, reader.ReadString('\n') to read a line of text from the user, and fmt.Println(text) to print the text that the user entered.

## find_the_variable_type_

In Golang, we can find the type of a variable using:

1. The `TypeOf()` within the `reflect package`
2. The `ValueOf.Kind()` within the `reflect package`
3. The `%T` and `Printf()` within the `fmt package`

###### reflect.TypeOf()

The reflect.TypeOf() function accepts a variable as a parameter and returns its type.

```
package main

import (
	"fmt"
	"reflect"
)

func main() {
	// string
	var variable1 string
	// integer
	var variable2 int
	// float64
	var variable3 float64
	// bool
	var variable4 bool
	// slice
	var variable5 = []string{}

	fmt.Println("Type of variable1:",reflect.TypeOf(variable1))
	fmt.Println("Type of variable2:",reflect.TypeOf(variable2))
	fmt.Println("Type of variable3:",reflect.TypeOf(variable3))
	fmt.Println("Type of variable4:",reflect.TypeOf(variable4))
	fmt.Println("Type of variable5:",reflect.TypeOf(variable5))
}
```


###### reflect.ValueOf().Kind()


The `reflect.ValueOf()` function accepts a variable as a parameter. By appending the `Kind()` function to it, we can get the `type of that variable`.
```
package main

import (
	"fmt"
	"reflect"
)

func main() {
	// string
	var variable1 string
	// integer
	var variable2 int
	// float64
	var variable3 float64
	// bool
	var variable4 bool
	// slice
	var variable5 = []string{}

	fmt.Println("Type of variable1:",reflect.ValueOf(variable1).Kind())
	fmt.Println("Type of variable2:",reflect.ValueOf(variable2).Kind())
	fmt.Println("Type of variable3:",reflect.ValueOf(variable3).Kind())
	fmt.Println("Type of variable4:",reflect.ValueOf(variable4).Kind())
	fmt.Println("Type of variable5:",reflect.ValueOf(variable5).Kind())
}
```

###### %T and Printf()

The fmt.Printf() function contains a format type %T that represents the type of a variable.

```
package main

import (
	"fmt"
)

func main() {
// string
	var variable1 string
	// integer
	var variable2 int
	// float64
	var variable3 float64
	// bool
	var variable4 bool
	// slice
	var variable5 = []string{}

	fmt.Printf("Type of variable1: %T\n", variable1)
	fmt.Printf("Type of variable2: %T\n", variable2)
	fmt.Printf("Type of variable3: %T\n", variable3)
	fmt.Printf("Type of variable4: %T\n", variable4)
	fmt.Printf("Type of variable5: %T\n", variable5)
}
```