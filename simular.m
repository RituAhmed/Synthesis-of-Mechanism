%Simulación dinámica con formulación de Matriz R

clc
clear
clear global
clf

%Definir las constantes globales
    global nq nz nr na pvar pz mass mech nconst c Kctc
    
%Cargar datos de restricciones cinemáticas
    load kinematic_def
    
%Cargar datos de masas
    load mass_def

%Definir la ganancia proporcional del CTC
    Kctc=1000;

%Determinar el número de bloques de ecuaciones de restricción
    nconst=size(mech,1);

%Definir constantes dimensionales
    load vect_c_qini.mat
      
%Calcular condiciones iniciales para la simulación (posición y velocidad)
    %Determinar el número de coordenadas
        nq=length(qini);
        
    %Definir la posición de las coordenadas independientes
        pz=[19 20 21];
        nz=length(pz);
    
    %Definir el numero de actuadores
        na = 3;
        
    %Determinar las posiciones de las variables dependientes
        pvar=def_pvar(nq,pz);
        nvar=length(pvar);
        
    %Cálcular el valor de las coordenadas independientes y su velocidad en
    %el instante inicial
        z0=[0.1-0.005; %XCAMA
            0.25; %YCAMA
            0]; %ZCAMA
        
        dz0=[0;
            0;
            0];
            
    %Calcular la posición para el instante inicial
        [q0,phi0]=calc_pos_z(0,z0,qini,c,pvar,pz);
        nr=length(phi0);
        
    %Calcular la velocidad en el instante inicial
%         jac0=calc_jac(0,q0,c);
%         [jac0var,jac0z]=selec_var(jac0,pvar);
%         dphit0=calc_dphit(0,q0,c);
%         dq0var=-jac0var\(jac0z*dz0+dphit0);
%         dq0=insert(q0,dz0,pz);
%         dq0=insert(dq0,dq0var,pvar);
    
    %Construir el vector s0
        s0=[z0;
            dz0];
        
%Crear el vector de instantes de tiempo
    tfin=5;
    it=0.01;
    vt=(0:it:tfin)';
    
%Integrar y medir el tiempo de simulación
    tic
    [vt,result,addres]=RK2('f_matriz_R',vt,s0,q0);
    %[vt,result,addres]=Euler_TrabajoSySM('f_matriz_R',vt,s0,q0);
    %[vt,result,addres]=RT_TrabajoSySM('f_matriz_R',vt,s0,q0);
    %[vt,result,addres]=AB2_TrabajoSySM('f_matriz_R',vt,s0,q0);
    tiempo=toc;
    
%Plotear los resultados
    if true
        
        pos=addres(:,1:nq);
        vel=addres(:,nq+1:2*nq);
        acel=addres(:,2*nq+1:3*nq);
        U=addres(:,3*nq+1:3*nq+na);

        posdes=inverse_kinematics(vt,qini,c,pz,false);
        
        figure(1) %Posición, velocidad y error de posicion en TCP
        
        subplot(4,3,1) %xi
            plot(vt,pos(:,19)*1000,'b')
            grid on
            xlabel('Tiempo [s]');
            ylabel('x_{NOZZLE} [mm]');

        subplot(4,3,2) %yi
            plot(vt,pos(:,20)*1000,'g')
            grid on
            xlabel('Tiempo [s]');
            ylabel('y_{NOZZLE} [mm]');

        subplot(4,3,3) %zb
            plot(vt,pos(:,21)*1000,'r')
            grid on
            xlabel('Tiempo [s]');
            ylabel('z_{BED} [mm]');

        subplot(4,3,4) %dxi
            plot(vt,vel(:,19)*1000,'b')
            grid on
            xlabel('Tiempo [s]');
            ylabel('dx_{NOZZLE} [mm/s]');

        subplot(4,3,5) %dyi
            plot(vt,vel(:,20)*1000,'g')
            grid on
            xlabel('Tiempo [s]');
            ylabel('dy_{NOZZLE} [mm/s]');

        subplot(4,3,6) %dzb
            plot(vt,vel(:,21)*1000,'r')
            grid on
            xlabel('Tiempo [s]');
            ylabel('dz_{BED} [mm/s]');

        subplot(4,3,7) %d2xi
            plot(vt,acel(:,19)*1000,'b')
            grid on
            xlabel('Tiempo [s]');
            ylabel('d2x_{NOZZLE} [mm/s^2]');

        subplot(4,3,8) %d2yi
            plot(vt,acel(:,20)*1000,'g')
            grid on
            xlabel('Tiempo [s]');
            ylabel('d2y_{NOZZLE} [mm/s^2]');

        subplot(4,3,9) %d2zb
            plot(vt,acel(:,21)*1000,'r')
            grid on
            xlabel('Tiempo [s]');
            ylabel('d2z_{BED} [mm/s^2]');

        subplot(4,3,10) %xi-xides
            plot(vt,(pos(:,19)-posdes(:,19))*1000,'b')
            grid on
            xlabel('Tiempo [s]');
            ylabel('x_{NOZZLE}-x_{NOZZLE}_d_e_s [mm]');

        subplot(4,3,11) %yi-yides
            plot(vt,(pos(:,20)-posdes(:,20))*1000,'g')
            grid on
            xlabel('Tiempo [s]');
            ylabel('y_{NOZZLE}-y_{NOZZLE}_d_e_s [mm]');

        subplot(4,3,12) %zi-zides
            plot(vt,(pos(:,21)-posdes(:,21))*1000,'r')
            grid on
            xlabel('Tiempo [s]');
            ylabel('z_{BED}-z_{BED}_d_e_s [mm]');
            
        figure(2) %Posición, velocidad y par en actuadores
            
        subplot(3,1,1) %Fx
            plot(vt,U(:,1),'b')
            grid on
            xlabel('Tiempo [s]');
            ylabel('Fx [N]');

        subplot(3,1,2) %Fy
            plot(vt,U(:,2),'g')
            grid on
            xlabel('Tiempo [s]');
            ylabel('Fy [N]');

        subplot(3,1,3) %Fz
            plot(vt,U(:,3),'r')
            grid on
            xlabel('Tiempo [s]');
            ylabel('Fz [N]');


    end