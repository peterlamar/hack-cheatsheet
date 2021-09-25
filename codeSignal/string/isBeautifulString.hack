/*
For inputString = "bbbaacdafe", the output should be isBeautifulString(inputString) = true.

This string contains 3 as, 3 bs, 1 c, 1 d, 1 e, and 1 f 
(and 0 of every other letter), so since there aren't any 
letters that appear more frequently than the previous 
letter, this string qualifies as beautiful.
*/
function isBeautifulString($inputString) {
    $chars = count_chars($inputString, 1);
    $last = max(array_keys($chars));
    
   for($i=ord('a');$i<$last ;$i++){
      if($chars[$i+1]>$chars[$i]){
        return false;         
      }        
   }
    
    return true;
}
