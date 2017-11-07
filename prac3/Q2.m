class_valid = cell(268,1);
error_valid = 0;
for i = 1:268
    d1 = norm(valid_data(i,:)-QDA.ClassificationDiscriminant.Mu(1,:));
    d2 = norm(valid_data(i,:)-QDA.ClassificationDiscriminant.Mu(2,:));
    if d1 < d2
        class_valid(i) = cellstr('neg');
    else
        class_valid(i) = cellstr('pos');
    end
    if strcmp(class_valid(i), pos1(i)) == 0
        error_valid = error_valid+1;
    end
end


