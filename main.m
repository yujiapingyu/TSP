tic
clc,clear
rng('shuffle');         %�ı�������ĳ�ʼ״̬

% -----------------����------------------
w = 500;                % ��Ⱥ��ģ
restart_times = 20;     % ��������
iterations = 300;       % ��������
cross_rate = 1;         % ������
mutation_rate = 1;      % ������
% ---------------------------------------

% ���ļ��ж�ȡ��Ϣ
load ch130.mat          % �������ݼ�
point_info = ch130(:,2:3);            
point_position_x_and_y = [point_info; point_info(1,:)];  
distance_matric = get_distance_matric(point_info);

L = length(ch130) + 1;              % Ϊ�˱�֤�����ܻص���㣬ʵ�ʵĸ��峤����ΪL��L�����һ�����͵�һ������ͬ����֤�ص����

optimal_path = zeros([1, L]);       % ��¼ȫ�����·��
optimal_path_length = 999999;       % ��¼ȫ�����·���ĳ���

for r_index = 1:restart_times
    
    current_optimal_path = zeros([1, L]);
    current_optimal_path_length = 999999;
    last_optimal_path_length = current_optimal_path_length;
    same_time = 0;

    % ������ʼ��Ⱥ
    initial_population = generate_population(w, L);

    % ����Ȧ������ʼ��Ⱥ
    A = circle_modification(initial_population, w, L, distance_matric);

    % ��һ��
    A = normalization(A, L);

    % ����Ϊ�Ŵ��㷨ʵ�ֹ���
    for k=1:iterations

        % ��������Ӵ� B
        B = cross(A, w, L, cross_rate, distance_matric);

        % ��������Ӵ� C
        C = mutation(A, w, L, mutation_rate, distance_matric);

        % ѡ����һ��
        [A, current_optimal_path, current_optimal_path_length] = select_next_generation_improved(A, B, C, w, L, distance_matric);
        
        if current_optimal_path_length == last_optimal_path_length
           same_time = same_time + 1; 
           if same_time >= 100
               break;
           end
        else   
            same_time = 0;
        end
        
        last_optimal_path_length = current_optimal_path_length;

        % ��������·��ͼ
        plot_path(point_position_x_and_y, current_optimal_path, current_optimal_path_length)     

        % ���ÿ�ε�������Ϣ
        fprintf('��%0d����������������%04d������·������%.5f��ȫ������·������%.5f\n' , r_index, k, current_optimal_path_length, optimal_path_length); 
    end
    
    if current_optimal_path_length < optimal_path_length
        optimal_path_length = current_optimal_path_length;
        optimal_path = current_optimal_path;
    end

end 

toc                                                                      % ����������е�ʱ��