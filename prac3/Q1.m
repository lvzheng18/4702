c1_num = 1;
c2_num = 1;
for i = 1:500
    if (strcmp(Data(i,9), 'pos') == 1)
        c1(c1_num,1:8) = Data(i,1:8);
        c1_num = c1_num+1;
    else
        c2(c2_num,1:8) = Data(i,1:8);
        c2_num = c2_num+1;
    end
end
valid_num = 1;
for i = 1:500
    valid(valid_num, 1:8) = Data(i,1:8);
    valid_num = valid_num+1;
end
c1 = cell2mat(c1);
c2 = cell2mat(c2);
valid = cell2mat(valid);
cov1 = cov(c1);
cov2 = cov(c2);
mean1 = mean(c1);
mean2 = mean(c2);
y1 = mvnpdf(valid, mean1, cov1);
y2 = mvnpdf(valid, mean2, cov2);
error = 0;
predict = cell(500,1);
for i = 1:500
    if (y1(i) < y2(i))
        predict(i) = cellstr('neg');
    else
        predict(i) = cellstr('pos');
    end
    if (strcmp(predict(i),Data(i,9)) == 0)
        error = error+1;
    end
end
