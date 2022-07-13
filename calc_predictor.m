function s0=calc_predictor(it,s,sd)
%Funci�n para calcular el predictor del integrador RT

%Entradas
%it (Paso de tiempo)
%s (Vector columna con la soluci�n en el paso de integraci�n i)
%sd (Vector columna con la derivada de la soluci�n en el paso de integraci�n i)

%Salidas
%s0 (Vector columna con la predicci�n de la soluci�n para el paso de integraci�n i+1)

% %Determinar el n�mero de variables
%     n=length(s)/2;
% 
% %Extraer vectores de posici�n, velocidad y aceleraci�n
%     q=s(1:n);
%     dq=s(n+1:n+n);
%     d2q=sd(n+1:n+n);
%     
% %Construir la predicci�n
%     q0=q+dq*it+0.5*d2q*it^2;
%     dq0=dq+d2q*it;
%     
% %Construir la salida
%     s0=[q0;dq0];
%
%Construir la salida
    s0=s+sd*it;