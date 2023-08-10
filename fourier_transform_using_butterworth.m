%FOURIER TRANSFORM USING BUTTERWORTH LOW PASS
clc;
f = rgb2gray(imread('road.jpg')); %insert image and convert into grayscale
f = im2double(f); %convert image in double
F = fftshift(fft2(f)); %fourier transform in center
subplot(1, 5, 1);
imshow(f, []);
title('Original Gray Image');
subplot(1, 5, 2);
imshow(log(abs(F)+1), []); %log for seeing less detailed 
title('After fftshift');
[M,N] = size(f); %extracting image size
D = @(u,v) sqrt((u-M/2)^2+(v-N/2)^2); %Distance function
H = zeros([M, N]); %set the filter funtion size same as the original image
H0 = zeros([M, N]); %for high pass filter
D0 = 200; %radius of window
n=2;
for u = 1:M
    for v = 1:N
        H(u, v) = 1/(1+(D(u,v)/D0)^(2*n)); %Butterworth filter
    end
end
%H0=1-H; %for high pass
G = H.*F; %after passing through the window filter
g = real(ifft2(fftshift(G))); %inverse fourier transform and collecting only real part
subplot(1, 5, 3);
imshow(H, []);
title('Window');
subplot(1, 5, 4);
imshow(log(abs(G)+1), []); %show the proposed image
title('Multiplyed by window');
subplot(1, 5, 5);
imshow(g, []); %show the final image
title('After ifft & fftshift');