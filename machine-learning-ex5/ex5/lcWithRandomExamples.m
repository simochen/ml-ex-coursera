function [error_train, error_val] = ...
    lcWithRandomExamples(X, y, Xval, yval, lambda)


m = size(X,1);

error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i = 1:m
    %生成1~m范围内i个互不相同的随机数
    %若采用rand(): index = ceil(rand(i,1)*m);则可能有相同的数
    %考虑对于组合C(m,i),i个值互不相同
    %在matlab中求组合函数nchoosek可进行向量选择
    %C＝nchoosek(V,k)函数
    %从向量中一次选其中k个元素的所有组合C
    %C是一个矩阵,列数为k,无论V是行向量还是列向量
    
    %求C(m,i)
    c = nchoosek(m,i);
    %生成2个1~c的随机数，用以选择矩阵C的行,可以相同
    ind = ceil(rand(1,2)*c);
    %求组合矩阵C，并随机选择2行
    C = nchoosek(1:m,i);
    pos = C(ind,:);
    %注意pos是一个2*i的矩阵
    
    %训练样本
    theta = trainLinearReg(X(pos(1,:),:),y(pos(1,:)),lambda);
    %计算训练集和验证集误差
    error_train(i) = linearRegCostFunction(X(pos(1,:),:),y(pos(1,:)),theta,0);
    %error_val(i) = linearRegCostFunction(Xval(pos(2,:),:),yval(pos(2,:),:),theta,0);
    error_val(i) = linearRegCostFunction(Xval,yval,theta,0);
    %验证集取全部似乎效果更好，否则i小的时候随机误差较大？
end    