function jacphi=jacphi_3D_1p1uv_alin(p,q,c)
%Función para calcular el jacobiano de las 3 ecuaciones de restricción que
%definen que un punto está alineado con un vector unitario

%Entradas
%p (Vector fila 10x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nux nuy nuz nxa nya nza nxb nyb nzb nd]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%jacphi (Matriz 3xn con el jacobiano de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en el jacobiano de las ecuaciones de
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
    
    if 0<p(10)
        d=q(p(10));
    else
        d=c(-p(10));
    end
    
%Calcular el jacobiano de las ecuaciones de restricción
    jacphi=zeros(3,n);
    if 0<p(1)
        jacphi(1,p(1))=-d;
    end
    
    if 0<p(2)
        jacphi(2,p(2))=-d;
    end
    
    if 0<p(3)
        jacphi(3,p(3))=-d;
    end
    
    if 0<p(4)
        jacphi(1,p(4))=-1;
    end
    
    if 0<p(5)
        jacphi(2,p(5))=-1;
    end
    
    if 0<p(6)
        jacphi(3,p(6))=-1;
    end
    
    if 0<p(7)
        jacphi(1,p(7))=1;
    end
    
    if 0<p(8)
        jacphi(2,p(8))=1;
    end
    
    if 0<p(9)
        jacphi(3,p(9))=1;
    end
    
    if 0<p(10)
        jacphi(1,p(10))=-ux;
        jacphi(2,p(10))=-uy;
        jacphi(3,p(10))=-uz;
    end