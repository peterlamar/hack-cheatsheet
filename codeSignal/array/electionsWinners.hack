/*
For votes = [2, 3, 5, 2] and k = 3, the output should be
electionsWinners(votes, k) = 2.
*/
function electionsWinners($votes, $k) {
    $max = max($votes);
    
    if ($k == 0){
        $cnt = count(array_keys($votes, $max));
        if ($cnt<=1){
            return $cnt;
        }
    }
    
    $count = count(array_filter($votes, function($v) use ($max, $k)
    {
        return $v + $k > $max;
    }));
    
    return $count;
}
