clear ;
a = arduino();
s = servo(a,'D3');
while 1

   writePosition(s,1)
   pause(0.5)
   writePosition(s,0)
end