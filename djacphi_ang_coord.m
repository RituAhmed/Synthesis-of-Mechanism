function djacphi=djacphi_ang_coord(p,q,dq,c)
%Función para calcular la derivada temporal del jacobiano de la ecuacion de restricción que define una coordenada angular

%Entradas
%p (Vector fila 9x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx1 ny1 nx2 ny2 nx3 ny3 nL12 nL13 ntheta]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djacphi (Vector fila con el gradiente de la ecuación de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en la ecuación de restricción
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
        L12=q(p(7));
        dL12=dq(p(7));
    else
        L12=c(-p(7));
        dL12=0;
    end
    
    if 0<p(8)
        L13=q(p(8));
        dL13=dq(p(8));
    else
        L13=c(-p(8));
        dL13=0;
    end
    
    if 0<p(9)
        theta=q(p(9));
        dtheta=dq(p(9));
    else
        theta=c(-p(9));
        dtheta=0;
    end
    
%Calcular la derivada temporal del jacobiano de la ecuación de restricción
    djacphi=zeros(1,n);
    if 0<p(1)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            djacphi(1,p(1))=-(dy3-dy1)+(dy2-dy1);
        else
            djacphi(1,p(1))=-(dx3-dx1)-(dx2-dx1);
        end
        
    end
    
    if 0<p(2)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            djacphi(1,p(2))=-(dx2-dx1)+(dx3-dx1);
        else
            djacphi(1,p(2))=-(dy3-dy1)-(dy2-dy1);
        end

    end
    
    if 0<p(3)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            djacphi(1,p(3))=dy3-dy1;
        else
            djacphi(1,p(3))=dx3-dx1;
        end
        
    end
    
    if 0<p(4)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            djacphi(1,p(4))=-(dx3-dx1);
        else
            djacphi(1,p(4))=dy3-dy1;
        end
        
    end
    
    if 0<p(5)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            djacphi(1,p(5))=-(dy2-dy1);
        else
            djacphi(1,p(5))=dx2-dx1;
        end
        
    end
    
    if 0<p(6)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            djacphi(1,p(6))=dx2-dx1;
        else
            djacphi(1,p(6))=dy2-dy1;
        end
        
    end
    
    if 0<p(9)
        if abs(sin(theta))<0.5*sqrt(2) %Si esta cerca del eje horizontal
            djacphi(1,p(9))=L12*L13*sin(theta)*dtheta;
        else
            djacphi(1,p(9))=L12*L13*cos(theta)*dtheta;
        end
        
    end