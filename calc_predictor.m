function s0=calc_predictor(it,s,sd)
%Función para calcular el predictor del integrador RT

%Entradas
%it (Paso de tiempo)
%s (Vector columna con la solución en el paso de integración i)
%sd (Vector columna con la derivada de la solución en el paso de integración i)

%Salidas
%s0 (Vector columna con la predicción de la solución para el paso de integración i+1)

% %Determinar el número de variables
%     n=length(s)/2;
% 
% %Extraer vectores de posición, velocidad y aceleración
%     q=s(1:n);
%     dq=s(n+1:n+n);
%     d2q=sd(n+1:n+n);
%     
% %Construir la predicción
%     q0=q+dq*it+0.5*d2q*it^2;
%     dq0=dq+d2q*it;
%     
% %Construir la salida
%     s0=[q0;dq0];
%
%Construir la salida
    s0=s+sd*it;