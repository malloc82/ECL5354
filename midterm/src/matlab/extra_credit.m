
origin = 'lena.png';
output_dir = '../../resources';

im_origin = imread(origin);
sum       = zeros(size(im_origin));

count = 1024;

alpha = 0.95;

foldername = sprintf('%s/alpha=%.3f', output_dir, alpha);
mkdir(foldername);

I = im_origin;
for i=1:count
    [B O] = sr(I, alpha, 0.5);
    imwrite(O, sprintf('%s/output_%04d.png', foldername, i), 'PNG');
    % sum = sum + double(B);
    I = O;
end


sum = sum / count;

imshow(uint8(sum));
