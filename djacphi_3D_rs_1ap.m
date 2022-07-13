function djacphi=djacphi_3D_rs_1ap(p,q,dq,c)
%Función para calcular la derivada temporal del jacobiano de las 3 ecuaciones
%de restricción que definen un punto adicional sobre un sólido rígido definido con un punto y 
%una base ortogonal de 3 vectores unitarios


%Entradas
%p (Vector fila 18x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z nu3x nu3y nu3z nxa nya nza nxb nyb nzb ncx ncy ncz]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djacphi (Matriz 3xn con la derivada temporal del jacobiano de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en las ecuaciones de
%restricción
    if 0<p(1)
        u1x=q(p(1));
        du1x=dq(p(1));
    else
        u1x=c(-p(1));
        du1x=0;
    end
    
    if 0<p(2)
        u1y=q(p(2));
        du1y=dq(p(2));
    else
        u1y=c(-p(2));
        du1y=0;
    end
    
    if 0<p(3)
        u1z=q(p(3));
        du1z=dq(p(3));
    else
        u1z=c(-p(3));
        du1z=0;
    end
    
    if 0<p(4)
        u2x=q(p(4));
        du2x=dq(p(4));
    else
        u2x=c(-p(4));
        du2x=0;
    end
    
    if 0<p(5)
        u2y=q(p(5));
        du2y=dq(p(5));
    else
        u2y=c(-p(5));
        du2y=0;
    end
    
    if 0<p(6)
        u2z=q(p(6));
        du2z=dq(p(6));
    else
        u2z=c(-p(6));
        du2z=0;
    end
    
    if 0<p(7)
        u3x=q(p(7));
        du3x=dq(p(7));
    else
        u3x=c(-p(7));
        du3x=0;
    end
    
    if 0<p(8)
        u3y=q(p(8));
        du3y=dq(p(8));
    else
        u3y=c(-p(8));
        du3y=0;
    end
    
    if 0<p(9)
        u3z=q(p(9));
        du3z=dq(p(9));
    else
        u3z=c(-p(9));
        du3z=0;
    end
    
    if 0<p(16)
        cx=q(p(16));
        dcx=dq(p(16));
    else
        cx=c(-p(16));
        dcx=0;
    end
    
    if 0<p(17)
        cy=q(p(17));
        dcy=dq(p(17));
    else
        cy=c(-p(17));
        dcy=0;
    end
    
    if 0<p(18)
        cz=q(p(18));
        dcz=dq(p(18));
    else
        cz=c(-p(18));
        dcz=0;
    end    
    
%Calcular la derivada temporal del jacobiano de las ecuaciones de restricción
    djacphi=zeros(3,n);
    if 0<p(1)
        djacphi(1,p(1))=-dcx;
    end
    
    if 0<p(2)
        djacphi(2,p(2))=-dcx;
    end
    
    if 0<p(3)
        djacphi(3,p(3))=-dcx;
    end
    
    if 0<p(4)
        djacphi(1,p(4))=-dcy;
    end
    
    if 0<p(5)
        djacphi(2,p(5))=-dcy;
    end
    
    if 0<p(6)
        djacphi(3,p(6))=-dcy;
    end
    
    if 0<p(7)
        djacphi(1,p(7))=-dcz;
    end
    
    if 0<p(8)
        djacphi(2,p(8))=-dcz;
    end
    
    if 0<p(9)
        djacphi(3,p(9))=-dcz;
    end
    
    if 0<p(16)
        djacphi(1,p(16))=-du1x;
        djacphi(2,p(16))=-du1y;
        djacphi(3,p(16))=-du1z;
    end
    
    if 0<p(17)
        djacphi(1,p(17))=-du2x;
        djacphi(2,p(17))=-du2y;
        djacphi(3,p(17))=-du2z;
    end
    
    if 0<p(18)
        djacphi(1,p(18))=-du3x;
        djacphi(2,p(18))=-du3y;
        djacphi(3,p(18))=-du3z;
    end