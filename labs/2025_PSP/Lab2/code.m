%% 22-psp
% 清除工作区和图形窗口
clear;
clc;
close all;

% 定义系统参数
K = 3.3;    % 系统增益
T1 = 288.40;% 时间常数1 (秒)
T2 = 26.33; % 时间常数2 (秒)
tau = 5;

% 创建传递函数模型
s = tf('s');
sys = K * exp(-tau*s) / ((T1*s + 1) * (T2*s + 1));

% 设置模拟时间
t_final = 1000; % 模拟结束时间 (秒)
time = linspace(0, t_final, 10000); % 时间向量

Kp = 19.7; % 比例增益

% 构建闭环系统 - 使用纯比例控制器
sys = feedback(Kp * sys, 1);

% 绘制阶跃响应
figure;
step(sys, time);
title(['Closed-loop Step Response with Proportional Gain Kp = ', num2str(Kp)]);
xlabel('Time (sec)');
ylabel('Response');