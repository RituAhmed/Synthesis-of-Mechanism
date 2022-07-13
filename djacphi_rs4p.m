function d2jacphi=d2jacphi_rs4p(p,q,dq,d2q,c)
%Funci�n para calcular la segunda derivada temporal jacobiano de las 5 ecuaciones
%de restricci�n de s�lido r�gido definido entre 4 puntos (1, 2 y 3 no
%alineados)

%Entradas
%p (Vector fila 13x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nx3 ny3 nx4 ny4 nL12 nL13 nL23 lambda4 mu4]. Si la posici�n es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo �ndice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%d2q (Vector columna con las aceleraciones de las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%d2jacphi (Matriz 5xn con la segunda derivada temporal del jacobiano de las ecuaciones de restricci�n)

%Determinar el n�mero de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales y constantes que se van a utilizar en el jacobiano de las ecuaciones de
%restricci�n
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
    
%Extraer las constantes geom�tricas
    %lambda4=c(-p(12));
    %mu4=c(-p(13));
    
%Calcular la segunda derivada temporal del jacobiano de las ecuaciones de restricci�n
    d2jacphi=zeros(5,n);
    if 0<p(1)
        d2jacphi(1,p(1))=-2*(d2x2-d2x1);
        d2jacphi(2,p(1))=-2*(d2x3-d2x1);
    end
    
    if 0<p(2)
        d2jacphi(1,p(2))=-2*(d2y2-d2y1);
        d2jacphi(2,p(2))=-2*(d2y3-d2y1);
    end
    
    if 0<p(3)
        d2jacphi(1,p(3))=2*(d2x2-d2x1);
        d2jacphi(3,p(3))=-2*(d2x3-d2x2);
    end
    
    if 0<p(4)
        d2jacphi(1,p(4))=2*(d2y2-d2y1);
        d2jacphi(3,p(4))=-2*(d2y3-d2y2);
    end
    
    if 0<p(5)
        d2jacphi(2,p(5))=2*(d2x3-d2x1);
        d2jacphi(3,p(5))=2*(d2x3-d2x2);
    end
    
    if 0<p(6)
        d2jacphi(2,p(6))=2*(d2y3-d2y1);
        d2jacphi(3,p(6))=2*(d2y3-d2y2);
    end