function d2jacphi=d2jacphi_coord_t(p,q,dq,d2q,fun,t)
%Función para calcular la segunda derivada temporal del jacobiano de la ecuación de restricción que define una coordenada respecto del tiempo

%Entradas
%p (Vector fila 1x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx])
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%d2q (Vector columna con las aceleraciones de las coordenadas globales)
%fun (String con el nombre de la función a evaluar)
%t (Instante de tiempo)

%Salidas
%d2jacphi (Segunda derivada temporal de la matriz jacobiano 1xn de la ecuación de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Calcular el jacobiano de la ecuación de restricción
    d2jacphi=zeros(1,n);