# Hello world example

[Docs](https://docs.hhvm.com/hack/getting-started/getting-started)

* This code belongs to the unique, but arbitrary, namespace called Hack\GettingStarted\MyFirstProgram.
* The <<__EntryPoint>> annotation marks this function as the point where execution starts - there is nothing special about the function name main.
* main is a function that has no parameters and, being void, returns no value. Furthermore, this function is where the program will begin execution; that is, because of the <<__EntryPoint>> annotation, main is the entry-point function.
* echo writes some text and a blank line to standard output.
* printf also writes to standard output, but it provides format control, in this case, to right-justify the integer columns.
* The for loop has variable $i go from -5 to +5, in steps of 1, and for each iteration, the value of $i and that value squared are written out together on a separate line.

To run:
```bash
hhvm first.hack
```

or

In visual studio, F5 while hello.hack is open and primary focus and 'HHVM: Run Script' is selected in debugger