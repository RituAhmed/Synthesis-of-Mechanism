function sj=calc_corrector(it,s,sd,sd0)
%Funci�n para calcular el corrector del integrador RT

%Entradas
%it (Paso de tiempo)
%s (Vector columna con la soluci�n en el paso de integraci�n i)
%sd (Vector columna con la derivada de la soluci�n en el paso de integraci�n i)
%sd0 (Vector columna con la derivada de la soluci�n en el paso de integraci�n i, iteraci�n anterior)

%Salidas
%sj (Vector columna con la correcci�n de la soluci�n para la iteraci�n j)

% %Determinar el n�mero de variables
%     n=length(s)/2;
% 
% %Extraer vectores de posici�n, velocidad y aceleraci�n en el paso i
%     q=s(1:n);
%     dq=s(n+1:n+n);
%     d2q=sd(n+1:n+n);
%     
% %Extraer el vector de aceleraci�n en la iteraci�n anterior
%     d2q0=sd0(n+1:n+n);
%     
% %Construir la correcci�n
%     qj=q+dq*it+0.25*(d2q+d2q0)*it^2;
%     dqj=dq+0.5*(d2q+d2q0)*it;
%     
% %Construir la salida
%     sj=[qj;dqj];
%
%Construir la salida
    sj=s+0.5*it*(sd+sd0);