/*
Input: s = "a-bC-dEf-ghIj"
Output: "j-Ih-gfE-dCba"
*/
class Solution {

    /**
     * @param String $s
     * @return String
     */
    function reverseOnlyLetters($s) {
        $l = 0;
        $r = strlen($s);
        while ($l < $r){
            if (!ctype_alpha($s[$l])){
              $l++;  
            } else if (!ctype_alpha($s[$r])){
              $r--;                
            } else {
                [$s[$l], $s[$r]] = [$s[$r], $s[$l]];
                 $l++;
                 $r--;
            }
        }
        return $s;
    }
}