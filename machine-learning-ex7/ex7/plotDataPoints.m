function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color

% Create palette - ��ɫ�壬һ����ɫ
% hsv(M)����һ��M*3������ɫ�Ӻ졢�ơ��̡��ࡢ���������󷵻ص���ɫ
palette = hsv(K + 1);
% idxֵ��ͬ�ĵ㱻����Ϊ��ͬ����ɫ
colors = palette(idx, :);

% Plot the data
% scatter(X,Y,S,C)������һ�����ɫ��Ȧ
% SΪȦ�Ĵ�С��CΪRGB��ɫֵ
scatter(X(:,1), X(:,2), 15, colors);

end
