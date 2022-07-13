function djacphi=djacphi_3D_1uv_basis_angle(p,q,dq,c)
%Función para calcular la derivada temporal de las 2 ecuaciones de restricción que
%definen la orientación de un vector unitario(3) respecto a una base plana
%ortogonal de 2 vectores unitarios (1 y 2)

%Entradas
%p (Vector fila 10x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z nu3x nu3y nu3z ntheta]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djacphi (Matriz 2xn con la derivada temporal del jacobiano de las ecuaciones de restricción)

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
        du3x=dq(p(7));
    else
        du3x=0;
    end
    
    if 0<p(8)
        du3y=dq(p(8));
    else
        du3y=0;
    end
    
    if 0<p(9)
        du3z=dq(p(9));
    else
        du3z=0;
    end
    
    if 0<p(10)
        theta=q(p(10));
        dtheta=dq(p(10));
    else
        theta=c(-p(10));
        dtheta=0;
    end
    
%Calcular la derivada temporal del jacobiano de las ecuaciones de restricción
    djacphi=zeros(2,n);
    if 0<p(1)
        djacphi(1,p(1))=du3x;
    end
    
    if 0<p(2)
        djacphi(1,p(2))=du3y;
    end
    
    if 0<p(3)
        djacphi(1,p(3))=du3z;
    end
    
    if 0<p(4)
        djacphi(2,p(4))=du3x;
    end
    
    if 0<p(5)
        djacphi(2,p(5))=du3y;
    end
    
    if 0<p(6)
        djacphi(2,p(6))=du3z;
    end
    
    if 0<p(7)
        djacphi(1,p(7))=du1x;
        djacphi(2,p(7))=du2x;
    end
    
    if 0<p(8)
        djacphi(1,p(8))=du1y;
        djacphi(2,p(8))=du2y;
    end
    
    if 0<p(9)
        djacphi(1,p(9))=du1z;
        djacphi(2,p(9))=du2z;
    end
    
    if 0<p(10)
        djacphi(1,p(10))=cos(theta)*dtheta;
        djacphi(2,p(10))=sin(theta)*dtheta;
    end