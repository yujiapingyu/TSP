tic
clc,clear
rng('shuffle');         %改变随机数的初始状态

% -----------------参数------------------
w = 500;                        % 种群规模
restart_times = 200;             % 重启次数
iterations = 300;               % 迭代次数
repeat_time_threshold = 100;    % 重复次数阈值
% ---------------------------------------

% 从文件中读取信息
load ch130.mat          % 载入数据集
point_info = ch130(:, 2:3);            
point_position_x_and_y = [point_info; point_info(1,:)];  
distance_matrix = get_distance_matrix(point_info);

L = length(ch130) + 1;              % 为了保证最终能回到起点，实际的个体长度设为L，L的最后一个数和第一个数相同，保证回到起点

optimal_path = zeros([1, L]);       % 记录全局最佳路径
optimal_path_length = 999999;       % 记录全局最佳路径的长度

for r_index = 1:restart_times
    
    current_optimal_path = zeros([1, L]);                       % 记录每次重启的最佳路径
    current_optimal_path_length = 999999;                       % 记录每次重启的最佳路径长度
    last_optimal_path_length = current_optimal_path_length;     % 记录单次遗传算法中上一次最佳路径长度，用于判断是否陷入局部最优解
    same_time = 0;                                              % 单次遗传算法陷入局部最优解的次数

    % 产生初始种群
    initial_population = generate_population(w, L);

    % 改良圈改良初始种群
    A = circle_modification(initial_population, w, L, distance_matrix);

    % 归一化
    A = normalization(A, L);

    % 以下为遗传算法实现过程
    for k=1:iterations

        % 交叉产生子代 B
        B = cross(A, w, L, distance_matrix);

        % 变异产生子代 C
        C = mutation(A, w, L, distance_matrix);

        % 选择下一代
        [A, current_optimal_path, current_optimal_path_length] = select_next_generation(A, B, C, w, L, distance_matrix);
        
        % 更新全局最优路径长度
        if current_optimal_path_length < optimal_path_length
            optimal_path_length = current_optimal_path_length;
            optimal_path = current_optimal_path;
        end

        % 绘制最优路径图
        plot_path(point_position_x_and_y, current_optimal_path, current_optimal_path_length)     

        % 输出每次迭代的信息
        fprintf('第%0d次重启，迭代次数%04d，最优路径长度%.5f，全局最优路径长度%.5f\n' , r_index, k, current_optimal_path_length, optimal_path_length); 
        
        % 记录重复次数（重复次数过高表示陷入局部最优解）
        if current_optimal_path_length == last_optimal_path_length
           same_time = same_time + 1; 
           if same_time >= repeat_time_threshold
               break;
           end
        else   
            same_time = 0;  % 重置same_time
        end
        
        % 更新last_optimal_path_length
        last_optimal_path_length = current_optimal_path_length;
        
    end

end 

toc                                                                      % 输出程序运行的时间