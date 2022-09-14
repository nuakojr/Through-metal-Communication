

data=putty255(200:100200);
data(isnan(data)) = 0;
[demod_array]=demod2(data, 2500, 50000,[1,1,1,1]);
BER(demod_array,[0,1,0,1,1,0,1,0,1,1,0,0,1,1,0,0])