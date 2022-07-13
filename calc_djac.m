function djac=calc_djac(t,q,dq,c)
%Funci�n para calcular la derivada temporal de la matriz jacobiano de las ecuaciones de restricci�n
%Versi�n 3D 1.0

%Entradas
%t (Instante temporal, �til para restricciones re�nomas)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades en las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%djac (Matriz jacobiano nrxn)

%Definir las variables globales
    global mech nconst

%Construir jac
    djac=[];
    
%A�adir filas con las derivadas temporales del jacobiano de las restricciones
    for c1=1:nconst
        djac=[djac;eval_djac(mech{c1},t,q,dq,c)];
    end