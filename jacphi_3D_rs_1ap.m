function jacphi=jacphi_3D_rs_1ap(p,q,c)
%Función para calcular el jacobiano de las 3 ecuaciones de restricción que 
%definen un punto adicional sobre un sólido rígido definido con un punto y 
%una base ortogonal de 3 vectores unitarios

%Entradas
%p (Vector fila 18x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z nu3x nu3y nu3z nxa nya nza nxb nyb nzb ncx ncy ncz]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%jacphi (Matriz 3xn con el jacobiano de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
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
    jacphi=zeros(3,n);
    if 0<p(1)
        jacphi(1,p(1))=-cx;
    end
    
    if 0<p(2)
        jacphi(2,p(2))=-cx;
    end
    
    if 0<p(3)
        jacphi(3,p(3))=-cx;
    end
    
    if 0<p(4)
        jacphi(1,p(4))=-cy;
    end
    
    if 0<p(5)
        jacphi(2,p(5))=-cy;
    end
    
    if 0<p(6)
        jacphi(3,p(6))=-cy;
    end
    
    if 0<p(7)
        jacphi(1,p(7))=-cz;
    end
    
    if 0<p(8)
        jacphi(2,p(8))=-cz;
    end
    
    if 0<p(9)
        jacphi(3,p(9))=-cz;
    end
    
    if 0<p(10)
        jacphi(1,p(10))=-1;
    end
    
    if 0<p(11)
        jacphi(2,p(11))=-1;
    end

    if 0<p(12)
        jacphi(3,p(12))=-1;
    end
    
    if 0<p(13)
        jacphi(1,p(13))=1;
    end
    
    if 0<p(14)
        jacphi(2,p(14))=1;
    end

    if 0<p(15)
        jacphi(3,p(15))=1;
    end
    
    if 0<p(16)
        jacphi(1,p(16))=-u1x;
        jacphi(2,p(16))=-u1y;
        jacphi(3,p(16))=-u1z;
    end
    
    if 0<p(17)
        jacphi(1,p(17))=-u2x;
        jacphi(2,p(17))=-u2y;
        jacphi(3,p(17))=-u2z;
    end
    
    if 0<p(18)
        jacphi(1,p(18))=-u3x;
        jacphi(2,p(18))=-u3y;
        jacphi(3,p(18))=-u3z;
    end