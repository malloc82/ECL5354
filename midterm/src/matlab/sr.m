function [B O] = sr(I, alpha, T)
    noise = (rand(size(I)) - 0.5)*255*(2*alpha);
    O = uint8(double(I) + noise);
    B = im2bw(O, T);
end

