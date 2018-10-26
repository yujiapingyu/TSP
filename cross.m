function [ B ] = cross( A, w, L, cross_rate )
% A��������Ӵ�B

B = A(randperm(w), :);
for i = 1:2:w                              
    cross_position = 2 + floor((L-2) * rand(1, 2));         % 2<F<L-1,Ϊ����[2, L-1],��β�ĵ㲻ȥ�ı�
    [cp1, cp2] = sort(cross_position);
    temp = B(i, cp1:cp2);         % ������i���͵�i+1���Ӵ���F:L��
    B(i, cp1:cp2) = B(i+1, cp1:cp2);
    B(i+1, cp1:cp2) = temp;
end                                                      % ������ϣ�����w���¸���

B = B(1:w * cross_rate, :);

end

