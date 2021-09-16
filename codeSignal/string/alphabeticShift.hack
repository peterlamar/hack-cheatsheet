/*
For inputString = "crazy", the output should be alphabeticShift(inputString) = "dsbaz".
*/
function alphabeticShift(string $inputString) {
    return strtr($inputString,'abcdefghijklmnopqrstuvwxyz','bcdefghijklmnopqrstuvwxyza');
}

function alphabeticShift(string $inputString) {
    $array = str_split($inputString);
    $shift = [];
    
    foreach($array as $c){
        $idx = (ord($c) - ord('a') +1)%26;
        $shift[] = chr(ord('a') + $idx);
    }
    return implode('',$shift);
}
