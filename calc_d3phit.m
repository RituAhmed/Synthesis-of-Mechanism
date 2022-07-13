function d3phit=calc_d3phit(t,q,dq,d2q,c)
%Función para evaluar la derivada tercera respecto del tiempo de las ecuaciones de restricción
%Versión 3.0
%
%Datos de entrada
%t (Instante temporal en s)
%q (Vector columna con las coordenadas del mecanismo)
%dq (Vector columna con las velocidades en las coordenadas globales)
%d2q (Vector columna con las aceleraciones en las coordenadas globales)
%c (Vector fila con las dimensiones principales del mecanismo)
%
%Datos de salida
%d3phit (Vector columna con la derivada tercera temporal de las ecuaciones de restriccion)
%
    
%Definir las variables globales
    global mech nconst
    
%Construir dphit
    d3phit=[];
    
%Añadir filas con las derivadas temporales de las restricciones
    for c1=1:nconst
        d3phit=[d3phit;eval_d3phit(mech{c1},t,q,dq,d2q,c)];
    end