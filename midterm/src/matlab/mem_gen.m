mem = (0:0.1:0.9);
for i=1:length(mem)
    sr_seq_mem('lena.png', 0.3, 0.5, 1024, mem(i));
end
for i=1:length(mem)
    sr_seq_mem('lena.png', 0.5, 0.5, 1024, mem(i));
end
for i=1:length(mem)
    sr_seq_mem('lena.png', 0.7, 0.5, 1024, mem(i));
end
