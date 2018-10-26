function [ path_length ] = get_path_length( path, L, distance_matric )
% 计算某路径的长度

path_length = 0;

for i = 1:L-1
    path_length = path_length + distance_matric(path(i), path(i+1)); 
end

end

