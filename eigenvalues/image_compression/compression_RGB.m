% [ABOUT]
%       This function is used for compressing an RGB image,
%       using the Singular Value Decomposition technique
% [INPUT] 
%       `image`               - Path to the input RGB image
%       `compression_factor`  - Factor of compression (e.g: 2)
% [OUTPUT]
%       Compressed RGB image
% [USAGE]
%       e.g: compression_RGB('img_before_compression.jpg', 2);
% [USES] 
%       eigenvalues/image_compression/compresison.m

function [img_red] = compression_RGB(image, compression_factor)  
    % Read the image
    img = imread(image);

    % Calculate `k` (number of singular values to keep) 
    [m n] = size(double(img));
    k =  min(m, n) / compression_factor;

    % Plot the initial image (before compression) [Fig. 1]
    figure; 
    imshow(img);  

    % Extract each color channel
    R = img(:, :, 1);
    G = img(:, :, 2);
    B = img(:, :, 3);

    % Compress each channel separately
    R_compressed = compression(R, k);
    G_compressed = compression(G, k);
    B_compressed = compression(B, k);

    % Generate the compressed RGB image
    img_red = cat(3, R_compressed, G_compressed, B_compressed);

    % Plot the final image (after compression) [Fig. 2]
    figure; 
    imshow(uint8(img_red));   

    % Save the image after compression
    imwrite(uint8(img_red), 'img_after_compression.jpg');
    
endfunction
