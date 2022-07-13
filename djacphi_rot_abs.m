function djacphi=djacphi_rot_abs(p,q,dq,c)
%Función para calcular la derivada temporal del jacobiano de las ecuaciones de restricción de un segmento de dos puntos con una
%rotación determinada respecto al semieje X positivo

%Entradas
%p (Vector fila 6x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nd ntheta]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djacphi (Vector fila con el gradiente de la ecuación de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en la ecuación de restricción
    if 0<p(1)
        x1=q(p(1));
        dx1=dq(p(1));
    else
        x1=c(-p(1));
        dx1=0;
    end
    
    if 0<p(2)
        y1=q(p(2));
        dy1=dq(p(2));
    else
        y1=c(-p(2));
        dy1=0;
    end

    if 0<p(3)
        x2=q(p(3));
        dx2=dq(p(3));
    else
        x2=c(-p(3));
        dx2=0;
    end
    
    if 0<p(4)
        y2=q(p(4));
        dy2=dq(p(4));
    else
        y2=c(-p(4));
        dy2=0;
    end
    
    if 0<p(5)
        d=q(p(5));
        dd=dq(p(5));
    else
        d=c(-p(5));
        dd=0;
    end
    
    if 0<p(6)
        theta=q(p(6));
        dtheta=dq(p(6));
    else
        theta=c(-p(6));
        dtheta=0;
    end
    
%Calcular la derivada temporal del jacobiano de la ecuación de restricción
    djacphi=zeros(1,n);
    
    if 0<p(5)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            djacphi(1,p(5))=-cos(theta)*dtheta;
        else
            djacphi(1,p(5))=sin(theta)*dtheta;
        end
        
    end
    
    if 0<p(6)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            djacphi(1,p(6))=-(dd*cos(theta)-d*sin(theta)*dtheta);
        else
            djacphi(1,p(6))=dd*sin(theta)+d*cos(theta)*dtheta;
        end
        
    end