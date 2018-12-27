function [ o ] = Ffunction( xleft,sbox )
%FFUNCTION Summary of this function goes here
%   Detailed explanation goes here
%   xl = dec2bin(xleft,8);
%xleft = dec2hex(xleft);
for i =1:4
    if(xleft(1,i)== 0)
        xleft(1,i) = 1;
    end
end
x1 = sbox((xleft(1,1)),:,1);
x2 = sbox((xleft(1,2)),:,2);
x3 = sbox((xleft(1,3)),:,3);
x4 = sbox((xleft(1,4)),:,4);

x1b = dec2bin(x1);
x2b = dec2bin(x2);
x3b = dec2bin(x3);
x4b = dec2bin(x4);
x11 = x1b(1,:);
x22= x2b(1,:);
x33 = x3b(1,:);
x44 = x4b(1,:);

for i = 2:4
    x11 = horzcat(x11,x1b(i,:));
    x22 = horzcat(x22,x2b(i,:));
    x33 = horzcat(x33,x3b(i,:));
    x44 = horzcat(x44,x4b(i,:));
end
x1d = bin2dec(x11);
x2d = bin2dec(x22);
x3d = bin2dec(x33);
x4d = bin2dec(x44);
%x1 = bin2dec(x1);
%x2 = bin2dec(x2);
%x3 = bin2dec(x3);
%x4 = bin2dec(x4);
n = 2^32;
r1 = x1d + x2d;
r1 = mod(r1,n);
r2 = bitxor(x3d,r1);
r3 = r2 + x4d;
r3 = mod(r3,n);
out = r3;
out = dec2bin(r3,32);
o(1,:) = out(1:8);
o(2,:)= out(9:16);
o(3,:) = out(17:24);
o(4,:) = out(25:32);
o = bin2dec(o);
o = o';
end
