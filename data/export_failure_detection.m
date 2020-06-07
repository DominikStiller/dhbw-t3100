function export_failure_detection(name)

[path, ~, ~] = fileparts(mfilename('fullpath'));

logsout = evalin('base', 'logsout');
time_vector = evalin('base', 'tout');

data = get(logsout, 'EKF_x');
x = data.Values.Data;

data = get(logsout, 'EKF_z');
z = data{1}.Values.Data;

data = get(logsout, 'SensorState');
data = data.Values;
failure = [
    data.GPS_Position_X_OK.Data, data.GPS_Position_Y_OK.Data, ...
    data.SFII_Velocity_X_OK.Data, data.SFII_Velocity_Y_OK.Data, ...
    data.GPS_Velocity_OK.Data, data.Wheels_Velocity_OK.Data, ...
    data.GPS_Yaw_Angle_OK.Data, data.IMU_Yaw_Rate_OK.Data
];

export = [time_vector, x, z, failure];
dlmwrite([path, '/', 'failure_detection_', name, '.csv'], export, 'delimiter', ',', 'precision', 9);

end

