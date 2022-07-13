function d2jacphi=d2jacphi_P(p,q,dq,d2q,c)
%Función para calcular la segunda derivada del jacobiano de las ecuaciones
%de restricción que describen un par P

%Entradas
%p (Vector fila 11x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nx3 ny3 nx4 ny4 nL12 nL34 nbeta]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%d2q (Vector columna con las aceleraciones de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%d2jacphi (Matriz 2xn con la segunda derivada temporal del jacobiano de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en el jacobiano de las ecuaciones de
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
    
    if 0<p(7)
        d2x4=d2q(p(7));
    else
        d2x4=0;
    end
    
    if 0<p(8)
        d2y4=d2q(p(8));
    else
        d2y4=0;
    end
    
%Calcular la derivada segunda del jacobiano de las ecuaciones de restricción
    d2jacphi=zeros(2,n);
    if 0<p(1)
        d2jacphi(1,p(1))=-(d2y3-d2y1)+(d2y2-d2y1);
        d2jacphi(2,p(1))=-(d2x3-d2x4);
    end
    
    if 0<p(2)
        d2jacphi(1,p(2))=-(d2x2-d2x1)+(d2x3-d2x1);
        d2jacphi(2,p(2))=-(d2y3-d2y4);
    end
    
    if 0<p(3)
        d2jacphi(1,p(3))=(d2y3-d2y1);
        d2jacphi(2,p(3))=(d2x3-d2x4);
    end
    
    if 0<p(4)
        d2jacphi(1,p(4))=-(d2x3-d2x1);
        d2jacphi(2,p(4))=(d2y3-d2y4);
    end
    
    if 0<p(5)
        d2jacphi(1,p(5))=-(d2y2-d2y1);
        d2jacphi(2,p(5))=(d2x2-d2x1);
    end
    
    if 0<p(6)
        d2jacphi(1,p(6))=(d2x2-d2x1);
        d2jacphi(2,p(6))=(d2y2-d2y1);
    end
    
    if 0<p(7)
        d2jacphi(2,p(7))=-(d2x2-d2x1);
    end
    
    if 0<p(8)
        d2jacphi(2,p(8))=-(d2y2-d2y1);
    end