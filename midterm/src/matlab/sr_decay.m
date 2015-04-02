function sr_decay(filename, alpha, count, T)
    if nargin == 3
        T = 0.5;
    end
    output_dir = '../../resources/decay';
    foldername = sprintf('%s/alpha=%.3f', output_dir, alpha);
    mkdir(foldername);
    im = imread(filename);
    I = im;
    for i=1:count
        [B O] = sr(I, alpha, T);
        imwrite(O, sprintf('%s/output_%04d.png', foldername, i), 'PNG');
        I = O;
    end
    fprintf('OK\n');
end

