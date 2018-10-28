function [ distance_matrix ] = get_distance_matrix( point_info )
% 获取距离矩阵
number_of_point = length(point_info);
D = pdist(point_info,'euclidean');  % 每两点之间的欧式距离，矩阵大小为(1,n)
distance_matrix = zeros(number_of_point + 1);      % 每次都要回到起点，因此，最后一列为到起点的距离
sum = 0;
for i = 1:number_of_point             
     if i < number_of_point
         sum = sum + number_of_point - i;
         distance_matrix(i, i+1:number_of_point) = D(1, sum-(number_of_point-i-1):sum);   % 将已知的D距离改为矩阵形式
     end
end
distance_matrix = distance_matrix + distance_matrix';
distance_matrix(1:number_of_point, number_of_point+1) = distance_matrix(1:number_of_point, 1);         % 对最后一列进行填值
distance_matrix(number_of_point+1, :) = distance_matrix(1, :);                               % 对最后一行进行填值，完整的距离矩阵

end

