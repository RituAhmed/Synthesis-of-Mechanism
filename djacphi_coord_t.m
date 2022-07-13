function djacphi=djacphi_coord_t(p,q,dq,fun,t)
%Funci�n para calcular la derivada temporal del jacobiano de la ecuaci�n de restricci�n que define una coordenada respecto del tiempo

%Entradas
%p (Vector fila 1x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx])
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%fun (String con el nombre de la funci�n a evaluar)
%t (Instante de tiempo)

%Salidas
%djacphi (Derivada temporal de la matriz jacobiano 1xn de la ecuaci�n de restricci�n)

%Determinar el n�mero de coordenadas globales
    n=length(q);
    
%Calcular el jacobiano de la ecuaci�n de restricci�n
    djacphi=zeros(1,n);