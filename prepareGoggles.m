%%11/20/15 Adam Braly
function prepareGoggles()

%install and initialize the kernel-level I/O driver calling config_io.m
config_io

%check whether matlab sees the parallel port
%'parallel' will appear in the printed list if so
out = daqhwinfo;
out.InstalledAdaptors

%check whether inpout32 was successfully installed
global cogent;
if(cogent.io.status~=0)
    error('inp/outp isntallation failed');
else
    disp('inp/outp installation succeeded');
end
end