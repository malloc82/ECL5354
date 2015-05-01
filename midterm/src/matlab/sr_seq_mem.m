function sr_seq_mem(filename, alpha, T, count, memory)
    output_dir = '../../resources/memory';
    foldername = sprintf('%s/alpha=%.3f,memory=%.2f', output_dir, alpha, memory);
    mkdir(foldername);
    im = imread(filename);
    for i=1:count
        [~, O] = sr(double(im), alpha);
        if (i == 1)
            I = O;
        end
        I = (1 - memory)*O + memory*I;
        B = im2bw(uint8(I), T);
        imwrite(B, sprintf('%s/image_%04d.png', foldername, i), 'PNG');
    end
    fprintf('OK\n');
end

