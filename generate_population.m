function [ initial_population ] = generate_population( n, L )
% ����ָ������n����Ⱥ

initial_population = zeros([n, L]);
for i=1:n
    c = randperm(L - 2);            % ����1---(L-2)����������, ������Ϊ1-129
    current_path = [1, c+1, L];     % ���������ĸ��壬���һ����Ϊc�ĵ�һ������c1��ΧΪ1-131
    initial_population(i, :) = current_path;
end

end

