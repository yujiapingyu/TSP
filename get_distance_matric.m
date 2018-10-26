function [ distance_matric ] = get_distance_matric( point_info )
% ��ȡ�������
number_of_point = length(point_info);
D = pdist(point_info,'euclidean');  % ÿ����֮���ŷʽ���룬�����СΪ(1,n)
distance_matric = zeros(number_of_point + 1);      % ÿ�ζ�Ҫ�ص���㣬��ˣ����һ��Ϊ�����ľ���
sum = 0;
for i = 1:number_of_point             
     if i < number_of_point
         sum = sum + number_of_point - i;
         distance_matric(i, i+1:number_of_point) = D(1, sum-(number_of_point-i-1):sum);   % ����֪��D�����Ϊ������ʽ
     end
end
distance_matric = distance_matric + distance_matric';
distance_matric(1:number_of_point, number_of_point+1) = distance_matric(1:number_of_point, 1);         % �����һ�н�����ֵ
distance_matric(number_of_point+1, :) = distance_matric(1, :);                               % �����һ�н�����ֵ�������ľ������

end

