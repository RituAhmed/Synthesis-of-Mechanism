function d2jacphi=d2jacphi_gear(p,q,dq,d2q,c)
%Función para calcular la segunda derivada temporal del jacobiano de las ecuaciones de restricción relativas a las
%ecuaciones de restricción de un par de engranaje

%Entradas
%p (Vector fila 14x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nx3 ny3 nx4 ny4 nR12 nR34 ndelta npsi ndelta0 npsi0]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%d2q (Vector columna con las aceleraciones de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%d2jacphi (Matriz con la segunda derivada temporal del jacobiano 5xn de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales y constantes que se van a utilizar en la ecuación de restricción
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
    
    if 0<p(11)
        delta=q(p(11));
        ddelta=dq(p(11));
        d2delta=d2q(p(11));
    else
        delta=c(-p(11));
        ddelta=0;
        d2delta=0;
    end
    
    if 0<p(12)
        psi=q(p(12));
        dpsi=dq(p(12));
        d2psi=d2q(p(12));
    else
        psi=c(-p(12));
        dpsi=0;
        d2psi=0;
    end
    
%Extraer las constantes geométricas
    R12=c(-p(9));
    R34=c(-p(10));
    %delta0=c(-p(13));
    %psi0=c(-p(14));
    
%Calcular la derivada temporal del jacobiano de la ecuación de restricción
    d2jacphi=zeros(5,n);
    if 0<p(1)
        d2jacphi(1,p(1))=-2*(d2x2-d2x1);
        d2jacphi(3,p(1))=-(d2x3-d2x1)-(d2x2-d2x1);
        d2jacphi(4,p(1))=(d2x4-d2x3);
    end
    
    if 0<p(2)
        d2jacphi(1,p(2))=-2*(d2y2-d2y1);
        d2jacphi(3,p(2))=-(d2y3-d2y1)-(d2y2-d2y1);
        d2jacphi(4,p(2))=(d2y4-d2y3);
    end
    
    if 0<p(3)
        d2jacphi(1,p(3))=2*(d2x2-d2x1);
        d2jacphi(3,p(3))=(d2x3-d2x1);
    end
    
    if 0<p(4)
        d2jacphi(1,p(4))=2*(d2y2-d2y1);
        d2jacphi(3,p(4))=(d2y3-d2y1);
    end
    
    if 0<p(5)
        d2jacphi(2,p(5))=-2*(d2x4-d2x3);
        d2jacphi(3,p(5))=(d2x2-d2x1);
        d2jacphi(4,p(5))=-(d2x1-d2x3)-(d2x4-d2x3);
    end
    
    if 0<p(6)
        d2jacphi(2,p(6))=-2*(d2y4-d2y3);
        d2jacphi(3,p(6))=(d2y2-d2y1);
        d2jacphi(4,p(6))=-(d2y1-d2y3)-(d2y4-d2y3);
    end
    
    if 0<p(7)
        d2jacphi(2,p(7))=2*(d2x4-d2x3);
        d2jacphi(4,p(7))=(d2x1-d2x3);
    end
    
    if 0<p(8)
        d2jacphi(2,p(8))=2*(d2y4-d2y3);
        d2jacphi(4,p(8))=(d2y1-d2y3);
    end
    
    if 0<p(11)
        %djacphi(3,p(11))=R12*(R12+R34)*cos(delta)*ddelta;
        d2jacphi(3,p(11))=R12*(R12+R34)*(-sin(delta)*ddelta^2+cos(delta)*d2delta);
    end
    
    if 0<p(12)
        %djacphi(4,p(12))=R34*(R12+R34)*cos(psi)*dpsi;
        d2jacphi(4,p(12))=R34*(R12+R34)*(-sin(psi)*dpsi^2+cos(psi)*d2psi);
    end