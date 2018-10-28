function [ B ] = cross( A, w, L, cross_rate, distance_matric )
% A��������Ӵ�B

B = A(randperm(w), :);
for i = 1:2:w                              
    cross_position = 2 + floor((L-2) * rand(1, 2));         % 2<F<L-1,Ϊ����[2, L-1],��β�ĵ㲻ȥ�ı�
    sort(cross_position);
    cp1 = cross_position(1);
    cp2 = cross_position(2);
    temp = B(i, cp1:cp2);         % ������i���͵�i+1���Ӵ���F:L��
    B(i, cp1:cp2) = B(i+1, cp1:cp2);
    B(i+1, cp1:cp2) = temp;
end                                                      % ������ϣ�����w���¸���

B = B(1:w * cross_rate, :);

[~, cross_path_table] = sort(B, 2);                    % ��ÿһ�е�Ԫ�ؽ������򣬻�ȡ���е�·��
B = normalization(circle_modification(cross_path_table, w * cross_rate, L, distance_matric), L);

end

