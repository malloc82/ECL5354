function [B O] = sr(I, alpha, T)
    noise = rand(size(I)).*255;
    O = uint8((1 - alpha)*noise + alpha*double(I));
    B = im2bw(O, T);
end

