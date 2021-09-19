/*
For inputArray = ["aba", "bbb", "bab"], the output should be
stringsRearrangement(inputArray) = false.

There are 6 possible arrangements for these strings:

["aba", "bbb", "bab"]
["aba", "bab", "bbb"]
["bbb", "aba", "bab"]
["bbb", "bab", "aba"]
["bab", "bbb", "aba"]
["bab", "aba", "bbb"]
*/
function permutations(array $elements)
{
    if (count($elements) <= 1) {
        yield $elements;
    } else {
        foreach (permutations(array_slice($elements, 1)) as $permutation) {
            foreach (range(0, count($elements) - 1) as $i) {
                yield array_merge(
                    array_slice($permutation, 0, $i),
                    [$elements[0]],
                    array_slice($permutation, $i)
                );
            }
        }
    }
}

function isValid($perm){
    for ($i = 0; $i < count($perm)-1; $i++){
        if (levenshtein($perm[$i], $perm[$i+1]) != 1){
            return false;
        }
    }
    return true;
}

function stringsRearrangement($inputArray) {
    foreach (permutations($inputArray) as $perm){
        if (isValid($perm)){
            return true;
        }
    }
    return false;
}
