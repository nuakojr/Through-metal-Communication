
data=real(-putty055(200:100200));
data(isnan(data)) = 0;
[demod_array]=demod1(data, 500, 10000,[1,1,1,1]);
BER(demod_array,[0,1,0,1,1,0,1,0,1,1,0,0,1,1,0,0])