//target value from challenge
target:245701;
//list of all possible scores with a single dart
scores:asc distinct 25,50,(1+til 20),(2*1+til 20),(3*1+til 20);
//list of all possible throws taken to get index score 
up_to_sixty:?[(1+til 60) in scores;1;2];
//function to calculate the total number of throws to acheive input score and every score til input up to sixty
g:{[x]sum x#up_to_sixty};
//function to calculate scores beyond 60
f:{[x]a:floor(x%60);b:x-60*a;a+g[b]+sum(a#77+60*/:til a)};

f target