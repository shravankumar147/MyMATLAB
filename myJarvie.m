intro = 'Hello, This is Jarvie';
greet = 'How can I help you!';
greet2 = 'as always, at your service';
thank = 'Have a Good Day, bye Bye!';
opt = 'Choose one of my servicesbelow:';
 
ha = actxserver('SAPI.SpVoice');
invoke(ha,'speak',intro);
invoke(ha,'speak',greet);
invoke(ha,'speak',opt);

disp('1.Record my Voice for 5 seconds.');
disp('2.Open Google Web Page.');
disp('3.Read the Text.');

n = input('Enter a number: ');

switch n
    case 1
       
       disp('******************************************************')
       disp('Choose options:')
       disp('1. set recoring time')
       disp('2. save data ')
       disp('3. plot data')
       r = input('Enter a number: ');
       switch r
            case 1
                t = input('set your recording time:');
        % Record your voice for 5 seconds.
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
        
        % Play back the recording.
        play(recObj);
            case 2
        % Store data in double-precision array.
        myRecording = getaudiodata(recObj);
            case 3
        % Plot the waveform.
        plot(myRecording);
            otherwise
                disp('goodday!')
        end

    case 2
        web('www.google.com','-browser')
        
        invoke(ha,'speak',greet2);
    case 3
        textIn=input('type your text here I will read it for you:','s');
        ha = actxserver('SAPI.SpVoice');
        invoke(ha,'speak',textIn);
    otherwise 
        invoke(ha,'speak',thank);
end