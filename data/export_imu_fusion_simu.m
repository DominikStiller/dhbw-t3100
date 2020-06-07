function export_imu_fusion_simu()

[path, ~, ~] = fileparts(mfilename('fullpath'));

[time_vector, truth, log_ls, log_mean] = run_imu_fusion();

export = [time_vector', truth.a', truth.omega', truth.alpha'];
dlmwrite([path, '/', 'imu_fusion_simu_truth.csv'], export, 'delimiter', ',', 'precision', 9);

export = [time_vector', log_ls.a', log_ls.omega', log_ls.alpha'];
dlmwrite([path, '/', 'imu_fusion_simu_ls.csv'], export, 'delimiter', ',', 'precision', 9);

export = [time_vector', log_mean.a', log_mean.omega', log_mean.alpha'];
dlmwrite([path, '/', 'imu_fusion_simu_mean.csv'], export, 'delimiter', ',', 'precision', 9);

end

