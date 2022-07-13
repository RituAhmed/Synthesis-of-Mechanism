function jac=calc_jac(t,q,c)
%Funci�n para calcular la matriz jacobiano de las ecuaciones de restricci�n
%Versi�n 3D 1.0

%Entradas
%t (Instante temporal, �til para restricciones re�nomas)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%jac (Matriz jacobiano nrxn)

%Definir las variables globales
    global mech nconst

%Construir jac
    jac=[];
    
%A�adir filas con las derivadas de las restricciones respecto de q
    for c1=1:nconst
        jac=[jac;eval_jac(mech{c1},t,q,c)];
    end

