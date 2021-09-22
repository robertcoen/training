//read in origional numbers
a:"J"$read0`fraud.txt
//funtion to manipulate numbers
h:{[x]
    a:10 vs x;
    //if numbers are descending in order, they are already at their highest value
    if[(desc a)~a;:x];
    //the index of the number with decreasing value from the right needs to found
    b:deltas reverse a;
    c:(b < 0)?1b;
    //the number is cut into three parts
    d:(0;c;c+1) _ reverse a;
    //if the number can not be cut into three parts, it is cut into two
    if[not count d[0];d:1 _ d];
    //the value of middle number is stored
    b:first d[1];
    //the next largest number replaces the middle value
    d[1]:min ?[d[0]>first d[1];d[0];9];
    //the stored middle value replaces the next smallest number
    if[1<count d[0];d[0;d[0]?(min ?[d[0]>b;d[0];9])]:b];
    //if there is only one number, it is replaced
    if[1=count d[0];d[0]:b]
    //the right side of the number is then ordered to make the next largest number
    d[0]:desc d[0];
    :10 sv reverse raze d};

b:@'[h;a];
sum (b-a)