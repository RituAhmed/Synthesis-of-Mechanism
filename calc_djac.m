function djac=calc_djac(t,q,dq,c)
%Función para calcular la derivada temporal de la matriz jacobiano de las ecuaciones de restricción
%Versión 3D 1.0

%Entradas
%t (Instante temporal, útil para restricciones reónomas)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades en las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djac (Matriz jacobiano nrxn)

%Definir las variables globales
    global mech nconst

%Construir jac
    djac=[];
    
%Añadir filas con las derivadas temporales del jacobiano de las restricciones
    for c1=1:nconst
        djac=[djac;eval_djac(mech{c1},t,q,dq,c)];
    end