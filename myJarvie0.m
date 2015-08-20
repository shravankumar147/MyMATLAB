%% My Jarvie
%This will speaks to you and asks for different options to choose. 

%% Greeting Section
intro = 'Hello, This is Jarvie';
greet = 'How can I help you!';
greet2 = 'as always, at your service';
thank = 'Have a Good Day, bye Bye!';
opt = 'Choose one of my services:';

%% Initializing Speaker Service
Speaker = actxserver('SAPI.SpVoice');

%% Speaking Section
invoke(Speaker,'speak',intro);
invoke(Speaker,'speak',greet);
invoke(Speaker,'speak',opt);

%% Menu Section
choice = menu('Choose Your Choice', ...
                'Record my Voice for 5 seconds',...
                'Open a Web Service',...
                'Read the Text',...
                'NoThanX');
            

%% Switching Between Options on Your Choice
switch choice
%% Recording section    
    case 1
       i = menu('Choose Your Choice', ...
                'set recoring time');
       if (i==1)     
            t = input('set your recording time:');
           
        % Record your voice for 't' seconds.
        recObj = audiorecorder;
        disp('******************************************************')
        disp('***********Start speaking.****************')
        recordblocking(recObj, t);
        
        
        disp('              ####');
        disp('              ####'); 
        disp('              ####');
        disp('              ####');
        disp('              ####');
        disp('              ####');
        disp('              ####');
        disp('              ####');
        
        
        disp('***********End of Recording.**************');
        disp('******************************************************');
        
         r = menu('Choose Your Choice', ...
                'Play It',...
                'save data',...
                'plot data',...
                'NoThanX');
       disp('******************************************************')
       if(r==1)
        % Play back the recording.
        play(recObj);
       elseif(r==2)   
        % Store data in double-precision array.
        myRecording = getaudiodata(recObj);
       elseif(r==3)
        % Plot the waveform.
        plot(myRecording);
       else
        disp('goodday!')
       end
      end 
%% Browser Section
    case 2
                 b = menu('Choose Your Choice', ...
                'Google',...
                'Bing',...
                'YouTube',...
                'YouTube-MATLAB',...
                'LifeTimeLearner-MyChannel',...
                'NoThanX');
        
        switch b
            case 1
                web('www.google.com','-browser')
            case 2
                web('www.bing.com','-browser')
            case 3
                web('www.youtube.com','-browser')
            case 4 
                web('https://www.youtube.com/user/MATLAB','-browser')
            case 5
                web('https://www.youtube.com/channel/UCLnlLbp5RkIPWyCruhpW5UQ/videos','-browser')
            otherwise
                web('www.mathworks.com')
        end
        
        invoke(Speaker,'speak',greet2);
        
%% Text to Speech Section        
    case 3
        textIn=input('type your text here I will read it for you:','s');
        invoke(Speaker,'speak',textIn);
    otherwise 
        invoke(Speaker,'speak',thank);
end            