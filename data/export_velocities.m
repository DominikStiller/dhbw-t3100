[path, ~, ~] = fileparts(mfilename('fullpath'));

time_vector = (100:0.001:500);
ts_base = timeseries(zeros(length(time_vector), 1), time_vector);

ekf_data = generate_ekf_data('PoST_2019-10-03_RUN002', ts_base, dt);

export = [time_vector; ekf_data.z(3,:); ekf_data.z(5,:); ekf_data.z(6,:)]';
dlmwrite([path, '/', 'velocities.csv'], export, 'delimiter', ',', 'precision', 9);
