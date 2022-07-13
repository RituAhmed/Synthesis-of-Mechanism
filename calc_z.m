function [z,dz,d2z]=calc_z(t,c)
%Función para definir el movimiento deseado en cada instante
%
%Entradas
%t (Instante temporal)
%c (Vector de constantes)
%
%Salidas
%z (Vector columna [xd yd zd theta]
%dz (Vector columna [dxd dyd dzd dtheta]
%d2z (Vector columna [d2xd d2yd d2zd d2theta]

%Radio de circulo
R1 = 0.005;
R2 = 0.004;
R3 = 0.003;
R4 = 0.002;
R5 = 0.001;

%Posiciones finales e iniciales de las trayectorias de cada circunferencia
x01 = 0.1-R1;
y01 = 0.25;

x02 = 0.1-R2;
y02 = 0.25;

x03 = 0.1-R3;
y03 = 0.25;

x04 = 0.1-R4;
y04 = 0.25;

x05 = 0.1-R5;
y05 = 0.25;

%Centro de la circunferencia
xc = 0.1;
yc = 0.25;
zc = 0;

vimp = 0.05; % velocidad de impresión constante en m/s

tini = 0.5; % instante inicial de dibujo del circulo (s)
tpas = 0.001/vimp; % tiempo entre pasadas

t1 = tini+(2*pi*R1/vimp); % instante final de impresión del primer circulo
t1p = t1+tpas; % instante final entre pasadas
t2 = t1p+(2*pi*R2/vimp); % instante final de impresión del segundo circulo
t2p = t2+tpas; % instante final entre pasadas
t3 = t2p+(2*pi*R3/vimp); % instante final de impresión del tercer circulo
t3p = t3+tpas; % instante final entre pasadas
t4 = t3p+(2*pi*R4/vimp); % instante final de impresión del cuarto circulo
t4p = t4+tpas; % instante final entre pasadas
t5 = t4p+(2*pi*R5/vimp); % instante final de impresión del quinto circulo
t5p = t5+tpas; % instante final entre pasadas

% TRAYECTORIA
% Se construye teniendo en cuenta velocidad de impresión constante. Dado
% que la longitud de las circunferencias es variable (disminuye su tamaño), el tiempo que tarda 
% en realizarse cada una varía (disminuye también) para mantener constante la velocidad, tal
% como se refleja en el codigo a continuación

if t<=tini % tiempo inicial en espera

    xi= x01;
    yi= y01;
    zb = zc;

    dxi=0;
    dyi=0;
    dzb=0;
    d2xi=0;
    d2yi=0;
    d2zb=0;

elseif t>tini && t<=t1
    xi= xc - R1*cos(2*pi*(t-tini)/(t1-tini));
    yi= yc - R1*sin(2*pi*(t-tini)/(t1-tini));
    zb= zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t1 && t<=t1p
    xi = x01+0.001*(t-t1)/(tpas);
    yi = y01;
    zb = zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t1p && t<=t2
    xi= xc - R2*cos(2*pi*(t-t1p)/(t2-t1p));
    yi= yc - R2*sin(2*pi*(t-t1p)/(t2-t1p));
    zb= zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t2 && t<=t2p
    xi = x02+0.001*(t-t2)/(tpas);
    yi = y02;
    zb = zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t2p && t<=t3
    xi= xc - R3*cos(2*pi*(t-t2p)/(t3-t2p));
    yi= yc - R3*sin(2*pi*(t-t2p)/(t3-t2p));
    zb= zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t3 && t<=t3p
    xi = x03+0.001*(t-t3)/(tpas);
    yi = y03;
    zb = zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t3p && t<=t4
    xi= xc - R4*cos(2*pi*(t-t3p)/(t4-t3p));
    yi= yc - R4*sin(2*pi*(t-t3p)/(t4-t3p));
    zb= zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t4 && t<=t4p
    xi = x04 + 0.001*(t-t4)/(tpas);
    yi = y04;
    zb = zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t4p && t<=t5
    xi= xc - R5*cos(2*pi*(t-t4p)/(t5-t4p));
    yi= yc - R5*sin(2*pi*(t-t4p)/(t5-t4p));
    zb= zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t5 && t<=t5p
    xi = x05+0.001*(t-t5)/(tpas);
    yi = y05;
    zb = zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

elseif t>t5p
    xi=xc;
    yi=yc;
    zb=zc;

    dxi= 0;
    dyi= 0;
    dzb= 0;
    d2xi= 0;
    d2yi= 0;
    d2zb= 0;

end

%Construir las salidas
z=[xi yi zb]';
dz=[dxi dyi dzb]';
d2z=[d2xi d2yi d2zb]';