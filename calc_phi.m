function phi=calc_phi(t,q,c)
%Función para calcular el vector columna phi con los miembros izquierdos de
%las ecuaciones de restricción
%Versión 3D 1.0

%Entradas
%t (Instante temporal, útil para restricciones reónomas)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%phi (Vector columna nrx1 con los miembros izquierdos de las ecuaciones de
%restricción)

%Definir las variables globales
    global nr mech nconst

%Construir phi
    phi=[];
    
%Añadir restricciones
    for c1=1:nconst
        phi=[phi;eval_phi(mech{c1},t,q,c)];
    end
        
%Determinar el número de ecuaciones de restricción
    nr=length(phi);