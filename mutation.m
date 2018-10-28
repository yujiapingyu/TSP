function [ C ] = mutation( A, w, L, distance_matrix )
% A��������Ӵ�C

C = A;             

% �Ա����е�Ԫ����������
for i=1:w      
    mutation_location = 2 + floor((L-2)*rand(1,3));            
    mutation_location = sort(mutation_location);
    C(i,:)=C(i,[1:mutation_location(1)-1, mutation_location(2)+1:mutation_location(3), mutation_location(1):mutation_location(2), mutation_location(3)+1:L]);   % �Ըø��������������
end

[~, mutation_path_table] = sort(C, 2);                    % ��ÿһ�е�Ԫ�ؽ������򣬻�ȡ���е�·��
C = normalization(circle_modification(mutation_path_table, w, L, distance_matrix), L);

end

