function R=calc_R(pvar,pz,jacvar,jacz,dphit)
%Función para calcular la matriz R correspondiente a una posición

%Entradas
%pvar (Vector fila con las posiciones de las coordenadas variables)
%pz (Vector fila con las posiciones de las coordenadas independientes)
%jacvar (Matriz jacobiano en las coordenadas dependientes)
%jacz (Matriz jacobiano en las coordenadas independientes)
%dphit (Vector con la derivada de las restricciones respecto del tiempo)

%Salidas
%R (Matriz R)

%Determinar el número de coordenadas
    nz=length(pz);
    nq=length(pvar)+nz;
    
%Inicializar la matriz R
    R=zeros(nq,nz);
    
%Bucle para calcular las columnas de la matriz R
    for c1=1:nz
        %Crear la velocidad unitaria en coordenadas independientes
            dz=zeros(nz,1);
            dz(c1,1)=1;
            
        %Actualizar el vector dq
            dq=calc_vel_z(nq,dz,pvar,pz,jacvar,jacz,dphit);
            
        %Actualizar la matriz R
            R(:,c1)=dq;
        
    end