function djacphi=djacphi_3D_1p1uv_alin(p,q,dq,c)
%Función para calcular la derivada temporal del el jacobiano de las 3 ecuaciones de restricción que
%definen que un punto está alineado con un vector unitario

%Entradas
%p (Vector fila 10x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nux nuy nuz nxa nya nza nxb nyb nzb nd]. Si la posición es negativa, quiere decir que
%que esa coordenada es constante y se saca del vector c con el mismo índice pero positivo)
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades de las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djacphi (Matriz 3xn con la derivada temporal del jacobiano de las ecuaciones de restricción)

%Determinar el número de coordenadas globales
    n=length(q);
    
%Extraer las coordenadas globales que se van a utilizar en el jacobiano de las ecuaciones de
%restricción
    if 0<p(1)
        dux=dq(p(1));
    else
        dux=0;
    end
    
    if 0<p(2)
        duy=dq(p(2));
    else
        duy=0;
    end
    
    if 0<p(3)
        duz=dq(p(3));
    else
        duz=0;
    end
    
    if 0<p(10)
        dd=dq(p(10));
    else
        dd=0;
    end
    
%Calcular la derivada temporal del jacobiano de las ecuaciones de restricción
    djacphi=zeros(3,n);
    if 0<p(1)
        djacphi(1,p(1))=-dd;
    end
    
    if 0<p(2)
        djacphi(2,p(2))=-dd;
    end
    
    if 0<p(3)
        djacphi(3,p(3))=-dd;
    end
    
    if 0<p(10)
        djacphi(1,p(10))=-dux;
        djacphi(2,p(10))=-duy;
        djacphi(3,p(10))=-duz;
    end