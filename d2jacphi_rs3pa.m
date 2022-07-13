function d2jacphi=d2jacphi_rs3pa(p,q,dq,d2q,c)
%Función para calcular la segunda derivada temporal del jacobiano de las 3 ecuaciones
%de restricción de sólido rígido definido entre 3 puntos alineados

%Entradas
%p (Vector fila 9x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nx3 ny3 nL12 nL13 nL23]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%d2q (Vector columna con las aceleraciones de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%d2jacphi (Matriz 3xn con la segunda derivada temporal del jacobiano de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales y constantes que se van a utilizar en el jacobiano de las ecuaciones de
%restricción
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
    
%Extraer las constantes geométricas
    %L12=c(-p(7));
    %L13=c(-p(8));
    
%Calcular la segunda derivada del jacobiano de las ecuaciones de restricción
    d2jacphi=zeros(3,n);
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
