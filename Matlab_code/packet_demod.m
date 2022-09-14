function [array] = packet_demod (payload,signal,score,sample_symbol, symbol_number)
% sample_symbol: samples per symbol

for i = 1:1:symbol_number
   
    indx = (i-1)*sample_symbol+1;
    sample = payload(indx:(indx+sample_symbol-1));
    mean(sample);
    %array(i) = symbol_detect(sample,score,signal);
    if mean(sample)>score
        array(i)=1;
    else array(i)=0;
    end
    
end

end