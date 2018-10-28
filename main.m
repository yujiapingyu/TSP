tic
clc,clear
rng('shuffle');         %�ı�������ĳ�ʼ״̬

% -----------------����------------------
w = 500;                        % ��Ⱥ��ģ
restart_times = 200;             % ��������
iterations = 300;               % ��������
repeat_time_threshold = 100;    % �ظ�������ֵ
% ---------------------------------------

% ���ļ��ж�ȡ��Ϣ
load ch130.mat          % �������ݼ�
point_info = ch130(:, 2:3);            
point_position_x_and_y = [point_info; point_info(1,:)];  
distance_matrix = get_distance_matrix(point_info);

L = length(ch130) + 1;              % Ϊ�˱�֤�����ܻص���㣬ʵ�ʵĸ��峤����ΪL��L�����һ�����͵�һ������ͬ����֤�ص����

optimal_path = zeros([1, L]);       % ��¼ȫ�����·��
optimal_path_length = 999999;       % ��¼ȫ�����·���ĳ���

for r_index = 1:restart_times
    
    current_optimal_path = zeros([1, L]);                       % ��¼ÿ�����������·��
    current_optimal_path_length = 999999;                       % ��¼ÿ�����������·������
    last_optimal_path_length = current_optimal_path_length;     % ��¼�����Ŵ��㷨����һ�����·�����ȣ������ж��Ƿ�����ֲ����Ž�
    same_time = 0;                                              % �����Ŵ��㷨����ֲ����Ž�Ĵ���

    % ������ʼ��Ⱥ
    initial_population = generate_population(w, L);

    % ����Ȧ������ʼ��Ⱥ
    A = circle_modification(initial_population, w, L, distance_matrix);

    % ��һ��
    A = normalization(A, L);

    % ����Ϊ�Ŵ��㷨ʵ�ֹ���
    for k=1:iterations

        % ��������Ӵ� B
        B = cross(A, w, L, distance_matrix);

        % ��������Ӵ� C
        C = mutation(A, w, L, distance_matrix);

        % ѡ����һ��
        [A, current_optimal_path, current_optimal_path_length] = select_next_generation(A, B, C, w, L, distance_matrix);
        
        % ����ȫ������·������
        if current_optimal_path_length < optimal_path_length
            optimal_path_length = current_optimal_path_length;
            optimal_path = current_optimal_path;
        end

        % ��������·��ͼ
        plot_path(point_position_x_and_y, current_optimal_path, current_optimal_path_length)     

        % ���ÿ�ε�������Ϣ
        fprintf('��%0d����������������%04d������·������%.5f��ȫ������·������%.5f\n' , r_index, k, current_optimal_path_length, optimal_path_length); 
        
        % ��¼�ظ��������ظ��������߱�ʾ����ֲ����Ž⣩
        if current_optimal_path_length == last_optimal_path_length
           same_time = same_time + 1; 
           if same_time >= repeat_time_threshold
               break;
           end
        else   
            same_time = 0;  % ����same_time
        end
        
        % ����last_optimal_path_length
        last_optimal_path_length = current_optimal_path_length;
        
    end

end 

toc                                                                      % ����������е�ʱ��