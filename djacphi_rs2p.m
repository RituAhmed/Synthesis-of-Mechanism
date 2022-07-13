function djacphi=djacphi_rs2p(p,q,dq,c)
%Funci�n para calcular la derivada temporal del jacobiano de las ecuaciones
%de restricci�n de un s�lido r�gido con 2 puntos

%Entradas
%p (Vector fila 5x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nL12]. Si la posici�n es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo �ndice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%djacphi (Vector fila con la derivada temporal del jacobiano correspondiente a la ecuaci�n de restricci�n)

%Determinar el n�mero de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales y constantes que se van a utilizar en la ecuaci�n de restricci�n
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
    
%Extraer las constantes geom�tricas
    %L12=c(-p(5));
    
%Calcular la derivada temporal del jacobiano de la ecuaci�n de restricci�n
    djacphi=zeros(1,n);
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
