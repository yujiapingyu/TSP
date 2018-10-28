function [ C ] = mutation( A, w, L, distance_matrix )
% A变异产生子代C

C = A;             

% 对变异行的元素重新排列
for i=1:w      
    mutation_location = 2 + floor((L-2)*rand(1,3));            
    mutation_location = sort(mutation_location);
    C(i,:)=C(i,[1:mutation_location(1)-1, mutation_location(2)+1:mutation_location(3), mutation_location(1):mutation_location(2), mutation_location(3)+1:L]);   % 对该个体重新排列组合
end

[~, mutation_path_table] = sort(C, 2);                    % 对每一行的元素进行排序，获取所有的路径
C = normalization(circle_modification(mutation_path_table, w, L, distance_matrix), L);

end

