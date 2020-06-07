function export_ekf(name)

[path, ~, ~] = fileparts(mfilename('fullpath'));

logsout = evalin('base', 'logsout');
time_vector = evalin('base', 'tout');

data = get(logsout, 'EKF_x');
x = data.Values.Data;

data = get(logsout, 'EKF_z');
z = data{1}.Values.Data;

data = get(logsout, 'EKF_res');
res = data.Values.Data;

export = [time_vector, x, z, res];
dlmwrite([path, '/', 'ekf_', name, '.csv'], export, 'delimiter', ',', 'precision', 9);

end

