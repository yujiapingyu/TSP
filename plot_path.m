function [  ] = plot_path( point_position_x_and_y, path, length )
% ����·��·

x_=point_position_x_and_y(path,1);
y_=point_position_x_and_y(path,2);
plot(x_,y_,'-o');
title(length);

drawnow;

end

