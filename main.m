tic
clc,clear
rng('shuffle');         %改变随机数的初始状态

% -----------------参数------------------
w = 300;                % 种群规模
iterations = 2000;      % 迭代次数
cross_rate = 0.9;       % 交叉率
mutation_rate = 0.1;    % 变异率
% ---------------------------------------

% 从文件中读取信息
load ch130.mat          % 载入数据集
point_info = ch130(:,2:3);            
point_position_x_and_y = [point_info; point_info(1,:)];  
distance_matric = get_distance_matric(point_info);

L = length(ch130) + 1;              % 为了保证最终能回到起点，实际的个体长度设为L，L的最后一个数和第一个数相同，保证回到起点

best_A = [];
best_sum = 0;
for i = 1:100
    % 产生初始种群
    initial_population = generate_population(w, L);

    % 改良圈改良初始种群
    A = circle_modification(initial_population, w, L, distance_matric);
    
    path_A = zeros([1, w]);
    for j = 1:w
        path_A(j) = get_path_length(A(j, :), L, distance_matric);
    end
    
    if i == 1
        best_sum = sum(path_A);
        best_A = A;
    end 
    
    if sum(path_A) < best_sum
        fprintf('HHH==='); 
        best_sum = sum(path_A);
        best_A = A;
    end
    
    fprintf('迭代次数%04d\n' , i); 
        
end

% 归一化
A = normalization(best_A, L);

% 以下为遗传算法实现过程
for k=1:iterations
    
    % 交叉产生子代 B
    B = cross(A, w, L, cross_rate);
    
    % 变异产生子代 C
    C = mutation(A, w, L, mutation_rate);
    
    % 选择下一代
    [A, optimal_path, optimal_path_length] = select_next_generation_improved(A, B, C, w, L, distance_matric);
    
    % 绘制最优路径图
    plot_path(point_position_x_and_y, optimal_path, optimal_path_length)     
    
    % 输出每次迭代的信息
    fprintf('迭代次数%04d，最优路径长度%.5f\n' , k, optimal_path_length); 
end

toc                                                                      % 输出程序运行的时间
plot_path(point_position_x_and_y, optimal_path, optimal_path_length)     % 绘制最优路径图