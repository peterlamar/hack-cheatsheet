/*
For s = "cabca", the output should be
differentSymbolsNaive(s) = 3.
There are 3 different characters a, b and c.
*/
function differentSymbolsNaive($s) {
    return count(count_chars($s, 1));
}
