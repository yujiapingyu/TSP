function [ C ] = mutation( A, w, L, mutation_rate )
% A变异产生子代C
% 对种群规模为w的A种群进行变异，返回变异后的种群C，L为个体的长度，mutation_rate为变异率

mutation_row_index = find(rand(1, w) < mutation_rate);

if isempty(mutation_row_index) 
    mutation_row_index = floor(w * rand(1))+1;
end

C = A(mutation_row_index, :);               %选出变异的行，比如by=[11 17 22 23 27 32];

mutation_row_length = length(mutation_row_index);

% 对变异行的元素重新排列
for i=1:mutation_row_length      
    
    mutation_location = 2 + floor((L-2)*rand(1,3));            
    mutation_location = sort(mutation_location);
    C(i,:)=C(i,[1:mutation_location(1)-1, mutation_location(2)+1:mutation_location(3), mutation_location(1):mutation_location(2), mutation_location(3)+1:L]);   % 对该个体重新排列组合
end

end

