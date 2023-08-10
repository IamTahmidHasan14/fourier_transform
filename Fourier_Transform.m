%Fourier_Transform
clc;
f = rgb2gray(imread('road.jpg'));
f = im2double(f);
F = fftshift(fft2(f));
subplot(1, 5, 1);
imshow(f, []);
title('Original Gray Image');
subplot(1, 5, 2);
imshow(log(abs(F)+1), []);
title('After fftshift');
[M,N] = size(f);
D = @(u,v) sqrt((u-M/2)^2+(v-N/2)^2);
H = zeros([M, N]);
D0 = 200;
for u = 1:M
    for v = 1:N
        if D(u,v) <= D0;
            H(u, v) = 1;
        end
    end
end
G = H.*F;
g = real(ifft2(fftshift(G)));
subplot(1, 5, 3);
imshow(H, []);
title('Window');
subplot(1, 5, 4);
imshow(log(abs(G)+1), []);
title('Multiplyed by window');
subplot(1, 5, 5);
imshow(g, []);
title('After ifft & fftshift');
