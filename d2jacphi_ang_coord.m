function d2jacphi=d2jacphi_ang_coord(p,q,dq,d2q,c)
%Función para calcular la segunda derivada temporal del jacobiano de la ecuacion de restricción que define una coordenada angular

%Entradas
%p (Vector fila 9x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nx3 ny3 nL12 nL13 ntheta]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%d2q (Vector columna con las aceleraciones de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%d2jacphi (Vector fila con la segunda derivada temporal de la fila del jacobiano)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en la ecuación de restricción
    if 0<p(1)
        d2x1=d2q(p(1));
    else
        d2x1=0;
    end
    
    if 0<p(2)
        d2y1=d2q(p(2));
    else
        d2y1=0;
    end

    if 0<p(3)
        d2x2=d2q(p(3));
    else
        d2x2=0;
    end
    
    if 0<p(4)
        d2y2=d2q(p(4));
    else
        d2y2=0;
    end
    
    if 0<p(5)
        d2x3=d2q(p(5));
    else
        d2x3=0;
    end
    
    if 0<p(6)
        d2y3=d2q(p(6));
    else
        d2y3=0;
    end
    
    if 0<p(7)
        L12=q(p(7));
    else
        L12=c(-p(7));
    end
    
    if 0<p(8)
        L13=q(p(8));
    else
        L13=c(-p(8));
    end
    
    if 0<p(9)
        theta=q(p(9));
        dtheta=dq(p(9));
        d2theta=d2q(p(9));
    else
        theta=c(-p(9));
        dtheta=0;
        d2theta=0;
    end
    
%Calcular la derivada temporal del jacobiano de la ecuación de restricción
    d2jacphi=zeros(1,n);
    if 0<p(1)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            d2jacphi(1,p(1))=-(d2y3-d2y1)+(d2y2-d2y1);
        else
            d2jacphi(1,p(1))=-(d2x3-d2x1)-(d2x2-d2x1);
        end
        
    end
    
    if 0<p(2)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            d2jacphi(1,p(2))=-(d2x2-d2x1)+(d2x3-d2x1);
        else
            d2jacphi(1,p(2))=-(d2y3-d2y1)-(d2y2-d2y1);
        end

    end
    
    if 0<p(3)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            d2jacphi(1,p(3))=d2y3-d2y1;
        else
            d2jacphi(1,p(3))=d2x3-d2x1;
        end
        
    end
    
    if 0<p(4)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            d2jacphi(1,p(4))=-(d2x3-d2x1);
        else
            d2jacphi(1,p(4))=d2y3-d2y1;
        end
        
    end
    
    if 0<p(5)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            d2jacphi(1,p(5))=-(d2y2-d2y1);
        else
            d2jacphi(1,p(5))=d2x2-d2x1;
        end
        
    end
    
    if 0<p(6)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            d2jacphi(1,p(6))=d2x2-d2x1;
        else
            d2jacphi(1,p(6))=d2y2-d2y1;
        end
        
    end
    
    if 0<p(9)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            %djacphi(1,p(9))=L12*L13*sin(theta)*dtheta;
            d2jacphi(1,p(9))=L12*L13*(cos(theta)*dtheta^2+sin(theta)*d2theta);
        else
            %djacphi(1,p(9))=L12*L13*cos(theta)*dtheta;
            d2jacphi(1,p(9))=L12*L13*(-sin(theta)*dtheta^2+cos(theta)*d2theta);
        end
        
    end