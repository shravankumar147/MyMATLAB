clear ;

a=arduino();

while 1 %for i = 1:10
    D = readDigitalPin(a,'D11');
    disp(D)
    pause(0.5)
    %% condtional statements on obstacle detection
    if D 
        sprintf('%d --- Obstacle Found',D)
    end
end