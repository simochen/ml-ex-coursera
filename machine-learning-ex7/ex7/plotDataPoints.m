function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color

% Create palette - 调色板，一组颜色
% hsv(M)返回一个M*3矩阵，颜色从红、黄、绿、青、蓝、洋红最后返回到红色
palette = hsv(K + 1);
% idx值相同的点被设置为相同的颜色
colors = palette(idx, :);

% Plot the data
% scatter(X,Y,S,C)绘制了一组带颜色的圈
% S为圈的大小，C为RGB颜色值
scatter(X(:,1), X(:,2), 15, colors);

end
