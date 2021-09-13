#!/usr/bin/env hhvm
namespace Hack\UserDocumentation\Fundamentals\ProgramStructure\Examples\HelloWorld;

<<__EntryPoint>>
function main(): void {
  print("Hello, World!\n");
  $var = 42;
  $s = <<<   ID
Wow, look at this text!
We can even have a semicolon here! ; or '' or ""!
Variable substitution: $var
ID;
  echo ">$s<\n";
}