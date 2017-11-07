irisData = readtable('iris.csv', 'ReadVariableNames', false);
irisData = table2cell(irisData);
for i = 1:50
    irisData(i,5) = {0};
end
for i = 51:100
    irisData(i,5) = {1};
end
for i = 1:50
    iris_C1{i, 1} = irisData(i,1);
    iris_C1{i, 2} = irisData(i,5);
end
for i = 51:100
    iris_C2{i-50, 1} = irisData(i,1);
    iris_C2{i-50, 2} = irisData(i,5);
end
for i = 1:50
    x1(i) = iris_C1{i,1};
    x2(i) = iris_C2{i,1};
end
x1 = x1';
x2 = x2';
x1 = cell2mat(x1);
x2 = cell2mat(x2);
pd1 = fitdist(x1,'Normal');
pd2 = fitdist(x2,'Normal');
x_values = [0:.001:10];
figure(1); %likelihood
y1 = pdf('normal', x_values, pd1.mu, pd1.sigma);
plot(x_values, y1)
hold on
y2 = pdf('normal', x_values, pd2.mu, pd2.sigma);
plot(x_values, y2)
hold off
figure(2); %posterior
for i = 1:10001
    y3(i) = y1(i)/(y1(i)+y2(i));
    y4(i) = y2(i)/(y1(i)+y2(i));
end
plot(x_values, y3)
hold on
plot(x_values, y4)