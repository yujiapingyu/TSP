function [ distance_matrix ] = get_distance_matrix( point_info )
% ��ȡ�������
number_of_point = length(point_info);
D = pdist(point_info,'euclidean');  % ÿ����֮���ŷʽ���룬�����СΪ(1,n)
distance_matrix = zeros(number_of_point + 1);      % ÿ�ζ�Ҫ�ص���㣬��ˣ����һ��Ϊ�����ľ���
sum = 0;
for i = 1:number_of_point             
     if i < number_of_point
         sum = sum + number_of_point - i;
         distance_matrix(i, i+1:number_of_point) = D(1, sum-(number_of_point-i-1):sum);   % ����֪��D�����Ϊ������ʽ
     end
end
distance_matrix = distance_matrix + distance_matrix';
distance_matrix(1:number_of_point, number_of_point+1) = distance_matrix(1:number_of_point, 1);         % �����һ�н�����ֵ
distance_matrix(number_of_point+1, :) = distance_matrix(1, :);                               % �����һ�н�����ֵ�������ľ������

end

