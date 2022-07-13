function d2q=calc_acel_z(nq,dq,d2z,pvar,pz,jacvar,jacz,djac,d2phit)
%Función para calcular la aceleración en coordenadas dependientes

%Entradas
%nq (Número total de coordenadas)
%dq (Vector con las velocidades)
%d2z (Vector columna con las aceleraciones independientes)
%pvar (Vector fila con las posiciones de las coordenadas variables)
%pz (Vector fila con las posiciones de las coordenadas independientes)
%jacvar (Matriz jacobiano en las coordenadas dependientes)
%jacz (Matriz jacobiano en las coordenadas independientes)
%djac (Matriz derivada temporal del jacobiano en las coordenadas dependientes)
%d2phit (Vector con la derivada segunda de las restricciones respecto del tiempo)

%Salidas
%d2q (Vector columna con la aceleración del mecanismo)
    
%Calcular la aceleración de las variables
    d2qvar=jacvar\(-jacz*d2z-djac*dq-d2phit);

%Insertar la velocidad de las variables en el vector d2q
    d2q=insert(zeros(nq,1),d2qvar,pvar);
    d2q=insert(d2q,d2z,pz);