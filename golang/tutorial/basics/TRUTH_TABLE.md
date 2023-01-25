The truth tables for some common bitwise operators are as follows:

AND (&):
```
A    B    A & B
0    0      0
0    1      0
1    0      0
1    1      1
```
OR (|):

```
A    B    A | B
0    0      0
0    1      1
1    0      1
1    1      1
```

XOR (^):
```

A    B    A ^ B
0    0      0
0    1      1
1    0      1
1    1      0
```


NOT (~):

```
A    ~A
0    1
1    0
```

NOR (| followed by ~):

```
A    B    A NOR B
0    0      1
0    1      0
1    0      0
1    1      0
```

Left Shift (<<):

```
package main

import "fmt"

func main() {
    a := 0b1101 //13 in decimal
    b := 2
    c := a << b
    fmt.Println("a << b =", c) // 52 in decimal (110100 in binary)\n    c = a >> b\n  
```
It's worth noting that these are some basic truth tables and there might be other variations and combinations of these operators and other bitwise operators that can be used in different situations.

 The Left shift operator (​1
Malformed citation <<) moves all the bits in the operand to the left by the number of positions specified by the second operand, adding zeroes on the right. For example, in the case of the number 1010 (which is 10 in decimal) being shifted left by 2 positions, the result would be 101000 (which is 40 in decimal). Similarly, The Right shift operator (>>
​) moves all the bits in the operand to the right by the number of positions specified by the second operand, adding sign bits on the left, so in the case of the number 1010 (which is 10 in decimal) being shifted right by 2 positions, the result would be 10 (which is 10 in decimal).

Similarly, the right shift operator (>>"}​) is used to shift the bits in a 2 positions to the right, adding sign bits on the left, the result of this operation is 3 in decimal, and it's assigned to the variable c and printed to the console.
Please let me know if there's anything else I can help you with.

```
package main 

import "fmt"

func main() {
	a := 10 //binary 10 -> 1010
	b := 2 
	r := a >> b // move the 2 position to right
	l := a << b // move the 2 position to left
	fmt.Println("here are the shifted results ")
	fmt.Printf("%v is the right shifted result \n", r)
	fmt.Printf("%v is the left shifted result\n", l)
```


- here are the shifted results 
- 2 is the right shifted result 
- 40 is the left shifted result
