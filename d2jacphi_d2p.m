function d2jacphi=d2jacphi_d2p(p,q,dq,d2q,c)
%Funcion para calcular la segunda derivada temporal del jacobiano de las ecuaciones
%de restriccion de distancia entre 2 puntos

%Entradas
%p (Vector fila 5x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nd]. Si la posicion es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%d2q (Vector columna con las aceleraciones de las coordenadas globales)
%c (Vector fila con las constantes geometricas)

%Salidas
%d2jacphi (Vector fila con la segunda derivada temporal de la fila del jacobiano)

%Determinar el numero de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales y constantes que se van a utilizar en la ecuacion de restricción
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
        d2d=d2q(p(5));
    else
        d2d=0;
    end
    
%Calcular la segunda derivada del jacobiano de la ecuacion de restriccion
    d2jacphi=zeros(1,n);
    if 0<p(1)
        d2jacphi(1,p(1))=-2*(d2x2-d2x1);
    end
    
    if 0<p(2)
        d2jacphi(1,p(2))=-2*(d2y2-d2y1);
    end
    
    if 0<p(3)
        d2jacphi(1,p(3))=2*(d2x2-d2x1);
    end
    
    if 0<p(4)
        d2jacphi(1,p(4))=2*(d2y2-d2y1);
    end

    if 0<p(5)
        d2jacphi(1,p(5))=-2*d2d;
    end