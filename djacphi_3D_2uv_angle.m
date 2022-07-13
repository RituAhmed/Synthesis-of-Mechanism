function djacphi=djacphi_3D_2uv_angle(p,q,dq,c)
%Función para calcular la derivada temporal de la ecuacion de restricción que
%define el ángulo que forman 2 vectores unitarios

%Entradas
%p (Vector fila 7x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z theta]. Si la posición es negativa, quiere decir que
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
        du1x=dq(p(1));
    else
        du1x=0;
    end
    
    if 0<p(2)
        du1y=dq(p(2));
    else
        du1y=0;
    end
    
    if 0<p(3)
        du1z=dq(p(3));
    else
        du1z=0;
    end
    
    if 0<p(4)
        du2x=dq(p(4));
    else
        du2x=0;
    end
    
    if 0<p(5)
        du2y=dq(p(5));
    else
        du2y=0;
    end
    
    if 0<p(6)
        du2z=dq(p(6));
    else
        du2z=0;
    end
    
    if 0<p(7)
        theta=q(p(7));
        dtheta=dq(p(7));
    else
        theta=c(-p(7));
        dtheta=0;
    end
    
%Calcular la derivada temporal del jacobiano de las ecuaciones de restricción
    djacphi=zeros(1,n);
    if 0<p(1)
        djacphi(1,p(1))=du2x;
    end
    
    if 0<p(2)
        djacphi(1,p(2))=du2y;
    end
    
    if 0<p(3)
        djacphi(1,p(3))=du2z;        
    end
    
    if 0<p(4)
        djacphi(1,p(4))=du1x;        
    end
    
    if 0<p(5)
        djacphi(1,p(5))=du1y;        
    end
    
    if 0<p(6)
        djacphi(1,p(6))=du1z;        
    end
    
    if 0<p(7)
        djacphi(1,p(7))=cos(theta)*dtheta;        
    end