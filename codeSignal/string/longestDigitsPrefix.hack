/*
For inputString = "123aa1", the output should be
longestDigitsPrefix(inputString) = "123".
*/
function longestDigitsPrefix($inputString) {
    $chars = str_split($inputString);
    $rtn = [];
    foreach($chars as $c){
        if (is_numeric($c)){
            $rtn[] = $c;
        } else{
            break;
        }
    } 
    return implode('',$rtn);
}
