clc
clear all
img = imread('1.jpg');
gimg = rgb2gray(img);
%gimg(1,1:16)
gimg = gimg(:,1:end-1);
dim = size(gimg);
ct = img_encrypt(gimg);
cti = reshape(ct,dim);
figure,imshow(mat2gray(cti));
ot = img_decrypt(ct);
oti = reshape(ot,dim);
figure,imshow(mat2gray(oti));
%ct = img_encrypt(gimg(1,9:16))
%ot = img_decrypt(ct)