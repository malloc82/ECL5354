a = [0, 0.25, 0.5, 1, 1.25, 1.5, 1.75];
for i=1:length(a)
    sr_seq_nomem('lena.png', a(i), 0.5, 1024);
end
