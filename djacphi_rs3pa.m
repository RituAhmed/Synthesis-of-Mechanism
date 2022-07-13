function djacphi=djacphi_rs3pa(p,q,dq,c)
%Funci�n para calcular la derivada temporal del jacobiano de las 3 ecuaciones
%de restricci�n de s�lido r�gido definido entre 3 puntos alineados

%Entradas
%p (Vector fila 9x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nx3 ny3 nL12 nL13 nL23]. Si la posici�n es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo �ndice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%djacphi (Matriz 3xn con la derivada temporal del jacobiano de las ecuaciones de restricci�n)

%Determinar el n�mero de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales y constantes que se van a utilizar en el jacobiano de las ecuaciones de
%restricci�n
    if 0<p(1)
        dx1=dq(p(1));
    else
        dx1=0;
    end
    
    if 0<p(2)
        dy1=dq(p(2));
    else
        dy1=0;
    end

    if 0<p(3)
        dx2=dq(p(3));
    else
        dx2=0;
    end
    
    if 0<p(4)
        dy2=dq(p(4));
    else
        dy2=0;
    end
    
    if 0<p(5)
        dx3=dq(p(5));
    else
        dx3=0;
    end
    
    if 0<p(6)
        dy3=dq(p(6));
    else
        dy3=0;
    end
    
%Extraer las constantes geom�tricas
    %L12=c(-p(7));
    %L13=c(-p(8));
    
%Calcular el jacobiano de las ecuaciones de restricci�n
    djacphi=zeros(3,n);
    if 0<p(1)
        djacphi(1,p(1))=-2*(dx2-dx1);
    end
    
    if 0<p(2)
        djacphi(1,p(2))=-2*(dy2-dy1);
    end
    
    if 0<p(3)
        djacphi(1,p(3))=2*(dx2-dx1);
    end
    
    if 0<p(4)
        djacphi(1,p(4))=2*(dy2-dy1);
    end
