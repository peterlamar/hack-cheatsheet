/*
https://www.math.unl.edu/~tlai3/M119-Section16.pdf

For deposit = 100, rate = 20, and threshold = 170, the output should be
depositProfit(deposit, rate, threshold) = 3.

Each year the amount of money in your account increases by 20%. So throughout the years, your balance would be:

year 0: 100;
year 1: 120;
year 2: 144;
year 3: 172.8

R = Threshold
D = Deposit
r = Rate
t = time

D(1+r)^t = R
(1+r)^t = R/D
t*ln(1+r)=ln(R/C)
t = ln(R/C)/ln(1+r)
*/
function depositProfit($deposit, $rate, $threshold) {
    return ceil(log($threshold / $deposit)/log(1 + $rate/100.0));
}
