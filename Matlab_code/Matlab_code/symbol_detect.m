function [b] = symbol_detect(sample,score,signal)

[is, ie, dis] = findsignal(sample,signal);

if dis < score
    b = 1;
else 
    b = 0; 
end
end