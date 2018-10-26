function [ A_next, optimal_path, optimal_path_length ] = select_next_generation( A, B, C, w, L, distance_matric )
% ѡ���Ŵ�����һ��
G = [A;B;C];                            % AΪԭʼ�ģ�BΪ�����ģ�CΪ������
total_length = size(G, 1);               % �������Ӵ����ܳ���

%�ڸ������Ӵ���ѡ������Ʒ����Ϊ�µĸ���
[~, path_table] = sort(G,2);               % ��ÿһ�е�Ԫ�ؽ������򣬻�ȡ���е�·��
all_path_length = [];
all_path_length(1:total_length) = 0;            % ��ʼ������·���ĳ���Ϊ0
for path_index = 1:total_length                 % ����ÿ��·���ĳ���
    all_path_length(path_index) = get_path_length(path_table(path_index, :), L, distance_matric);
end

[sorted_length, sorted_index] = sort(all_path_length);      
A_next = G(sorted_index(1:w), :);                   %ѡ��������̵�w���Ӵ�
optimal_path = path_table(sorted_index(1), :);      % ��ʱ�����·��Ϊ��1������
optimal_path_length = sorted_length(1);             % DzΪ�����·����ʵ�ʾ���

end

