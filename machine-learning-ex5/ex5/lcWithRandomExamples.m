function [error_train, error_val] = ...
    lcWithRandomExamples(X, y, Xval, yval, lambda)


m = size(X,1);

error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i = 1:m
    %����1~m��Χ��i��������ͬ�������
    %������rand(): index = ceil(rand(i,1)*m);���������ͬ����
    %���Ƕ������C(m,i),i��ֵ������ͬ
    %��matlab������Ϻ���nchoosek�ɽ�������ѡ��
    %C��nchoosek(V,k)����
    %��������һ��ѡ����k��Ԫ�ص��������C
    %C��һ������,����Ϊk,����V������������������
    
    %��C(m,i)
    c = nchoosek(m,i);
    %����2��1~c�������������ѡ�����C����,������ͬ
    ind = ceil(rand(1,2)*c);
    %����Ͼ���C�������ѡ��2��
    C = nchoosek(1:m,i);
    pos = C(ind,:);
    %ע��pos��һ��2*i�ľ���
    
    %ѵ������
    theta = trainLinearReg(X(pos(1,:),:),y(pos(1,:)),lambda);
    %����ѵ��������֤�����
    error_train(i) = linearRegCostFunction(X(pos(1,:),:),y(pos(1,:)),theta,0);
    %error_val(i) = linearRegCostFunction(Xval(pos(2,:),:),yval(pos(2,:),:),theta,0);
    error_val(i) = linearRegCostFunction(Xval,yval,theta,0);
    %��֤��ȡȫ���ƺ�Ч�����ã�����iС��ʱ��������ϴ�
end    