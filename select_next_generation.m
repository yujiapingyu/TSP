function [ A_next, optimal_path, optimal_path_length ] = select_next_generation( A, B, C, w, L, distance_matric )
% 选择遗传的下一代
G = [A;B;C];                            % A为原始的，B为交叉后的，C为变异后的
total_length = size(G, 1);               % 父代和子代的总长度

%在父代和子代中选择优良品种作为新的父代
[~, path_table] = sort(G,2);               % 对每一行的元素进行排序，获取所有的路径
all_path_length = [];
all_path_length(1:total_length) = 0;            % 初始化所有路径的长度为0
for path_index = 1:total_length                 % 计算每条路径的长度
    all_path_length(path_index) = get_path_length(path_table(path_index, :), L, distance_matric);
end

[sorted_length, sorted_index] = sort(all_path_length);      
A_next = G(sorted_index(1:w), :);                   %选出距离最短的w个子代
optimal_path = path_table(sorted_index(1), :);      % 此时的最短路径为第1个个体
optimal_path_length = sorted_length(1);             % Dz为该最短路径的实际距离

end

