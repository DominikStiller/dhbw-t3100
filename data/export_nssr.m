function export_nssr()

[path, ~, ~] = fileparts(mfilename('fullpath'));

logsout = evalin('base', 'logsout');
time_vector = evalin('base', 'tout');

data = get(logsout, 'wssr');
nssr = squeeze(data.Values.Data);

export = [time_vector, nssr'];
dlmwrite([path, '/', 'failure_detection_nssr.csv'], export, 'delimiter', ',', 'precision', 9);

end

