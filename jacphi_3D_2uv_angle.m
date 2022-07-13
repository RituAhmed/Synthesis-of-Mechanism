function jacphi=jacphi_3D_2uv_angle(p,q,c)
%Función para calcular el jacobiano de la ecuacion de restricción que
%define el ángulo que forman 2 vectores unitarios

%Entradas
%p (Vector fila 7x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z theta]. Si la posición es negativa, quiere decir que
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
        theta=q(p(7));
    else
        theta=c(-p(7));
    end
    
%Calcular el jacobiano de las ecuaciones de restricción
    jacphi=zeros(1,n);
    if 0<p(1)
        jacphi(1,p(1))=u2x;
    end
    
    if 0<p(2)
        jacphi(1,p(2))=u2y;
    end
    
    if 0<p(3)
        jacphi(1,p(3))=u2z;
    end
    
    if 0<p(4)
        jacphi(1,p(4))=u1x;
    end
    
    if 0<p(5)
        jacphi(1,p(5))=u1y;
    end
    
    if 0<p(6)
        jacphi(1,p(6))=u1z;
    end
    
    if 0<p(7)
        jacphi(1,p(7))=sin(theta);
    end
