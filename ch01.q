A:"do you think that maybe like, 1 in 10 people could be actually robots?";
HEX:"0123456789abcdef";
A:?[A in HEX;A;"0"];
A:((ceiling (count A)%3)*3)$A;
A:(floor ((count A)%3)) cut A;
raze 2#'A