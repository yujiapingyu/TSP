function [ A_next, optimal_path, optimal_path_length ] = select_next_generation( A, B, C, w, L, distance_matrix )
% 选择遗传的下一代

fp = 0.3;                               % 外来人口比例
np = 0.2;                               % 非最优比例

G = [A;B;C];                            % A为原始的，B为交叉后的，C为变异后的
total_length = size(G, 1);              % 父代和子代的总长度

%在父代和子代中选择优良品种作为新的父代
[~, path_table] = sort(G,2);               % 对每一行的元素进行排序，获取所有的路径
all_path_length = [];
all_path_length(1:total_length) = 0;            % 初始化所有路径的长度为0
for path_index = 1:total_length                 % 计算每条路径的长度
    for i = 1:L-1   
        all_path_length(path_index) = all_path_length(path_index) + distance_matrix(path_table(path_index, i), path_table(path_index, i+1));
    end
end

[sorted_length, sorted_index] = sort(all_path_length);      
A_next = G(sorted_index(1:w), :);                   %选出距离最短的w个子代
optimal_path = path_table(sorted_index(1), :);      % 此时的最短路径为第1个个体
optimal_path_length = sorted_length(1);             % Dz为该最短路径的实际距离

% 人人能娶老婆
up_n = w*(1-np-fp);
for i = up_n+1:w*(1-fp)
    r = up_n + unidrnd(w - up_n);
    A_next(i) = G(r);
end

% 加入外来人口，但是前提是要对外来人口进行优化，不能把一些垃圾人种加进来
A_next(int16(w*(1-fp))+1:w, :) = normalization(circle_modification(generate_population(int16(w*fp), L), int16(w*fp), L, distance_matrix), L);


