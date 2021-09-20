/*
Given array of integers, find the maximal possible sum of some of its k consecutive elements.
For inputArray = [2, 3, 5, 1, 6] and k = 2, the output should be
arrayMaxConsecutiveSum(inputArray, k) = 8.
*/
function arrayMaxConsecutiveSum($inputArray, $k) {
    $tmpSum = $rtn = array_sum(array_slice($inputArray,0,$k));
    foreach(range($k, count($inputArray)-1) as $i){
        $tmpSum += $inputArray[$i] - $inputArray[$i-$k];
        $rtn = max($tmpSum, $rtn);
    }
    return $rtn;
}
