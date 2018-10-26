function [ A ] = normalization( A, L )
% น้าปปฏ

A = A / L;
A(:, 1) = 0;
A(:, L) = 1;

end

