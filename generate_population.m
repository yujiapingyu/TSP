function [ initial_population ] = generate_population( n, L )
% 产生指定数量n的种群

initial_population = zeros([n, L]);
for i=1:n
    c = randperm(L - 2);            % 生成1---(L-2)的乱序排列, 本题中为1-129
    current_path = [1, c+1, L];     % 生成真正的个体，最后一个数为c的第一个数，c1范围为1-131
    initial_population(i, :) = current_path;
end

end

