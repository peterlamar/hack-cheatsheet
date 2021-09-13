# hack-cheatsheet

1. [Preprocessor](#preprocessor)
1. [Literals](#literals)
1. [Declarations](#declarations)
1. [Attributes](#attributes)
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
  $s = <<<   ID            
Wow, look at this text!
We can even have a semicolon here! ; or '' or ""!
Variable substitution: $var
ID;                         // Trailing ID must have no spaces
  echo ">$s<\n";
```

## Declarations

```php
const int MAX_VALUE = 100;   // MAX_VALUE is an integer constant
private int $value = 0;      // $value is an integer value
$val = true;                 // true or false, may also use int (1 or 0)
```

## References

[HHVM](https://github.com/facebook/hhvm) - Hack Lang virtual machine