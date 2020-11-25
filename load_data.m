% 读入数据
% filename: 年份.mat
function [train_set, test_set] = load_data(filename)
    data = load(filename);
    eval(['data = data.' filename(1:8) ';']);
    train_index = find(data.TargetScore1 ~= -1);
    test_index = find(data.TargetScore1 == -1);
    train_set = [data.Score(train_index,:) data.TargetScore1(train_index)];
    test_set = data.Score(test_index,:);
end