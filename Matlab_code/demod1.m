function [demod_array]=demod1(data, fsymbol, fsample,preamble)


% mean average
% calculate the mean of half symbol samples
M = movmean(data,fsample/fsymbol*20)*0.8333;

data = real(data-M);
data = data.*(-1);

data(data>0)=1;
data(data<0)=0;

preamble_seq = [];

for i = 1:1:length(preamble)
    if preamble(i) == 1
        preamble_seq = [preamble_seq,ones(1,fsample/2/fsymbol),ones(1,fsample/2/fsymbol)];
    else
        preamble_seq = [preamble_seq,zeros(1,fsample/2/fsymbol),zeros(1,fsample/2/fsymbol)];
    end
end
signal = [ones(1,fsample/2/fsymbol),zeros(1,fsample/2/fsymbol)];

count = 1;
count_sam = 1;
new_data = data';
darray=[];
loc_indx = 1;
segment = fsample/fsymbol*24+3;
while (loc_indx<ceil(0.9*length(new_data)))
    i = loc_indx;
    [istart,istop,dist]=findsignal(new_data(i:i+segment),preamble_seq);
    
    istop = istop+i+1;
    
    loc_indx = istop+fsample/fsymbol*16+3;
    
    if loc_indx <= count_sam * 2500
        if dist <= 15
            payload = new_data((istop+1):(istop+fsample/fsymbol*16));
            interval = ceil(fsample/fsymbol/2/2);
            payload_downsampled = payload(interval:2*interval:length(payload));
            
            [payload_demod] = packet_demod (payload,signal,0.1,fsample/fsymbol,16);
            darray(count:count+15)=payload_demod;
            count = count+16;
        end
    else if fsymbol>500
            loc_indx = count_sam*2500+1;
        end
        count_sam = count_sam +1;
    end
    
    %start = start_detect(new_data,sequence);
end
demod_array=darray;
end