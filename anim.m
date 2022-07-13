%Animar el movimiento del robot

clc
clf

clear all

%Definir las constantes globales
    global mech nconst c qini
    
    addpath("C�digos\Cinem�tica\3D\V1.1\");
    addpath("C�digos\Din�mica\3D\V1.0\");

%Cargar datos de restricciones cinem�ticas
    load kinematic_def
    load vect_c_qini

%Determinar el n�mero de bloques de ecuaciones de restricci�n
    nconst=size(mech,1);
      
%Determinar el n�mero de coordenadas totales
    nq=length(qini);
        
%Definir las coordenadas independientes
    pz=[19 20 21];
    nz=length(pz);
        
%Determinar las posiciones de las variables dependientes
    pvar=def_pvar(nq,pz);
    nvar=length(pvar);
    
%Realizar la simulaci�n y animaci�n del movimiento
    animar=true;
    vt=0:0.01:5;
    [pos,vel,acel,errpos,nrank,IM]=inverse_kinematics(vt,qini,c,pz,animar);
    figure(2)
    subplot(1,3,1)
    plot(vt,errpos)
    xlabel('t [s]')
    ylabel('norm(phi)')
    subplot(1,3,2)
    plot(vt,nrank)
    xlabel('t [s]')
    ylabel('rank(jacvar)')
    subplot(1,3,3)
    plot(vt,IM)
    xlabel('t [s]')
    ylabel('Manipulability index')