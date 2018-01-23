%11/20/15 Adam Braly
%Example 100ms open, 25ms closed; 20 cycles
%Make a new variable named address for LPT1
address=hex2dec('378');
open = 0;
close = 3;
for i=1:20
    outp(address, open);
    pause(.1);
    outp(address, close);
    pause(.020);
end
%end with goggles closed
outp(address, close);