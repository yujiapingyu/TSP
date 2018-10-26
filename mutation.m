function [ C ] = mutation( A, w, L, mutation_rate )
% A��������Ӵ�C
% ����Ⱥ��ģΪw��A��Ⱥ���б��죬���ر�������ȺC��LΪ����ĳ��ȣ�mutation_rateΪ������

mutation_row_index = find(rand(1, w) < mutation_rate);

if isempty(mutation_row_index) 
    mutation_row_index = floor(w * rand(1))+1;
end

C = A(mutation_row_index, :);               %ѡ��������У�����by=[11 17 22 23 27 32];

mutation_row_length = length(mutation_row_index);

% �Ա����е�Ԫ����������
for i=1:mutation_row_length      
    
    mutation_location = 2 + floor((L-2)*rand(1,3));            
    mutation_location = sort(mutation_location);
    C(i,:)=C(i,[1:mutation_location(1)-1, mutation_location(2)+1:mutation_location(3), mutation_location(1):mutation_location(2), mutation_location(3)+1:L]);   % �Ըø��������������
end

end

