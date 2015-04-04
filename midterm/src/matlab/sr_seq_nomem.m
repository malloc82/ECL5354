function sr_seq_nomem(filename, alpha, T, count)
    output_dir = '../../resources/no_memory';
    foldername = sprintf('%s/alpha=%.2f', output_dir, alpha);
    mkdir(foldername);
    im = imread(filename);
    for i=1:count
        [B O] = sr(im, alpha, T);
        imwrite(B, sprintf('%s/image_%04d.png', foldername, i), 'PNG');
    end
    fprintf('OK\n');
end

