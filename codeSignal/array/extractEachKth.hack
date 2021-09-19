/*
For inputArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] and k = 3, the output should be
extractEachKth(inputArray, k) = [1, 2, 4, 5, 7, 8, 10].
*/
function extractEachKth($inputArray, $k) {
    foreach($inputArray as $key => $val){
        if (($key+1) % $k ==0){
            unset($inputArray[$key]);
        }
    }
    return array_values($inputArray);
}
