function [rate] = BER(array, array_transmit)

array_length = length(array_transmit);

count = 1;

error = 0;
while (count<length(array))
    
    error = sum(xor(array(count:(count+array_length-1)),array_transmit))+error;
    
    count = count+array_length;
    
end

rate = error/length(array);

end