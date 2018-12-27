function [key,pbox,sbox] = Genrate(  )
%GENRATE Summary of this function goes here
%   Detailed explanation goes here
n = 2^32;
fout = fopen('key.txt','r');
ke = fread(fout,[1 16]);
key  = char(ke);
fclose(fout);
%ke = uint8(key);
for i = 1:16
    ke(1,i) = hex2dec(key(1,i));
end
for i = 1:16
    binke(i,:) = dec2bin(ke(1,i),4);
end
j = 1;
for i = 1:8
    bink(j,:) = horzcat(binke(i,:),binke(2*i,:));
    i = i+2;
    j= j+1;
end
fin = fopen('Hexpi.txt','r');
a = fread(fin,[1 8]);
a1  = char(a);
for i = 1:8
    a(1,i) = hex2dec(a1(1,i));
end
for i = 1:8
    bina1(i,:) = dec2bin(a(1,i),4);
end
j = 1;
for i = 1:4
    bina(j,:) = horzcat(bina1(i,:),bina1(2*i,:));
    i = i+2;
    j= j+1;
end

a = bin2dec(bina);
a = a';
%a = a';
%c = hex2dec(a);
pbox = a;
for i = 1:17
    i1 = 1;
    while( i1 <= 8)
        ch = fread(fin,1);
        if(ch == char(10)| ch==char(13))
            %ch = fread(fin,1);
            %if (ch == char(13))
                %fprintf('deepak');
            %end
        else
            a(1,i1) = ch;
            i1 =i1 +1;
        end
    end
    for i2 = 1:8
      a(1,i2) = hex2dec(a(1,i2));
    end
    for i2 = 1:8
        bina1(i2,:) = dec2bin(a(1,i2),4);
    end
    j = 1;
    for i = 1:4
        bina(j,:) = horzcat(bina1(i,:),bina1(2*i,:));
    i = i+2;
    j= j+1;
    end

    a = bin2dec(bina);
    a = a';
    % display(a);
   % c = hex2dec(char(a));
    pbox = vertcat(pbox,a);
end 

for j =1 : 4
    for k = 1:256
        i1 =1;
        while( i1 <= 8)
            ch = fread(fin,1);
            if(ch == char(10)|ch==char(13))
            %ch = fread(fin,1);
            %if (ch == char(13))
                %fprintf('deepak');
            %end
            else
                a(1,i1) = ch;
                i1 =i1 +1;
            end
        end
        for i2 = 1:8
             a(1,i2) = hex2dec(a(1,i2));
        end
        for i2 = 1:8
             bina1(i2,:) = dec2bin(a(1,i2),4);
        end
        j1 = 1;
        for i = 1:4
            bina(j1,:) = horzcat(bina1(i,:),bina1(2*i,:));
            i = i+2;
            j1= j1+1;
        end
        a = bin2dec(bina);
        a = a';
        
        %display(a);
        %c = hex2dec(a);
        sbox(k,:,j) = a;
    end
end

it = 0;
kee = bin2dec(bink);
kee = kee';
for i = 1:18
    for j = 1:4
       it = mod(it,8) ;
       it = it+1;
       %ke(1,it)
        pbox(i,j) = bitxor(pbox(i,j),kee(1,it));
    end
end

c = zeros(1,8);
%fout = fopen('zero.txt','w');
%fwrite(fout,c);
%fclose(fout);
%fout = fopen('zero.txt','r');
%fe = fread(fout,16);
%fclose(fout);
%fe = fe';

x = Blowfish(c,pbox,sbox);
count = 1;
while(count<=18)
    pbox(count,:) = x(1:4);
    pbox(count+1,:) = x(5:8);
    count = count+2;
    %x = dec2hex(x);
    x = Blowfish(x,pbox,sbox);
end
%x = dec2hex(x);
for i =1 : 4 
    count = 1;
    while(count<=256)
        x = Blowfish(x,pbox,sbox);
        sbox(count,:,i) = x(1:4);
        sbox(count+1,:,i) = x(5:8);
        count = count+2;
        %x = dec2hex(x);
    end
end
fclose(fin);        
end
