function [ B ] = cross( A, w, L, cross_rate )
% A交叉产生子代B

B = A(randperm(w), :);
for i = 1:2:w                              
    cross_position = 2 + floor((L-2) * rand(1, 2));         % 2<F<L-1,为整数[2, L-1],首尾的点不去改变
    [cp1, cp2] = sort(cross_position);
    temp = B(i, cp1:cp2);         % 交换第i个和第i+1个子代的F:L列
    B(i, cp1:cp2) = B(i+1, cp1:cp2);
    B(i+1, cp1:cp2) = temp;
end                                                      % 交换完毕，产生w个新个体

B = B(1:w * cross_rate, :);

end

