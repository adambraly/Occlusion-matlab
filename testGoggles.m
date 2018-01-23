%%11/20/15 Adam Braly
%Make a new variable named address for LPT1
address=hex2dec('378');
%Make a new variable byte: 1 = right open, left closed
byte=1;
%Send the data using outp to address 378 and value 1
outp(address, byte);
pause(.5);
%2 = left open, right closed
byte=2;
outp(address, byte);
pause(.5);
% 3 = both closed
byte=3;
outp(address, byte);
pause(.5);
% 0 = fully open
byte=0;
outp(address, byte);
%pause for 1 second
pause(.5);
%3 = both closed
byte=3;
outp(address, byte);