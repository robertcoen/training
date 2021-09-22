//load results
t:("SSJJ";enlist",") 0: `:tabletennis.csv;
//determine winner of each match
t[`win]:?[t[`sa]<t[`sb];t[`a];t[`h]];
//determine loser of each match
t[`lose]:?[t[`sa]>t[`sb];t[`a];t[`h]];
//get list of players
P:exec distinct h from t
//create dictionary to keep track of elo
P:P!((19#1200f))
//function to determine elo score from resutls of match
f:{[W;L]20*(1-1%(1 + 10 xexp ((L-W)%400)))};
//wrapper function to modify elo score after each game determined by index
h:{[x]{l:t[`lose][x];w:t[`win][x];n:first f[P[w];P[l]];P[w]:P[w]+n;P[l]:P[l]-n} x};
//modify each score based on sequence of matches
@'[h;til 35];
//determine the difference between max and min elo score
max P - min P
//manually rounded results