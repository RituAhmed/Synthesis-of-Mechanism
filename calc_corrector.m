function sj=calc_corrector(it,s,sd,sd0)
%Función para calcular el corrector del integrador RT

%Entradas
%it (Paso de tiempo)
%s (Vector columna con la solución en el paso de integración i)
%sd (Vector columna con la derivada de la solución en el paso de integración i)
%sd0 (Vector columna con la derivada de la solución en el paso de integración i, iteración anterior)

%Salidas
%sj (Vector columna con la corrección de la solución para la iteración j)

% %Determinar el número de variables
%     n=length(s)/2;
% 
% %Extraer vectores de posición, velocidad y aceleración en el paso i
%     q=s(1:n);
%     dq=s(n+1:n+n);
%     d2q=sd(n+1:n+n);
%     
% %Extraer el vector de aceleración en la iteración anterior
%     d2q0=sd0(n+1:n+n);
%     
% %Construir la corrección
%     qj=q+dq*it+0.25*(d2q+d2q0)*it^2;
%     dqj=dq+0.5*(d2q+d2q0)*it;
%     
% %Construir la salida
%     sj=[qj;dqj];
%
%Construir la salida
    sj=s+0.5*it*(sd+sd0);