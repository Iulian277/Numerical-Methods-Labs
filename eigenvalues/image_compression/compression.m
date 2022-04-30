% [ABOUT]
%       This function is used for compressing a grayscale image (1 channel),
%       using the Singular Value Decomposition technique
% [INPUT] 
%       `img`      - Input matrix (image)
%       `k`        - Number of singular values to keep
% [OUTPUT]
%       Compressed grayscale image
% [USES] 
%       eigenvalues/svd_alg.m

function [img_compressed] = compression(img, k)
    % Read the image and convert it to double
    img_matrix = double(img);
    [m n] = size(img_matrix);

    % Decompose the input image (built-in SVD is faster)
    [U, S, V] = svd(img_matrix);
    % [U, S, V] = svd_alg(img_matrix);

    % Keep only the first `k` singular values (most dominant ones)
    U_k = U(:, 1 : k);
    S_k = S(1: k, 1 : k);
    V_k = V(:, 1 : k);

    % The following singular values (least dominant ones) represent the `noise`
    % U_k = U(:, (k + 1) : m);
    % S_k = S((k + 1) : m, (k + 1) : m);
    % V_k = V(:, (k + 1) : m);

    % Recompose the image
    img_compressed = U_k * S_k * V_k';
    
endfunction
