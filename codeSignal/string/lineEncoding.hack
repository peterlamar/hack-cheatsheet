/*
First, the string is divided into the least possible number of disjoint substrings consisting of identical characters
for example, "aabbbc" is divided into ["aa", "bbb", "c"]
For s = "aabbbc", the output should be
lineEncoding(s) = "2a3bc".
*/
function lineEncoding($s) {
    $rtn = "";
    for ($i = 0; $i < strlen($s); $i++){
        $cnt = 1;
        while ($i<strlen($s) && $s[$i] == $s[$i+1]){
            $cnt += 1;
            $i += 1;
        }
        if ($cnt > 1){
            $rtn .= strval($cnt);
        }
        $rtn .= $s[$i];
    }
    return $rtn;
}
