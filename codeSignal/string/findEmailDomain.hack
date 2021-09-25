/*
For address = "prettyandsimple@example.com", the output should be
findEmailDomain(address) = "example.com";
*/
function findEmailDomain($address) {
    return end(explode('@', $address));
}
