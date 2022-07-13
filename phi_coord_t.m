function phi=phi_coord_t(p,q,fun,t)
%Función para calcular las componentes del vector fi relativas a la
%ecuación de restricción que define una coordenada respecto del tiempo

%Entradas
%p (Vector fila 1x1 con las posiciones de las coordenadas utilizadas en las ecuaciones en el
%vector q global: [nx])
%q (Vector columna con las coordenadas globales)
%fun (String con el nombre de la función a evaluar)
%t (Instante de tiempo)

%Salidas
%phi (Vector fin con los valores de los miembros izquierdos de las ecuaciones de restricción)

%Extraer las coordenadas globales que se van a utilizar en la ecuación de
%restricción
    x=q(p(1));
    
%Calcular el valor de la función respecto del tiempo
    fx=feval(fun,t);
    
%Calcular el valor del miembro izquierdo de la ecuación de restricción
    phi=x-fx;