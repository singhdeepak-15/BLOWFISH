n = 2^32;
key = rand(1,1);
key = key * n;
key = mod(key,n);
key = uint32(key);
key = dec2hex(key,8);
fout = fopen('key.txt','w');
fwrite(fout,key);
fclose(fout);