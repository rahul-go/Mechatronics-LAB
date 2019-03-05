clc
clear variables

T_m = 0; %torque to wheels .75lbin for both wheels max speed 3.6rot/s      


%% setup for ODE shit
% Time initial and time final
t_0 = 0;                        % Initial time (s)
t_f = 100;                       % Final time (s)

% Time step for lsim 
t_step = 0.001;                 % Time step (s)

ICs = [0
       0
       0
       .1];

botODE = @(t, x) BotEOM(x, T_m);
% Solve for x (and store corresponding time values)
[t_ode45, x_ode45] = ode45(botODE,[t_0, t_f], ICs);
figure(1)          
plot(t_ode45, x_ode45(:,3),'k')
hold on
plot(t_ode45, x_ode45(:,4));
xlabel('Time [s]');
legend('Position [in]','Angle [rad]');
hold off

Animate(t_ode45, x_ode45(:,3), x_ode45(:,4));
