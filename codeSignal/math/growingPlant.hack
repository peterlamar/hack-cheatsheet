/*
100 + 90*x = y
x = (y-100)/90

For upSpeed = 100, downSpeed = 10, and desiredHeight = 910, the output should be
growingPlant(upSpeed, downSpeed, desiredHeight) = 10.
*/
function growingPlant($upSpeed, $downSpeed, $desiredHeight) {
    if ($desiredHeight < $upSpeed)
        return 1;
    
    $q = intdiv($desiredHeight-$upSpeed,$upSpeed-$downSpeed)+1;
    $r = ($desiredHeight-$upSpeed)%($upSpeed-$downSpeed);
    
    if ($r > 0){
        $q += 1;
    }
    
    return  $q;
}
