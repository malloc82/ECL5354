function sr_seq_mem(filename, alpha, T, count, memory)
    output_dir = '../../resources/memory';
    foldername = sprintf('%s/alpha=%.3f,memory=%.2f', output_dir, alpha, memory);
    mkdir(foldername);
    im = imread(filename);
    I = im;
    for i=1:count
        [B O] = sr((1 - memory)*double(im) + memory*double(I), alpha, T);
        imwrite(B, sprintf('%s/image_%04d.png', foldername, i), 'PNG');
        I = O;
    end
    fprintf('OK\n');
end

