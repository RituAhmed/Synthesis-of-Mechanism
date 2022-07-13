function djacphi=djacphi_gear(p,q,dq,c)
%Función para calcular la derivada temporal del jacobiano de las ecuaciones de restricción relativas a las
%ecuaciones de restricción de un par de engranaje

%Entradas
%p (Vector fila 14x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nx3 ny3 nx4 ny4 nR12 nR34 ndelta npsi ndelta0 npsi0]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djacphi (Matriz jacobiano 5xn de la ecuación de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales y constantes que se van a utilizar en la ecuación de restricción
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
        x3=q(p(5));
        dx3=dq(p(5));
    else
        x3=c(-p(5));
        dx3=0;
    end
    
    if 0<p(6)
        y3=q(p(6));
        dy3=dq(p(6));
    else
        y3=c(-p(6));
        dy3=0;
    end
    
    if 0<p(7)
        x4=q(p(7));
        dx4=dq(p(7));
    else
        x4=c(-p(7));
        dx4=0;
    end
    
    if 0<p(8)
        y4=q(p(8));
        dy4=dq(p(8));
    else
        y4=c(-p(8));
        dy4=0;
    end
    
    if 0<p(11)
        delta=q(p(11));
        ddelta=dq(p(11));
    else
        delta=c(-p(11));
        ddelta=0;
    end
    
    if 0<p(12)
        psi=q(p(12));
        dpsi=dq(p(12));
    else
        psi=c(-p(12));
        dpsi=0;
    end
    
%Extraer las constantes geométricas
    R12=c(-p(9));
    R34=c(-p(10));
    delta0=c(-p(13));
    psi0=c(-p(14));
    
%Calcular la derivada temporal del jacobiano de la ecuación de restricción
    djacphi=zeros(5,n);
    if 0<p(1)
        djacphi(1,p(1))=-2*(dx2-dx1);
        djacphi(3,p(1))=-(dx3-dx1)-(dx2-dx1);
        djacphi(4,p(1))=(dx4-dx3);
    end
    
    if 0<p(2)
        djacphi(1,p(2))=-2*(dy2-dy1);
        djacphi(3,p(2))=-(dy3-dy1)-(dy2-dy1);
        djacphi(4,p(2))=(dy4-dy3);
    end
    
    if 0<p(3)
        djacphi(1,p(3))=2*(dx2-dx1);
        djacphi(3,p(3))=(dx3-dx1);
    end
    
    if 0<p(4)
        djacphi(1,p(4))=2*(dy2-dy1);
        djacphi(3,p(4))=(dy3-dy1);
    end
    
    if 0<p(5)
        djacphi(2,p(5))=-2*(dx4-dx3);
        djacphi(3,p(5))=(dx2-dx1);
        djacphi(4,p(5))=-(dx1-dx3)-(dx4-dx3);
    end
    
    if 0<p(6)
        djacphi(2,p(6))=-2*(dy4-dy3);
        djacphi(3,p(6))=(dy2-dy1);
        djacphi(4,p(6))=-(dy1-dy3)-(dy4-dy3);
    end
    
    if 0<p(7)
        djacphi(2,p(7))=2*(dx4-dx3);
        djacphi(4,p(7))=(dx1-dx3);
    end
    
    if 0<p(8)
        djacphi(2,p(8))=2*(dy4-dy3);
        djacphi(4,p(8))=(dy1-dy3);
    end
    
    if 0<p(11)
        djacphi(3,p(11))=R12*(R12+R34)*cos(delta)*ddelta;
    end
    
    if 0<p(12)
        djacphi(4,p(12))=R34*(R12+R34)*cos(psi)*dpsi;
    end