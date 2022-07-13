function phi=phi_3D_rs_1ap(p,q,c)
%Función para calcular las componentes del vector fi relativas a las 3
%ecuaciones de restricción que definen un punto adicional sobre un sólido 
%rígido definido con un punto y una base ortogonal de 3 vectores unitarios

%Entradas
%p (Vector fila 18x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z nu3x nu3y nu3z nxa nya nza nxb nyb nzb ncx ncy ncz]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%phi (Vector columna 3x1 con los valores de las ecuaciones de restricción)
    
%Extraer las coordenadas globales que se van a utilizar en las ecuaciones de
%restricción
    if 0<p(1)
        u1x=q(p(1));
    else
        u1x=c(-p(1));
    end
    
    if 0<p(2)
        u1y=q(p(2));
    else
        u1y=c(-p(2));
    end
    
    if 0<p(3)
        u1z=q(p(3));
    else
        u1z=c(-p(3));
    end
    
    if 0<p(4)
        u2x=q(p(4));
    else
        u2x=c(-p(4));
    end
    
    if 0<p(5)
        u2y=q(p(5));
    else
        u2y=c(-p(5));
    end
    
    if 0<p(6)
        u2z=q(p(6));
    else
        u2z=c(-p(6));
    end
    
    if 0<p(7)
        u3x=q(p(7));
    else
        u3x=c(-p(7));
    end
    
    if 0<p(8)
        u3y=q(p(8));
    else
        u3y=c(-p(8));
    end
    
    if 0<p(9)
        u3z=q(p(9));
    else
        u3z=c(-p(9));
    end
    
    if 0<p(10)
        xa=q(p(10));
    else
        xa=c(-p(10));
    end
    
    if 0<p(11)
        ya=q(p(11));
    else
        ya=c(-p(11));
    end
    
    if 0<p(12)
        za=q(p(12));
    else
        za=c(-p(12));
    end
    
    if 0<p(13)
        xb=q(p(13));
    else
        xb=c(-p(13));
    end
    
    if 0<p(14)
        yb=q(p(14));
    else
        yb=c(-p(14));
    end
    
    if 0<p(15)
        zb=q(p(15));
    else
        zb=c(-p(15));
    end
    
    if 0<p(16)
        cx=q(p(16));
    else
        cx=c(-p(16));
    end
    
    if 0<p(17)
        cy=q(p(17));
    else
        cy=c(-p(17));
    end
    
    if 0<p(18)
        cz=q(p(18));
    else
        cz=c(-p(18));
    end
    
%Calcular el valor del miembro izquierdo de las ecuaciones de restricción
    phi=zeros(3,1);
    phi(1)=xb-xa-cx*u1x-cy*u2x-cz*u3x;
    phi(2)=yb-ya-cx*u1y-cy*u2y-cz*u3y;
    phi(3)=zb-za-cx*u1z-cy*u2z-cz*u3z;
