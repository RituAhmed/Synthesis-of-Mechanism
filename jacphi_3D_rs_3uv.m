function jacphi=jacphi_3D_rs_3uv(p,q,c)
%Función para calcular el jacobiano de las 6 ecuaciones de restricción que 
%definen un sólido rígido con una base ortogonal de 3 vectores unitarios

%Entradas
%p (Vector fila 9x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z nu3x nu3y nu3z]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%jacphi (Matriz 6xn con el jacobiano de las ecuaciones de restricción)

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
    
%Calcular el jacobiano de las ecuaciones de restricción
    jacphi=zeros(6,n);
    if 0<p(1)
        jacphi(1,p(1))=2*u1x;
        jacphi(4,p(1))=u2x;
        jacphi(5,p(1))=u3x;
    end
    
    if 0<p(2)
        jacphi(1,p(2))=2*u1y;
        jacphi(4,p(2))=u2y;
        jacphi(5,p(2))=u3y;
    end
    
    if 0<p(3)
        jacphi(1,p(3))=2*u1z;
        jacphi(4,p(3))=u2z;
        jacphi(5,p(3))=u3z;
    end
    
    if 0<p(4)
        jacphi(2,p(4))=2*u2x;
        jacphi(4,p(4))=u1x;
        jacphi(6,p(4))=u3x;
    end
    
    if 0<p(5)
        jacphi(2,p(5))=2*u2y;
        jacphi(4,p(5))=u1y;
        jacphi(6,p(5))=u3y;
    end
    
    if 0<p(6)
        jacphi(2,p(6))=2*u2z;
        jacphi(4,p(6))=u1z;
        jacphi(6,p(6))=u3z;
    end
    
    if 0<p(7)
        jacphi(3,p(7))=2*u3x;
        jacphi(5,p(7))=u1x;
        jacphi(6,p(7))=u2x;
    end
    
    if 0<p(8)
        jacphi(3,p(8))=2*u3y;
        jacphi(5,p(8))=u1y;
        jacphi(6,p(8))=u2y;
    end
    
    if 0<p(9)
        jacphi(3,p(9))=2*u3z;
        jacphi(5,p(9))=u1z;
        jacphi(6,p(9))=u2z;
    end