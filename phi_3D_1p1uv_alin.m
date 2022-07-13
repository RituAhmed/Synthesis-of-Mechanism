function phi=phi_3D_1p1uv_alin(p,q,c)
%Función para calcular las componentes del vector fi relativas a las 3
%ecuaciones de restricción que definen que un punto está alineado con un vector unitario

%Entradas
%p (Vector fila 10x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nux nuy nuz nxa nya nza nxb nyb nzb nd]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%phi (Vector columna 3x1 con los valores de las ecuaciones de restricción)
    
%%Extraer las coordenadas globales que se van a utilizar en las ecuaciones de
%restricción
    if 0<p(1)
        ux=q(p(1));
    else
        ux=c(-p(1));
    end
    
    if 0<p(2)
        uy=q(p(2));
    else
        uy=c(-p(2));
    end
    
    if 0<p(3)
        uz=q(p(3));
    else
        uz=c(-p(3));
    end
    
    if 0<p(4)
        xa=q(p(4));
    else
        xa=c(-p(4));
    end
    
    if 0<p(5)
        ya=q(p(5));
    else
        ya=c(-p(5));
    end
    
    if 0<p(6)
        za=q(p(6));
    else
        za=c(-p(6));
    end
    
    if 0<p(7)
        xb=q(p(7));
    else
        xb=c(-p(7));
    end
    
    if 0<p(8)
        yb=q(p(8));
    else
        yb=c(-p(8));
    end
    
    if 0<p(9)
        zb=q(p(9));
    else
        zb=c(-p(9));
    end
    
    if 0<p(10)
        d=q(p(10));
    else
        d=c(-p(10));
    end
    
%Calcular el valor del miembro izquierdo de las ecuaciones de restricción
    phi=zeros(3,1);
    phi(1)=xb-xa-d*ux;
    phi(2)=yb-ya-d*uy;
    phi(3)=zb-za-d*uz;
