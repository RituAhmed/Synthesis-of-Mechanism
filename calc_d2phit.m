function d2phit=calc_d2phit(t,q,dq,c)
%Función para evaluar la derivada segunda respecto del tiempo de las ecuaciones de restricción
%Versión 3D 1.0
%
%Datos de entrada
%t (Instante temporal en s)
%q (Vector columna con las coordenadas del mecanismo)
%dq (Vector columna con las derivadas temporales de las coordenadas del mecanismo)
%c (Vector fila con las dimensiones principales del mecanismo)
%
%Datos de salida
%d2phit (Vector columna con la derivada segunda temporal de las ecuaciones de restriccion)
%
    
%Definir las variables globales
    global mech nconst
    
%Construir dphit
    d2phit=[];
    
%Añadir filas con las derivadas temporales de las restricciones
    for c1=1:nconst
        d2phit=[d2phit;eval_d2phit(mech{c1},t,q,dq,c)];
    end