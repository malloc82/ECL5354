function [B O] = sr(I, alpha, T)
    noise = (rand(size(I)) - 0.5)*255*(2*alpha);
    O = double(I) + noise;
    if (nargin >= 3)
        B = im2bw(uint8(O), T);
    else
        B = [];
    end
end

