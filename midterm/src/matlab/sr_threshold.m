function sr_threshold(filename, alpha, T, count)
    output_dir = '../../resources/threshold';
    foldername = sprintf('%s/alpha=%.3f', output_dir, alpha);
    mkdir(foldername);
    im = imread(filename);
    for i=1:count
        [B O] = sr(im, alpha, T);
        imwrite(B, sprintf('%s/output_%04d.png', foldername, i), 'PNG');
    end
    fprintf('OK\n');
end
