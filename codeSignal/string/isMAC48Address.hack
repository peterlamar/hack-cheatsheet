/*
For inputString = "00-1B-63-84-45-E6", the output should be
isMAC48Address(inputString) = true;
For inputString = "Z1-1B-63-84-45-E6", the output should be
isMAC48Address(inputString) = false;
*/
function isMAC48Address($inputString) {
    $tokens = explode( "-", $inputString);
    
    if (count($tokens) != 6)
        return false;
    
    foreach($tokens as $k => $v){
        if (strlen($v) != 2)
            return false;
            
        if (!ctype_xdigit($v[0]))
            return false;
            
        if (!ctype_xdigit($v[1]))
            return false;
    }
    return true;
}
