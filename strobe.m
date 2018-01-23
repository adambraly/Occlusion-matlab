%11/20/15 Adam Braly
function strobe(addr,opn,cls,len)
address=hex2dec(addr);
open = 0;
close = 3;
for i=1:len
    outp(address, open);
    pause(opn);
    outp(address, close);
    pause(cls);
end
%end with goggles closed
outp(address, close);
end