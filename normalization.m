function [ A ] = normalization( A, L )
% ��һ��

A = A / L;
A(:, 1) = 0;
A(:, L) = 1;

end

