function ds=f(t,s,sprev)
%Funci�n a integrar

%Entradas
%t (Instante de tiempo)
%s (Vector columna con [y;dy])
%sprev (Vector columna con la soluci�n en el instante anterior)

%Salidas
%ds (Vector columna con [dy;d2y])

%Definir variables globales
    global tipo_func lambda
%Funci�n base a integrar
%     if tipo_func==1
%          y=(t-1)^3;
%          dy=3*((t-1)^2);
%          d2y=6*(t-1);
%     elseif tipo_func==2
%          y=exp(lambda*t);
%          dy=lambda*y;
%          d2y=lambda^2*y;
%     end
    
%Extraer la funci�n y su derivada
    y=s(1);
    dy=s(2);
    
%Calcular la derivada segunda
    if tipo_func==1
        d2y=6*(t-1);
    elseif tipo_func==2
        d2y=lambda^2*y;
    end
    
%Construir la salida
    ds=[dy;d2y];
    