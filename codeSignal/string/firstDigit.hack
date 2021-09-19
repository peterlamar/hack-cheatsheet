/*
For inputString = "var_1__Int", the output should be
firstDigit(inputString) = '1';
*/
function firstDigit($inputString) {
    $chars = str_split($inputString);

    foreach($chars as $c){
        if (is_numeric($c)){
            return $c;
        }
    }
    return 'not found';
}
