function [val_focus,gray_img] = get_focus(imag)
% Function to get contrast of image
% img = imread(&#39;ifoc.tif&#39;); % Image file
gray_img = (rgb2gray(imag)); % Grayscale Image required for processing
for i_n=1:max(size(gray_img)) % For removing white border around image by emptying columns of 255
if i_n<= size(gray_img,2)
if min(gray_img(:,i_n))==255, gray_img(:,i_n) = []; end
end
if i_n <= size(gray_img,1)
if min(gray_img(i_n,:))==255, gray_img(i_n,:) = []; end
end
end
cont = rangefilt(gray_img); % Contrast of image
val_focus = mean(mean(cont)); % rangefilt returns an array, so the mean needs to be calculated
end