
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
Another way to display the value of a variable in Go is by using the `fmt.Sprint()` function, which `returns` the `string representation` of `one` or `more` values.

```
str := fmt.Sprint(x)
fmt.Println(str)
```

You can also use the `fmt.Sprintf()` function, which is `similar` to `fmt.Printf()`, but instead of printing the output to the console, `it returns the formatted string` as a result.

```
str := fmt.Sprintf("The value of x is: %d", x)
fmt.Println(str)
```

If you want `to print` the `value` of a `struct` type variable you can use the `fmt.Printf("%+v", varName)`, this will print the struct and the value of the `struct fields`.

You can also use the `json package` to marshal the struct value and print it as a json string.

```
package main
import (
    "encoding/json"
    "fmt"
)

type Person struct {
    Name string
    Age int
}

func main() {
    p := Person{Name: "John", Age: 25}
    b, _ := json.Marshal(p)
    fmt.Println(string(b))
}
```

In this example, the `json.Marshal() `function is used to `convert` the `struct variable` to a `json string`, and then the json `string is `printed` using the `fmt.Println()` function.


In this example, `p` is a variable of type Person, which is a `struct type` with two fields, Name and Age.

The `json.Marshal()` function is used to convert the `struct variable` p to a `json encoded byte slice` ([]byte). The function takes an `interface{} type` as `input` and `returns` the `json encoded byte slice` and an `error`. In this case, the underscore `_` is used to ignore the error, as we are assuming that the struct type is a valid json type.

The `string(b)` is used to `convert` the `json encoded byte slice` to a `string`, so that it can be printed to the console using the fmt.Println() function.

This will print the json representation of the struct variable p, which will look something like this:

```
{"Name":"John","Age":25}
```
Please keep in mind that this is just one way to display a struct variable in json format, you can use other json library like easyjson or jsoniter for more advanced features.

Another way to display the value of a variable in Go is by using the `log.Println()` function from the `log package`. This function is similar to fmt.Println() and it also prints the value of the variable to the console, but `it` also adds `timestamp` and `file` name information to the `output`, which can be useful for `debugging` and `logging`.

```
package main

import (
    "log"
)

func main() {
    x := 5
    log.Println(x)
}
```

You can also use the `log.Printf()` function to format the output of a variable.

```
log.Printf("The value of x is: %d\n", x)
```

You can also use the `log.Fatalln() `function, which is similar to log.Println() but it also `terminates` the program `after printing the message`.

```
log.Fatalln(x)
```
You can also use the `log.Panicln()` function, which is similar to log.Fatalln() but `it` also `triggers a panic` `after printing the message`.

```
log.Panicln(x)
```

Another way to display variables in Go is by using the `strconv` package. This package provides `functions for converting variables to strings`.

For example, to convert an `int` to a `string`, you can use the `strconv.Itoa()` function:

```
package main

import (
    "fmt"
    "strconv"
)

func main() {
    x := 5
    str := strconv.Itoa(x)
    fmt.Println(str)
}
```




If you want to `convert` a `float` to a `string` you can use the `strconv.FormatFloat()` function:

```
package main

import (
    "fmt"
    "strconv"
)

func main() {
    x := 3.14
    str := strconv.FormatFloat(x, 'f', -1, 64)
    fmt.Println(str)
}
```




You can also use the `strconv.FormatBool()` function to `convert` a `boolean` variable to a `string`:

```
package main

import (
    "fmt"
    "strconv"
)

func main() {
    x := true
    str := strconv.FormatBool(x)
    fmt.Println(str)
}
```


And you can use `strconv.FormatUint()` to `convert` a `uint` variable to a `string`.

```
package main

import (
    "fmt"
    "strconv"
)

func main() {
    x := uint(10)
    str := strconv.FormatUint(uint64(x), 10)
    fmt.Println(str)
}
```
Please keep in mind that these are just a few examples, the strconv package offers many other functions for converting` variables to strings,` like `FormatInt()` for converting int64 variables to strings, `ParseFloat()` for parsing string to float64, etc.


Another way to display a variable in Go is by using the `reflect` package. This package provides functions for `inspecting` the `values` and `types` of variables at `runtime`.

For example, to display the `value of a variable`, you can use the `reflect.ValueOf()` function to get the reflect.Value of the variable, and then the `.Interface() method` to get the underlying value:

```
package main

import (
    "fmt"
    "reflect"
)

func main() {
    x := 5
    v := reflect.ValueOf(x)
    fmt.Println(v.Interface())
}
```
To display the type of a variable, you can use the `reflect.TypeOf()` function to get the `reflect.Type` of the `variable`, and then the `.Name()` method to get the `name` of the `type`:

```
package main

import (
    "fmt"
    "reflect"
)

func main() {
    x := 5
    t := reflect.TypeOf(x)
    fmt.Println(t.Name())
}
```
You can also use the `reflect.Value.Kind()` method to get the `kind` of a `variable`, which is a constant representing the specific kind of type the variable is.

```
package main

import (
    "fmt"
    "reflect"
)

func main() {
    x := 5
    v := reflect.ValueOf(x)
    fmt.Println(v.Kind())
}
```

This method returns `one of` the `constants` from the reflect package like `reflect.Int`, `reflect.String`, `reflect.Struct`, etc, that specifies the specific kind of type the variable is.