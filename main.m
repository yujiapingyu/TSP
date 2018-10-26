tic
clc,clear
rng('shuffle');         %�ı�������ĳ�ʼ״̬

% -----------------����------------------
w = 300;                % ��Ⱥ��ģ
iterations = 2000;      % ��������
cross_rate = 0.9;       % ������
mutation_rate = 0.1;    % ������
% ---------------------------------------

% ���ļ��ж�ȡ��Ϣ
load ch130.mat          % �������ݼ�
point_info = ch130(:,2:3);            
point_position_x_and_y = [point_info; point_info(1,:)];  
distance_matric = get_distance_matric(point_info);

L = length(ch130) + 1;              % Ϊ�˱�֤�����ܻص���㣬ʵ�ʵĸ��峤����ΪL��L�����һ�����͵�һ������ͬ����֤�ص����

% ������ʼ��Ⱥ
initial_population = generate_population(w, L);

% ����Ȧ������ʼ��Ⱥ
A = circle_modification(initial_population, w, L, distance_matric);
% A = initial_population;

% ��һ��
A = normalization(A, L);

% ����Ϊ�Ŵ��㷨ʵ�ֹ���
for k=1:iterations
    
    % ��������Ӵ� B
    B = cross(A, w, L, cross_rate);
    
    % ��������Ӵ� C
    C = mutation(A, w, L, mutation_rate);
    
    % ѡ����һ��
    [A, optimal_path, optimal_path_length] = select_next_generation_improved(A, B, C, w, L, distance_matric);
    
    % ��������·��ͼ
    plot_path(point_position_x_and_y, optimal_path, optimal_path_length)     
    
    % ���ÿ�ε�������Ϣ
    fprintf('��������%04d������·������%.5f\n' , k, optimal_path_length); 
end

toc                                                                      % ����������е�ʱ��
plot_path(point_position_x_and_y, optimal_path, optimal_path_length)     % ��������·��ͼ