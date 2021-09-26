# hack-cheatsheet

1. [Preprocessor](#preprocessor)
1. [Literals](#literals)
1. [Constants](#constants)
1. [Declarations](#declarations)
1. [Statements](#statements)
1. [Attributes](#attributes)
1. [Expressions](#expressions)
1. [Functions](#functions)
1. [Namespaces](#namespaces)
1. [Math](#math)
1. [Floating point math](#floating-point-math)
1. [String](#string)
1. [Array](#array)
1. [Vec](#vec)
1. [Dict](#dict)
1. [Keyset](#keyset)
1. [Vector](#vector)
1. [Map](#map)
1. [Set](#Set)
1. [Pair](#pair)
1. [References](#references)

## Preprocessor

```php
// A single line comment.
# Also a single line comment.
/* A multi line comment.
 */

/**
 * A doc comment starts with two asterisks.
 *
 * It summarises the purpose of a definition, such as a
 * function, class or method.
 */
require_once(__DIR__.'/../vendor/autoload.hack'); // Loads autoloader
```

## Attributes

Attributes attach metadata to [Hack](https://docs.hhvm.com/hack/attributes/introduction) definitions

```php
<<__EntryPoint>> // Begins a Hack program
```

## Literals

```php
255, 0377, 0xff             // Integers (decimal, octal, hex)
123.0, 1.23e2               // float (real) numbers
'\n', '\\', '\'', '\"'      // Newline, backslash, single quote, double quote
"Hello"                     // string containing 5 characters
" -123"                     // numeric string
'2e+5'                      // numeric string
true, false                 // bool constants 1 and 0
  $var = 42;                // Heredoc literal
  $s = <<<ID            
Wow, look at this text!
We can even have a semicolon here! ; or '' or ""!
Variable substitution: $var
ID;                         // Trailing ID must have no spaces
  echo ">$s<\n";
$s = <<<'ID'                // Nowdoc literal, no variable substitution
Wow, look at this text!
We can even have a semicolon here! ; or '' or ""!
Variable substitution: $var // will print '$var'
ID;
echo ">$s<\n";
$x = 123;
echo ">\$x.$x"."<\n";       // >$x.123< \$x escapes var
null                        // null literal, used to initialize
type IdSet = shape('id' => ?string, 'url' => ?string, 'count' => int);

function get_IdSet(): IdSet {
  return shape('id' => null, 'url' => null, 'count' => 0);
}
```
## Constants

```php
PHP_INT_MAX        // 2147483647 in 32 bit, 9223372036854775807 in 64
PHP_INT_MIN        //-2147483648) in 32 bit,-9223372036854775807 in 64
PHP_EOL            // Line break
```

## Declarations

```php
const int MAX_VALUE = 100;           // MAX_VALUE is an integer constant
private int $value = 0;              // $value is an integer value
$val = true;                         // true or false, may also use int (1 or 0)
$count = 10;                         // declare int
$colors1 = vec["green", "yellow"];   // create a vec of two elements
$colors1[] = "blue";                 // add element 2 with value "blue"
$colors2 = dict[];                   // create an empty dict
$colors2[4] = "black";               // create element 4 with value "black"
$colors3 = array();                  // create empty array
$colors3 = ["red", "white", "blue"]; // create array<string> with 3 elements
$colors3[] = "green";                // insert a new element 3
```
## Statements

```php
if ($x) a;                   // If $x is true (not 0), evaluate a
else if ($y) b;              // If not $x and y (optional, may be repeated)
elseif ($z) c;               // If not $x and y (optional, may be repeated)
else c;                      // If not $x and not y (optional)

while ($x) a;                // Repeat 0 or more times while $x is true

$colors = vec["red", "white", "blue"];
for ($i=0; $i<count($colors)>; $i++) $colors[i]; // Iterate over collection of three strings
foreach ($colors as $color) {} // Iterate over collection of three strings
foreach ($colors as $key => $color) {} // Iterate with key and value
foreach ($colors as $key => $_) {} // red, white and blue are ignored

foreach($vec_of_tuples as list($here, $there)) // 
foreach($vec_of_tuples as $key => list($here, $there))

do a; while ($x);            // Equivalent to: a; while($x) a;

switch ($x) {                // $x must be int
    case X1: a;              // If $x == X1 (must be a const), jump here
    case X2: b;              // Else if $x == X2, jump here
    default: c;              // Else jump here (optional)
}

break;                       // Jump out of while, do, or for loop, or switch
continue;                    // Jump to bottom of while, do, or for loop
return x4;                   // Return $x from function to caller

                             // Using state enforces object disposal
using ($f1 = new TextFile("file1.txt", "rw")) {
//  echo "\$f1 is >" . $f1 . "<\n";  // usage not permitted
    echo "\$f1 is >" . $f1->__toString() . "<\n";} 

{ using $f4 = TextFile::open_TextFile("file4.txt", "rw");
  using $f5 = new TextFile("file5.txt", "rw");
  // ... work with both files
} // __dispose is called here for both $f4 and $f5

throw new someException();   // Generate exception of given type
try {}                       // Try possible exception generations
catch () {}                  // Define a handler for type of exception
finally {}                   // Occurs whether or not exception occured in try block

namespace UseNS {
  const int CON = 100;}      // Use statement permits names from
use const UseNS\CON;         // one namespace to another
echo "CON = ".\UseNS\CON."\n"; // access const CON by fully qualified 
echo "CON = ".CON."\n";        // access by abbreviated name
```
## Functions


## Expressions

String Operators
Concatenation operator '.'
Concatenation assignment operator '.=' 

```php
$a = "Hello ";
$b = $a . "World!";        // now $b contains "Hello World!"

$a = "Hello ";
$a .= "World!";            // now $a contains "Hello World!"
$a = '12345';

// This works:
echo "qwe{$a}rty";         // qwe12345rty, using braces
echo "qwe" . $a . "rty";   // qwe12345rty, concatenation used

// Does not work:
echo 'qwe{$a}rty';         // qwe{$a}rty, single quotes are not parsed
echo "qwe$arty";           // qwe, because $a became $arty, which is undefined

class Point {
  private float $x;
  private float $y;

  public function __toString(): string {
    return '('.$this->x.','.$this->y.')';
  }
}

echo $p1                  // Implicit call to __toString()
exit ("Closing down\n");  // Writes optional string, then 
exit (1);                 // register_shutdown_function in order of registration
```

## Namespaces

```php
namespace NS1
{
...                         // __NAMESPACE__ is "NS1"
}
namespace N {
    function f(): void {
    echo "In ".__FUNCTION__."\n";
  }
}  
\N\f();                     // Use function f in namespace N
use namespace N\f;          // Make f visible
```
## Math

```php
$q = intdiv($n1, $n2);      // Integer quotient of n1/n2
```

## Floating point math 

```php
sin(x); cos(x); tan(x);     // Trig functions, x (double) is in radians
asin(x); acos(x); atan(x);  // Inverses
atan2(y, x);                // atan(y/x)
sinh(x); cosh(x); tanh(x);  // Hyperbolic sin, cos, tan functions
exp(x); log(x); log10(x);   // e to the x, log base e, log base 10
pow(x, y); sqrt(x);         // x to the y, square root
ceil(x); floor(x);          // Round up or down (as a double)
fabs(x); fmod(x, y);        // Absolute value, x mod y
```

## String

```php
$chars = str_split($inputString);
foreach($chars as $c){}      // Iterate through char in string
is_numeric($c);              // number or a numeric string
count_chars($s, 1);          // count occurences and return 0-4 different results 0-array char=>freq, 1-array char > 0 freq, 2-array char=0 freq, 3-string with all unique, 4-string with all not used chars
foreach (count_chars($data, 1) as $i => $val) {
   echo "There were $val instance(s) of \"" , chr($i) , "\" in the string.\n";
}
implode('',$arr);            // Join array elements with a string
explode('@',$address)        // split string into by char
$newstr = strrev($str)       // return reversed string
$beg = substr($str, 2)       // return cdef from abcdef
$beg = substr($str, 2, 1)    // return c from abcd
```

## Array

Regular [PHP Array](https://www.php.net/manual/en/language.types.array.php) (ordered map), listed here for completeness. Use Hack primities
for new code going forward. 

```php
$a = array[];	                  // Initialize empty	
$a = array[1, 2, 3];            // Literal
$a = array("foo" => "bar");     // Literal
$a = array(1 => "a",            // Literal, multiple types
    "1"  => "b");
var_dump($a);                   // Outputs values
arr = array(5 => 1, 12 => 2);
$arr[] = 56;                    // This is the same as $arr[13] = 56;
$arr["x"] = 42;                 // This adds a new element to
                                // the array with key "x"
unset($arr[5]);                 // This removes the element from the array
unset($arr);                    // This deletes the whole array
$array = array_values($array);  // Re-index values to new array
$sum = array_sum($array);       // Sum the array
$slice = array_slice($a, 2);    // Return selected parts of the array
foreach (range(0, 3, 1) as $n){ // Create Array w range of elements
    echo $n; }                  // array(0, 1, 2, 3)
$ed = end($arr)                 // last element in array
$st = $arr[0]                   // first element in array
```

Multi Dimensional Arrays
```php
<?php
$array = array(
    "foo" => "bar",
    42    => 24,
    "multi" => array(
         "dimensional" => array(
             "array" => "foo"
         )
    )
);

var_dump($array["foo"]);
var_dump($array[42]);
var_dump($array["multi"]["dimensional"]["array"]);
?>
```

## Vec

There are many helpful functions in the C, Vec, Keyset and Dict namespaces.

```php
$v = vec[];	                // Initialize empty	
$v = vec[1, 2, 3];          // Literal
$v = vec($container);	      // From Another Container
$v = Vec\keys($container);  // Keys from Container	
$v[] = 4;	                  // Add Elements
$v = Vec\concat($t1, $t2)	  // Bulk Add Elements	
Vec\drop($v,$n),            // Remove Elements is unsupported
Vec\take($v,$n);            
$first=C\pop_front(inout $x), 
$last=C\pop_back(inout $x)
C\contains_key($v, 1)       // Key Existence
C\contains($v, 3)           // Value Existence
$v1 === $v2                 // Equality (Order-Dependent)
C\count($v)                 // Count Elements (i.e., length, size of array)
vec<Tv>                     // Type Signature	
$v is vec<_>	              // Type Refinement	
Vec\from_async($v)          // Awaitable Consolidation
```

## Dict

```php
$d = dict[];	               // Initialize empty	
$d = dict['foo' => 1];       // Literal
$d = dict($keyed_container); // From Another Container
$d['baz'] = 2;	             // Add Elements
$d = Dict\merge($kt1, $kt2)	 // Bulk Add Elements	
unset($d['baz']);	           // Remove Elements	
C\contains_key($d, 'foo')    // Key Existence
C\contains($d, 2)            // Value Existence
$d1 === $d2                  // Equality (Order-Dependent)
Dict\equal($d1, $d2)         // Equality (Order-Independent)
C\count($d)                  // Count Elements (i.e., length, size of array)
dict<Tk, Tv>                 // Type Signature	
$d is dict<_, _>	           // Type Refinement	
Dict\from_async($d)          // Awaitable Consolidation
```

## Keyset

```php
$k = keyset[];	             // Initialize empty	
$k = keyset['foo', 'bar'];   // Literal
$k = keyset($container);     // From Another Container
$k = Keyset\keys($container);// Keys from Container
$k[] = 'baz';	               // Add Elements
$k = Keyset\union($t1, $t2)  // Bulk Add Elements	
unset($k['baz']);	           // Remove Elements	
C\contains_key($k, 'foo')    // Key Existence
C\contains_key($k, 'foo')    // Value Existence
$k1 === $k2                  // Equality (Order-Dependent)
Keyset\equal($k1, $k2)       // Equality (Order-Independent)
C\count($k)                  // Count Elements (i.e., length, size of array)
keyset<Tk>                   // Type Signature	
$k is keyset<_>  	           // Type Refinement	
Keyset\from_async($x)        // Awaitable Consolidation
```

## Vector

```php
Vector::fromKeysOf($d)      // convert php dict keys to vector
new Vector($d)              // convert php dict to vector
new Vector($v)              // convert vec to vector
new Vector($k)              // convert keyset to vector
```

## Map

```php
new Map($d)                 // convert php dict to map
new Map($v)                 // convert vec to map
new Map($k)                 // convert keyset to map
```

## Set

```php
Set::fromKeysOf($d)         // convert php dict keys to set
new Set($d)                 // convert php dict values to set
new Set($v)                 // convert vec to set
new Set($k)                 // convert keyset to set
```

## Pair

## References

[HHVM](https://github.com/facebook/hhvm) - Hack Lang virtual machine