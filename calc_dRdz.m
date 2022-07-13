function dRdz=calc_dRdz(dq,pvar,pz,jacvar,jacz,djac,d2phit)
%Función para calcular el vector dR*dZ

%Entradas
%dq (Vector columna con la velocidad de las coordenadas)
%pvar (Vector fila con las posiciones de las coordenadas variables)
%pz (Vector fila con las posiciones de las coordenadas independientes)
%jacvar (Matriz jacobiano en las coordenadas dependientes)
%jacz (Matriz jacobiano en las coordenadas independientes)
%djac (Matriz derivada temporal del jacobiano en las coordenadas dependientes)
%d2phit (Vector con la derivada segunda de las restricciones respecto del tiempo)

%Salidas
%dRdz (Vector dRdz)

%Determinar el número de coordenadas
    nz=length(pz);
    nq=length(pvar)+nz;

%Construir el vector de aceleraciones nulas
    d2z=zeros(nz,1);
    
%Calcular la aceleración de las variables
    dRdz=calc_acel_z(nq,dq,d2z,pvar,pz,jacvar,jacz,djac,d2phit);