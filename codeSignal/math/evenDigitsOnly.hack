/*
For n = 248622, the output should be
evenDigitsOnly(n) = true;
For n = 642386, the output should be
evenDigitsOnly(n) = false.
*/
function evenDigitsOnly(string $n) {
    foreach(str_split($n) as $d){
        if ($d %2) return false;
    }
    return true;
}
