function [pos,vel,acel,errpos,nrank,IM,Movie]=inverse_kinematics(vt,qini,c,pz,anim)
%Función para resolver la cinemática inversa del robot

%Entradas
%vt (Vector columna ntx1 con los instantes temporales en los que se resuelve la
%cinemática)
%qini (Vector nx1 con la aproximación de la posición inicial del mecanismo)
%c (Vector fila con las constantes geométricas del mecanismo)
%pz (Vector fila con las posiciones de las coordenadas independientes en el
%vector q)
%anim (Booleana que indica si animar el movimiento del mecanismo o no)

%Salidas
%pos (Matriz ntxn con la posición de todas las coordenadas del mecanismo)
%vel (Matriz ntxn con la velocidad de todas las coordenadas del mecanismo)
%acel (Matriz ntxn con la aceleración de todas las coordenadas del mecanismo)
%errpos (Vector ntx1) con la norma euclidea del vector phi en cada instante)
%nrank (Vector ntx1) con el rango del jacobiano)
%IM (Vector ntx1) con el índice de manipulabilidad)

%Determinar el número de coordenadas
    nq=length(qini);
    q0=qini;

%Determinar el número de instantes temporales
    nt=length(vt);
    
%Determinar las posiciones de las variables dependientes
    pvar=def_pvar(nq,pz);
    
%Crear las salidas
    pos=zeros(nt,nq);
    vel=zeros(nt,nq);
    acel=zeros(nt,nq);
    errpos=zeros(nt,1);
    nrank=zeros(nt,1);
    IM=zeros(nt,1);

%Bucle de calculo en instantes temporales
    for c1=1:nt
        %Cálcular el valor de las coordenadas independientes
            [z,dz,d2z]=calc_z(vt(c1),c);
            
        %Calcular la posición (sin dibujar el mecanismo)
            [q,phi]=calc_pos_z(vt(c1),z,q0,c,pvar,pz);
                    
        %Calcular el jacobiano en la posición calculada
            jac=calc_jac(vt(c1),q,c);
            [jacvar,jacz]=selec_var(jac,pvar);
                    
        %Calcular la velocidad
            dphit=calc_dphit(vt(c1),q,c);
            dqvar=-jacvar\(jacz*dz+dphit);
            dq=insert(q,dz,pz);
            dq=insert(dq,dqvar,pvar);
                    
        %Calcular la derivada del jacobiano
            djac=calc_djac(vt(c1),q,dq,c);
            [djacvar,djacz]=selec_var(djac,pvar);
            
        %Calcular la aceleración
            d2phit=calc_d2phit(vt(c1),q,dq,c);
            d2qvar=-jacvar\(jacz*d2z+djacvar*dqvar+djacz*dz+d2phit);
            d2q=insert(q,d2z,pz);
            d2q=insert(d2q,d2qvar,pvar);
        
        %Guardar los resultados
            pos(c1,:)=q';
            vel(c1,:)=dq';
            acel(c1,:)=d2q';
            errpos(c1)=norm(phi);
            nrank(c1)=rank(jacvar);
            IM(c1)=calc_IM(vt(c1),q);
            
        %Actualizar aproximación de la posición para el siguiente instante
            q0=q;
           
        %Animar el movimiento (representar la posición)
            if anim
                dib_mec(q,c);
                hold on
                scatter3(pos(1:c1,10),pos(1:c1,11),pos(1:c1,12),'filled')
                hold off
                title(['T=' num2str(vt(c1)) ' s'])
                pause(0.01)
                %Movie(c1)=getframe;
            end
            
    end