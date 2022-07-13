function pvar=def_pvar(n,pz)
%Función para definir el vector de posiciones de las coordenadas
%dependientes

%Entradas
%n (Número de coordenadas totales (dependientes e independientes)
%pz (Vector fila 1xnz con las posiciones de las coordenadas independientes en el
%vector total)

%Salidas
%pvar (Vector fila 1xnvar con las posiciones de las coordenadas dependientes)

%Crear la salida
    pvar=[];
    
%Determinar cuantas variables independientes hay
    nz=length(pz);
    
%Bucle que recorre todas las coordenadas
    for c1=1:n
        if 0==sum(c1*ones(1,nz)==pz) %La coordenada es dependiente
            pvar=[pvar c1];
        end
    end