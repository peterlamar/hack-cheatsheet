/*
For st = "abcdc", the output should be
buildPalindrome(st) = "abcdcba"

BF
l point, add until palindrome and move right
*/
function buildPalindrome($st) {
    for ($x = 0; $x < strlen($st); $x++) {
        $str = substr($st, $x);
        if ($str == strrev($str)){
            $end = substr($st, 0, $x);
            return $end . $str . strrev($end);
        }
    }
}
