function phi=phi_3D_rs_2p(p,q,c)
%Funci�n para calcular las componentes del vector fi relativas a la
%ecuacion de restricci�n que define el �ngulo que forman 2 vectores unitarios

%Entradas
%p (Vector fila 7x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nxa,nya,nza,nxb,nyb,nzb,nLab]. Si la posici�n es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo �ndice pero positivo)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%phi (Vector columna 1x1 con los valores de las ecuaciones de restricci�n)
    
%%Extraer las coordenadas globales que se van a utilizar en las ecuaciones de
%restricci�n
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
    
%Calcular el valor del miembro izquierdo de las ecuaciones de restricci�n
    phi=zeros(1,1);
    phi(1)=(xb-xa)^2+(yb-ya)^2+(zb-za)^2-Lab^2;