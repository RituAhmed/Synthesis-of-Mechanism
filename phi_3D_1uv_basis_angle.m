function phi=phi_3D_1uv_basis_angle(p,q,c)
%Función para calcular las componentes del vector fi relativas a las 2
%ecuaciones de restricción que definen la orientación de un vector unitario
%(3) respecto a una base plana ortogonal de 2 vectores unitarios (1 y 2) 

%Entradas
%p (Vector fila 10x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z nu3x nu3y nu3z ntheta]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%phi (Vector columna 2x1 con los valores de las ecuaciones de restricción)
    
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
    
    if 0<p(10)
        theta=q(p(10));
    else
        theta=c(-p(10));
    end
    
%Calcular el valor del miembro izquierdo de las ecuaciones de restricción
    phi=zeros(2,1);
    phi(1)=u1x*u3x+u1y*u3y+u1z*u3z-cos(theta);
    phi(2)=u2x*u3x+u2y*u3y+u2z*u3z-sin(theta);
