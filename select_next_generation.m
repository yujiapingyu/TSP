function [ A_next, optimal_path, optimal_path_length ] = select_next_generation( A, B, C, w, L, distance_matrix )
% ѡ���Ŵ�����һ��

fp = 0.3;                               % �����˿ڱ���
np = 0.2;                               % �����ű���

G = [A;B;C];                            % AΪԭʼ�ģ�BΪ�����ģ�CΪ������
total_length = size(G, 1);              % �������Ӵ����ܳ���

%�ڸ������Ӵ���ѡ������Ʒ����Ϊ�µĸ���
[~, path_table] = sort(G,2);               % ��ÿһ�е�Ԫ�ؽ������򣬻�ȡ���е�·��
all_path_length = [];
all_path_length(1:total_length) = 0;            % ��ʼ������·���ĳ���Ϊ0
for path_index = 1:total_length                 % ����ÿ��·���ĳ���
    for i = 1:L-1   
        all_path_length(path_index) = all_path_length(path_index) + distance_matrix(path_table(path_index, i), path_table(path_index, i+1));
    end
end

[sorted_length, sorted_index] = sort(all_path_length);      
A_next = G(sorted_index(1:w), :);                   %ѡ��������̵�w���Ӵ�
optimal_path = path_table(sorted_index(1), :);      % ��ʱ�����·��Ϊ��1������
optimal_path_length = sorted_length(1);             % DzΪ�����·����ʵ�ʾ���

% ������Ȣ����
up_n = w*(1-np-fp);
for i = up_n+1:w*(1-fp)
    r = up_n + unidrnd(w - up_n);
    A_next(i) = G(r);
end

% ���������˿ڣ�����ǰ����Ҫ�������˿ڽ����Ż������ܰ�һЩ�������ּӽ���
A_next(int16(w*(1-fp))+1:w, :) = normalization(circle_modification(generate_population(int16(w*fp), L), int16(w*fp), L, distance_matrix), L);


