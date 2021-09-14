/*
For name = "var_1__Int", the output should be
variableName(name) = true;
For name = "qq-q", the output should be
variableName(name) = false;
*/
function variableName(string $name) {
    return (bool)preg_match('/^[_a-z][a-z0-9_]*$/i', $name);
}