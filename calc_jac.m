function jac=calc_jac(t,q,c)
%Función para calcular la matriz jacobiano de las ecuaciones de restricción
%Versión 3D 1.0

%Entradas
%t (Instante temporal, útil para restricciones reónomas)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%jac (Matriz jacobiano nrxn)

%Definir las variables globales
    global mech nconst

%Construir jac
    jac=[];
    
%Añadir filas con las derivadas de las restricciones respecto de q
    for c1=1:nconst
        jac=[jac;eval_jac(mech{c1},t,q,c)];
    end

