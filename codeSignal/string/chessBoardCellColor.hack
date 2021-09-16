/*
For cell1 = "A1" and cell2 = "C3", the output should be
chessBoardCellColor(cell1, cell2) = true.
*/
function chessBoardCellColor($c1, $c2) {
    return (ord($c1[0])+ord($c1[1]))%2 == (ord($c2[0])+ord($c2[1]))%2;
}
