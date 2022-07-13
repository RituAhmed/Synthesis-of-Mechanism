function jacphi=jacphi_coord_t(p,q,fun,t)
%Funci�n para calcular el jacobiano de la ecuaci�n de restricci�n que define una coordenada respecto del tiempo

%Entradas
%p (Vector fila 1x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx])
%q (Vector columna con las coordenadas globales)
%fun (String con el nombre de la funci�n a evaluar)
%t (Instante de tiempo)

%Salidas
%jacphi (Matriz jacobiano 1xn de la ecuaci�n de restricci�n)

%Determinar el n�mero de coordenadas globales
    n=length(q);
    
%Calcular el jacobiano de la ecuaci�n de restricci�n
    jacphi=zeros(1,n);
    jacphi(1,p(1))=1;
