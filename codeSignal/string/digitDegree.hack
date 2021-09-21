/*
Let's define digit degree of some positive integer as the number of times we need to replace this number with the sum of its digits until we get to a one digit number.

For n = 91, the output should be
digitDegree(n) = 2.
9 + 1 = 10 -> 1 + 0 = 1.
*/
function digitDegree($n) {
    $rtn = 0;
    while ($n > 9){
        $n = array_sum(str_split($n));
        $rtn += 1;
    }
    return $rtn;
}
