function dq=calc_vel_z(nq,dz,pvar,pz,jacvar,jacz,dphit)
%Función para calcular la velocidad en coordenadas dependientes

%Entradas
%nq (Número total de coordenadas)
%dz (Vector columna con las velocidades independientes)
%pvar (Vector fila con las posiciones de las coordenadas variables)
%pz (Vector fila con las posiciones de las coordenadas independientes)
%jacvar (Matriz jacobiano en las coordenadas dependientes)
%jacz (Matriz jacobiano en las coordenadas independientes)
%dphit (Vector con la derivada de las restricciones respecto del tiempo)

%Salidas
%dq (Vector columna con la velocidad del mecanismo)
    
%Calcular la velocidad de las variables
    dqvar=jacvar\(-jacz*dz-dphit);

%Insertar la velocidad de las variables en el vector dq
    dq=insert(zeros(nq,1),dqvar,pvar);
    dq=insert(dq,dz,pz);