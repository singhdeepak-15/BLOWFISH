%clear all;
function ctimg = img_encrypt(img)
[key,pbox,sbox] = Genrate();
%fin = fopen('input.txt','r');
%fout = fopen('output.txt','w');
rimg = reshape(img,1,[]);
ctimg = zeros(size(rimg));
count = 1;
while count <= length(rimg)
    pt  = rimg(count:count + 7);%fread(fin,[1 8]);
    [row col] = size(pt);
    if ( col < 8)
        for k = col+1:8
            pt(1,k) = 0;
        end
    end            
    ct = Blowtext(pt,pbox,sbox);
    %cl = ct(1:4);
    %cr = ct(5:8);
     %n =3;c =1;
     %ml = cl(1:2);
     %mr = cr(1:2);
     %while(n <= 4 )
      %   ml = vertcat(ml,cl(n:n+1));
       %  mr = vertcat(mr,cr(n:n+1));
        % n =n+2;
     %end
    %cpl = hex2dec(ml);
    %cpr = hex2dec(mr);
    %fwrite(fout,ct);
    %fwrite(fout,cpr);
    ctimg(count:count + 7) = ct;
    count = count + 8;
    
end
fprintf('Encrytion Completed');
%fclose(fin);
%fclose(fout);