function jacphi=jacphi_3D_rs_2p(p,q,c)
%Función para calcular el jacobiano de la ecuacion de restricción que
%define la distancia constante entre dos puntos

%Entradas
%p (Vector fila 7x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nxa,nya,nza,nxb,nyb,nzb,nLab]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%jacphi (Matriz 1xn con el jacobiano de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en el jacobiano de las ecuaciones de
%restricción
    if 0<p(1)
        xa=q(p(1));
    else
        xa=c(-p(1));
    end
    
    if 0<p(2)
        ya=q(p(2));
    else
        ya=c(-p(2));
    end
    
    if 0<p(3)
        za=q(p(3));
    else
        za=c(-p(3));
    end
    
    if 0<p(4)
        xb=q(p(4));
    else
        xb=c(-p(4));
    end
    
    if 0<p(5)
        yb=q(p(5));
    else
        yb=c(-p(5));
    end
    
    if 0<p(6)
        zb=q(p(6));
    else
        zb=c(-p(6));
    end
    
    if 0<p(7)
        Lab=q(p(7));
    else
        Lab=c(-p(7));
    end
    
%Calcular el jacobiano de las ecuaciones de restricción
    jacphi=zeros(1,n);
    if 0<p(1)
        jacphi(1,p(1))=-2*(xb-xa);
    end
    
    if 0<p(2)
        jacphi(1,p(2))=-2*(yb-ya);
    end
    
    if 0<p(3)
        jacphi(1,p(3))=-2*(zb-za);
    end
    
    if 0<p(4)
        jacphi(1,p(4))=2*(xb-xa);
    end
    
    if 0<p(5)
        jacphi(1,p(5))=2*(yb-ya);
    end
    
    if 0<p(6)
        jacphi(1,p(6))=2*(zb-za);
    end
    
    if 0<p(7)
        jacphi(1,p(7))=-2*Lab;
    end