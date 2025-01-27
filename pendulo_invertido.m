
function dz=pendulo_invertido(t,z)
%definicion de parametors%
Ip = 0.0079;  
Mc = 0.7031;  
Mp = 0.23;    
lp = 0.3302;  
Beq = 4.3;    
Bp = 0.0024;  
g = 9.81;     
Fc = 0;       

% Variables de estado
xc = z(1);       % Posición del carrito 
dxc = z(2);   % Velocidad del carrito 
alpha = z(3);    % Ángulo del péndulo 
alpha_der = z(4); % Velocidad angular del péndulo


%definicion de la dinamica%
M = (Mc + Mp) * Ip + Mc * Mp * lp^2 + Mp^2 * lp^2 * sin(alpha)^2;
dz = zeros(4,1);

dz(1) = dxc;
dz(2) = (1/M) * ((Ip + Mp * lp^2) * Fc + Mp^2 * lp^2 * g * cos(alpha) * sin(alpha) - (Ip + Mp * lp^2) * Beq * dxc ...
        - (Ip * Mp * lp - Mp^2 * lp^3) * alpha_der^2 * sin(alpha) - Mp * lp * alpha_der * cos(alpha) * Bp);

dz(3) = alpha_der; 
dz(4) = (1/M) * ((Mc + Mp) * Mp * g * lp * sin(alpha) - (Mc + Mp) * Bp * alpha_der + Fc * Mp * lp * cos(alpha) ...
        - Mp^2 * lp^2 * alpha_der^2 * sin(alpha) * cos(alpha) - Beq * Mp * lp * dxc * cos(alpha));
