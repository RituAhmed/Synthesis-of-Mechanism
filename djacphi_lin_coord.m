function djacphi=djacphi_lin_coord(p,q,dq,c)
%Función para calcular la derivada temporal del jacobiano de las ecuaciones relativas a la
%definición de una coordenada lineal

%Entradas
%p (Vector fila 8x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nx3 ny3 nL12 nd]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djacphi (Matriz 2xn con la derivada temporal del jacobiano de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales y constantes que se van a utilizar en el jacobiano de las ecuaciones de
%restricción
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
    
    if 0<p(5)
        dx3=dq(p(5));
    else
        dx3=0;
    end
    
    if 0<p(6)
        dy3=dq(p(6));
    else
        dy3=0;
    end
    
    if 0<p(8)
        dd=dq(p(8));
    else
        dd=0;
    end
    
%Extraer las constantes geométricas
    L12=c(-p(7));
    
%Calcular el jacobiano de las ecuaciones de restricción
    djacphi=zeros(2,n);
    if 0<p(1)
        djacphi(1,p(1))=dd/L12;
    end
    
    if 0<p(2)
        djacphi(2,p(2))=dd/L12;
    end
    
    if 0<p(3)
        djacphi(1,p(3))=-(dd/L12);
    end
    
    if 0<p(4)
        djacphi(2,p(4))=-(dd/L12);
    end
    
    if 0<p(8)
        djacphi(1,p(8))=-(dx2-dx1)/L12;
        djacphi(2,p(8))=-(dy2-dy1)/L12;
    end