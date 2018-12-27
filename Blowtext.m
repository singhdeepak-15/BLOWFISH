function [ X ] = Blowtext(plte, pbox, sbox )
%BLOWFISH Summary of this function goes here
%   Detailed explanation goes here
xl = plte(1:4)
%xl = dec2hex(xl);
%c = xl(1,:);
%for l = 2: 4
 %   c = horzcat(c,xl(l,:));
%end
    
%%xl = char(xl);
%XL = hex2dec(c);
xr = plte(5:8)
%xr = dec2hex(xr);
%c = xr(1,:);
%for l = 2: 4
 %   c = horzcat(c,xr(l,:));
%end
%xr = char(xr);
%XR = hex2dec(c);
for i = 1 : 16
    for j = 1:4
    xl(1,j) = bitxor(xl(1,j),pbox(i,j));
    end
    F = Ffunction(xl,sbox);
    for j =1:4
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
for j =1 : 4
    xr(1,j) = bitxor(xr(1,j),p1(1,j));
    xl(1,j) = bitxor(xl(1,j),p2(1,j));
end
X = horzcat(xl,xr);
end
