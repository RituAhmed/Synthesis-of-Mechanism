function d2jacphi=d2jacphi_rot_abs(p,q,dq,d2q,c)
%Función para calcular la segunda derivada temporal del jacobiano de las ecuaciones de restricción de un segmento de dos puntos con una
%rotación determinada respecto al semieje X positivo

%Entradas
%p (Vector fila 6x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nd ntheta]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%d2q (Vector columna con las aceleraciones de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%d2jacphi (Matriz con la segunda derivada temporal del jacobiano 1xn de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en la ecuación de restricción
    if 0<p(5)
        d=q(p(5));
        dd=dq(p(5));
        d2d=d2q(p(5));
    else
        d=c(-p(5));
        dd=0;
        d2d=0;
    end
    
    if 0<p(6)
        theta=q(p(6));
        dtheta=dq(p(6));
        d2theta=d2q(p(6));
    else
        theta=c(-p(6));
        dtheta=0;
        d2theta=0;
    end
    
%Calcular la derivada temporal del jacobiano de la ecuación de restricción
    d2jacphi=zeros(1,n);
    
    if 0<p(5)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            %djacphi(1,p(5))=-cos(theta)*dtheta;
            d2jacphi(1,p(5))=(sin(theta)*dtheta^2-cos(theta)*d2theta);
        else
            %djacphi(1,p(5))=sin(theta)*dtheta;
            d2jacphi(1,p(5))=(cos(theta)*dtheta^2+sin(theta)*d2theta);
        end
        
    end
    
    if 0<p(6)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            %djacphi(1,p(6))=-(dd*cos(theta)-d*sin(theta)*dtheta);
            d2jacphi(1,p(6))=-(d2d*cos(theta)-dd*sin(theta)*dtheta-dd*sin(theta)*dtheta-d*(cos(theta)*dtheta^2+sin(theta)*d2theta));
        else
            %djacphi(1,p(6))=dd*sin(theta)+d*cos(theta)*dtheta;
            d2jacphi(1,p(6))=d2d*sin(theta)+dd*cos(theta)*dtheta+dd*cos(theta)*dtheta+d*(-sin(theta)*dtheta^2+cos(theta)*d2theta);
        end
        
    end