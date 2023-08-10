%Contraharmonic_Filter
clc;
f = rgb2gray(imread('road.jpg'));
f = im2double(f);
f = imnoise(f, 'salt');
[M,N] = size(f);
t=5;
Q=-1.5;
fp = padarray(f, [t t]);
g = zeros([M N]);
for i = t+1: M+t
    for j = t+1: N+t
        s = sum(sum(fp(i-t:i+t, j-t:j+t)));
        g(i-t, j-t) = (s^(Q+1)) / (s^Q);
    end
end

subplot(1, 2, 1);
imshow(f, []);
subplot(1, 2, 2);
imshow(g, []);
