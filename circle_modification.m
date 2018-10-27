function [ A ] = circle_modification( initial_population, rows, L, distance_matric )
% 改良圈改良一个初始种群initial_population，返回改良后的种群A

A = zeros([rows, L]);

for i=1:rows
    c = initial_population(i, :);
    flag = 1;
    while flag > 0
        flag = 0;
        for m = 1:L-3
            for n = m+2:L-1
                if distance_matric(c(m), c(n))+distance_matric(c(m+1), c(n+1)) < distance_matric(c(m), c(m+1))+distance_matric(c(n), c(n+1))
                    flag=1;
                    c(m+1:n) = c(n:-1:m+1);
                end
            end
        end
    end
    A(i,c) = 1:L;
end

end

