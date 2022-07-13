function phi=calc_phi(t,q,c)
%Funci�n para calcular el vector columna phi con los miembros izquierdos de
%las ecuaciones de restricci�n
%Versi�n 3D 1.0

%Entradas
%t (Instante temporal, �til para restricciones re�nomas)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%phi (Vector columna nrx1 con los miembros izquierdos de las ecuaciones de
%restricci�n)

%Definir las variables globales
    global nr mech nconst

%Construir phi
    phi=[];
    
%A�adir restricciones
    for c1=1:nconst
        phi=[phi;eval_phi(mech{c1},t,q,c)];
    end
        
%Determinar el n�mero de ecuaciones de restricci�n
    nr=length(phi);