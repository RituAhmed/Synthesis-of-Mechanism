function djacphi=djacphi_3D_rs_2p(p,q,dq,c)
%Función para calcular la derivada temporal de la ecuacion de restricción que
%define la distancia constante entre dos puntos

%Entradas
%p (Vector fila 7x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nxa,nya,nza,nxb,nyb,nzb,nLab]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djacphi (Matriz 1xn con la derivada temporal del jacobiano de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en el jacobiano de las ecuaciones de
%restricción
    if 0<p(1)
        dxa=dq(p(1));
    else
        dxa=0;
    end
    
    if 0<p(2)
        dya=dq(p(2));
    else
        dya=0;
    end
    
    if 0<p(3)
        dza=dq(p(3));
    else
        dza=0;
    end
    
    if 0<p(4)
        dxb=dq(p(4));
    else
        dxb=0;
    end
    
    if 0<p(5)
        dyb=dq(p(5));
    else
        dyb=0;
    end
    
    if 0<p(6)
        dzb=dq(p(6));
    else
        dzb=0;
    end
    
    if 0<p(7)
        dLab=dq(p(7));
    else
        dLab=0;
    end
    
%Calcular la derivada temporal del jacobiano de las ecuaciones de restricción
    djacphi=zeros(1,n);
    if 0<p(1)
        djacphi(1,p(1))=-2*(dxb-dxa);
    end
    
    if 0<p(2)
        djacphi(1,p(2))=-2*(dyb-dya);
    end
    
    if 0<p(3)
        djacphi(1,p(3))=-2*(dzb-dza);        
    end
    
    if 0<p(4)
        djacphi(1,p(4))=2*(dxb-dxa);        
    end
    
    if 0<p(5)
        djacphi(1,p(5))=2*(dyb-dya);        
    end
    
    if 0<p(6)
        djacphi(1,p(6))=2*(dzb-dza);        
    end
    
    if 0<p(7)
        djacphi(1,p(7))=-2*dLab;        
    end