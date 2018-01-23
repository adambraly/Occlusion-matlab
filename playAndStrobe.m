%Testing movie and strobe playback
function playAndStrobe(moviename, windowrect)

address=hex2dec('378');
open = 0;
close = 3;
running = false;
%Check if openGL installed
AssertOpenGL;

if nargin < 1 || isempty(moviename)
    moviename = [PsychtoolboxRoot 'PsychDemos/MovieDemos/DualDiscs.mov' ];
end

if nargin < 2 || isempty(windowrect)
    windowrect = [];
end

%Wait until user releases a key on the keyboard
KbReleaseWait;
    
%Select the screen to render
screenid = max(Screen('Screens'));

try
    %Open 'windowrect' sized window on screen, with black [0] bg color:
    win = Screen('OpenWindow', screenid, 0, windowrect);
    
    %Open movie file
    movie = Screen('OpenMovie', win, moviename);
    
    %Start playback
    Screen('PlayMovie', movie, 1);
   
    
    
    %Playback loop: runs until end of movie or keypress:
    while ~KbCheck
        %strobe('378',.1,.9,1)
        outp(address, open);
        %wait for next movie frame, retrieve texture handle to it
        tex = Screen('GetMovieImage', win, movie);
      
        %valid texture returned? A negative value means end of movie
        %reached:
        if tex <= 0
            %we're done, break out of loop:
            break;
        end
        outp(address, close);
        %Draw the new texture immediately to screen
        Screen('DrawTexture', win, tex);
         
        %Update display
        Screen('Flip', win);
        
        %Release texture
        Screen('Close', tex);
    end
  
    %stop playback
    Screen('PlayMovie', movie, 0);
    
    %close movie
    Screen('CloseMovie', movie);
    outp(address, close);
    %close screen, we're done
    Screen('CloseAll');
    
catch %#ok<CTCH>
    sca;
    psychrethrow(psychlasterror);
end
    
return