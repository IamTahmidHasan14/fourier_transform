%Midpoint_Filter
clc;
f = rgb2gray(imread('road.jpg'));
f = im2double(f);
f = imnoise(f, 'gaussian');
[M,N] = size(f);
t=5;
fp = padarray(f, [t t]);
g = zeros([M N]);
for i = t+1: M+t
    for j = t+1: N+t
        g(i-t, j-t) = 0.5 .* ((max(max(fp(i-t:i+t, j-t:j+t)))) + (min(min(fp(i-t:i+t, j-t:j+t)))));
    end
end

figure; imshow(f, []);
figure; imshow(g, []);
