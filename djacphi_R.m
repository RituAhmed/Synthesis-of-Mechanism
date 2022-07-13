function djacphi=djacphi_R(p,q,dq,c)
%Funci�n para calcular la derivada del jacobiano de las ecuaciones
%de restricci�n que describen un par R

%Entradas
%p (Vector fila 4x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2]. Si la posici�n es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo �ndice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%djacphi (Matriz 2xn con la derivada temporal del jacobiano de las ecuaciones de restricci�n)

%Determinar el n�mero de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en el jacobiano de las ecuaciones de
%restricci�n
    if 0<p(1)
        dx1=dq(p(1));
    else
        dx1=0;
    end
    
    if 0<p(2)
        dy1=dq(p(2));
    else
        dy1=0;
    end

    if 0<p(3)
        dx2=dq(p(3));
    else
        dx2=0;
    end
    
    if 0<p(4)
        dy2=dq(p(4));
    else
        dy2=0;
    end
    
%Calcular el jacobiano de las ecuaciones de restricci�n
    djacphi=zeros(2,n);