/*
For n = 10 and firstNumber = 2, the output should be
circleOfNumbers(n, firstNumber) = 7.
*/
function circleOfNumbers($n, $firstNumber) {
    return ($firstNumber+$n/2)%$n;
}