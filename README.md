# hack-cheatsheet

1. [Preprocessor](#preprocessor)
1. [Literals](#literals)
1. [Declarations](#declarations)
1. [Statements](#statements)
1. [Attributes](#attributes)
1. [Expressions](#expressions)
1. [Namespaces](#namespaces)
1. [Floating point math](#floating-point-math)
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

for ($x; y; z) a;            // Equivalent to: $x; while(y) {a; z;}

$colors = vec["red", "white", "blue"];
foreach ($colors as $color) {} // Iterate over collection of three strings

$colors = vec["red", "white", "blue"];
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


## References

[HHVM](https://github.com/facebook/hhvm) - Hack Lang virtual machine