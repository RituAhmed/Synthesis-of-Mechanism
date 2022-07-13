function djacphi=djacphi_3D_rs_3uv(p,q,dq,c)
%Funci�n para calcular la derivada temporal del jacobiano de las 6 ecuaciones
%de restricci�n que definen un s�lido r�gido con una base ortogonal de 3 vectores
%unitarios

%Entradas
%p (Vector fila 9x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nu1x nu1y nu1z nu2x nu2y nu2z nu3x nu3y nu3z]. Si la posici�n es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo �ndice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%djacphi (Matriz 6xn con la derivada temporal del jacobiano de las ecuaciones de restricci�n)

%Determinar el n�mero de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en el jacobiano de las ecuaciones de
%restricci�n
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
    
%Calcular la derivada temporal del jacobiano de las ecuaciones de restricci�n
    djacphi=zeros(6,n);
    if 0<p(1)
        djacphi(1,p(1))=2*du1x;
        djacphi(4,p(1))=du2x;
        djacphi(5,p(1))=du3x;
    end
    
    if 0<p(2)
        djacphi(1,p(2))=2*du1y;
        djacphi(4,p(2))=du2y;
        djacphi(5,p(2))=du3y;
    end
    
    if 0<p(3)
        djacphi(1,p(3))=2*du1z;
        djacphi(4,p(3))=du2z;
        djacphi(5,p(3))=du3z;
    end
    
    if 0<p(4)
        djacphi(2,p(4))=2*du2x;
        djacphi(4,p(4))=du1x;
        djacphi(6,p(4))=du3x;
    end
    
    if 0<p(5)
        djacphi(2,p(5))=2*du2y;
        djacphi(4,p(5))=du1y;
        djacphi(6,p(5))=du3y;
    end
    
    if 0<p(6)
        djacphi(2,p(6))=2*du2z;
        djacphi(4,p(6))=du1z;
        djacphi(6,p(6))=du3z;
    end
    
    if 0<p(7)
        djacphi(3,p(7))=2*du3x;
        djacphi(5,p(7))=du1x;
        djacphi(6,p(7))=du2x;
    end
    
    if 0<p(8)
        djacphi(3,p(8))=2*du3y;
        djacphi(5,p(8))=du1y;
        djacphi(6,p(8))=du2y;
    end
    
    if 0<p(9)
        djacphi(3,p(9))=2*du3z;
        djacphi(5,p(9))=du1z;
        djacphi(6,p(9))=du2z;
    end
