
% Condiciones iniciales%
z0 = [0; 0; deg2rad(1); 0]; 

% Tiempo de simulacion%
tspan = [0 10];
% Llamada a ode45
[t,z] = ode45(@pendulo_invertido, tspan, z0);

% Graficas%
figure;
subplot(2,1,1);
plot(t, rad2deg(z(:,3)));
grid on;
title('Ángulo del péndulo (α)');
xlabel('Tiempo (s)');
ylabel('Ángulo (°)');

subplot(2,1,2);
plot(t, z(:,1));
grid on;
title('Posición del carrito (x_c)');
xlabel('Tiempo (s)');
ylabel('Posición (m)');
