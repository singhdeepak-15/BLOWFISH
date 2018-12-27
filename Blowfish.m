function [ X ] = Blowfish(plte, pbox, sbox )
%BLOWFISH Summary of this function goes here
%   Detailed explanation goes here
xl = plte(1:4);
%xl = int8(xl);
%XL = hex2dec(xl);
xr = plte(5:8);
%xr = int8(xr);
%XR = hex2dec(xr);
for i =1 : 16
    for j =1:4
        xl(1,j) = bitxor(xl(1,j),pbox(i,j));
    end
    F = Ffunction(xl,sbox);
    for j = 1:4
        xr(1,j) = bitxor(xr(1,j),F(1,j));
    end
    temp = xl;
    xl = xr;
    xr = temp;
end
temp = xl;
xl = xr;
xr = temp;
p1 = pbox(17,:);
%p1 = bin2dec(p1);
p2 = pbox(18,:);
%p2 = bin2dec(p2);
for i = 1 : 4
    xr(1,i) = bitxor(xr(1,i),p1(1,i));
    xl(1,i) = bitxor(xl(1,i),p2(1,i));
end
X = horzcat(xl,xr);
end
