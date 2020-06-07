function export_imu_fusion_real(name)

[path, ~, ~] = fileparts(mfilename('fullpath'));

logsout = evalin('base', 'logsout');
time_vector = evalin('base', 'tout');

data = get(logsout, 'IMU');
% data = get(logsout, 'IMU_1_Corrected');
% data = get(logsout, 'IMU_2_Corrected');
data = data.Values;
fused = struct;
fused.t = time_vector;
fused.a = [data.Acceleration_X_mps2.Data, data.Acceleration_Y_mps2.Data, data.Acceleration_Z_mps2.Data];
fused.omega = [data.Roll_Rate_radps.Data, data.Pitch_Rate_radps.Data, data.Yaw_Rate_radps.Data];
fused.alpha = [data.Roll_Acceleration_radps2.Data, data.Pitch_Acceleration_radps2.Data, data.Yaw_Acceleration_radps2.Data];
% fused.alpha = zeros(length(time_vector), 3);


export = [time_vector, fused.a, fused.omega, fused.alpha];
dlmwrite([path, '/', 'imu_fusion_real_', name, '.csv'], export, 'delimiter', ',', 'precision', 9);

end

