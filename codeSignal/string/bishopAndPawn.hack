/*
For bishop = "a1" and pawn = "c3", the output should be
bishopAndPawn(bishop, pawn) = true.
*/
function bishopAndPawn($bishop, $pawn) {    
    return abs(ord($bishop[0])-ord($pawn[0]))==abs(ord($bishop[1])-ord($pawn[1]));
}
