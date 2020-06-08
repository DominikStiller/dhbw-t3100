function export_nssr()

[path, ~, ~] = fileparts(mfilename('fullpath'));

logsout = evalin('base', 'logsout');
time_vector = evalin('base', 'tout');

data = get(logsout, 'wssr');
nssr = squeeze(data.Values.Data);

data1 = get(logsout, 'EKF_x_1');
data2 = get(logsout, 'EKF_x_2');
data3 = get(logsout, 'EKF_x_3');
x_vx = [data1.Values.Data(:,3), data2.Values.Data(:,3), data3.Values.Data(:,3)];

export = [time_vector, nssr', x_vx];
dlmwrite([path, '/', 'failure_detection_nssr.csv'], export, 'delimiter', ',', 'precision', 9);

end

