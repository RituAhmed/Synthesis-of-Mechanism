function dphit=calc_dphit(t,q,c)
%Función para evaluar la derivada respecto del tiempo de las ecuaciones de restricción
%Versión 3D 1.0
%
%Datos de entrada
%t (Instante temporal en s)
%q (Vector columna con las coordenadas del mecanismo)
%c (Vector fila con las dimensiones principales del mecanismo)
%
%Datos de salida
%dphit (Vector columna con la derivada temporal de las ecuaciones de restriccion)
%
    
%Definir las variables globales
    global mech nconst
    
%Construir dphit
    dphit=[];
    
%Añadir filas con las derivadas temporales de las restricciones
    for c1=1:nconst
        dphit=[dphit;eval_dphit(mech{c1},t,q,c)];
    end
