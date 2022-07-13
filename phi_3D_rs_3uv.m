function phi=phi_3D_rs_3uv(p,q,c)
%Función para calcular las componentes del vector fi relativas a las 6
%ecuaciones de restricción que definen un sólido rígido con una base ortogonal de 3 vectores
%unitarios

%Entradas
%p (Vector fila 9x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z nu3x nu3y nu3z]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%phi (Vector columna 6x1 con los valores de las ecuaciones de restricción)
    
%%Extraer las coordenadas globales que se van a utilizar en las ecuaciones de
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
    
%Calcular el valor del miembro izquierdo de las ecuaciones de restricción
    phi=zeros(6,1);
    phi(1)=u1x^2+u1y^2+u1z^2-1;
    phi(2)=u2x^2+u2y^2+u2z^2-1;
    phi(3)=u3x^2+u3y^2+u3z^2-1;
    phi(4)=u1x*u2x+u1y*u2y+u1z*u2z;
    phi(5)=u1x*u3x+u1y*u3y+u1z*u3z;
    phi(6)=u2x*u3x+u2y*u3y+u2z*u3z;