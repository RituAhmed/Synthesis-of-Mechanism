function [t,y,add_data]=RK2(nombre,t,yini)
%Integrador Runge-Kutta de segundo orden, explícito y de paso simple
%constante
%
%Datos de entrada
%nombre (Cadena de texto entre '' indicando la función [yp,addat]=f(t,y,yprev)
%Las salidas de f son dos matrices con los datos para cada instante temporal por filas
%   yp (Matriz ntxnv) --> datos de integración
%   addat (Matriz ntxnad) --> datos adicionales
%t (Vector columna con los nt instantes temporales de cálculo)
%yini (Vector columna con los valores iniciales de las variables a integrar)
%
%Datos de salida
%t (Vector columna de instantes temporales)
%y (Matriz con los valores de las variables integradas en cada instante temporal, por
%filas)
%add_data (Matriz con los valores de los datos adicionales calculados en cada instante temporal, por
%filas)
%
%                                   CODIGO
%Determinar el número de instantes temporales, el paso temporal y el número
%de variables
    nt=length(t);
    it=t(2)-t(1);
    nv=length(yini);
    
%Calcular los datos adicionales en el instante inicial e inicializar matriz
%de datos adicionales
    y1=yini;
    if 2<nargout
        [y1d,addat]=feval(nombre,t(1),y1,y1);
        nad=length(addat);
    else
        y1d=feval(nombre,t(1),y1,y1);
    end
    
%Inicializar salidas
    y=zeros(nt,nv);
    y(1,:)=y1';
    
    if 2<nargout
        add_data=zeros(nt,nad);
        add_data(1,:)=addat';
    end
    
%Repetir para cada instante temporal
    for c1=2:nt
        %Definir y2
            y2=y1+it*y1d;
            
        %Calcular las derivadas en y2
            y2d=feval(nombre,t(c1),y2,y(c1-1,:)');
            
        %Calcular solución en el siguiente instante temporal (n+1)
            new_y1=y1+(it/2)*(y1d+y2d);
            
        %Evaluar la función sobre la solución en el siguiente instante
        %temporal (n+1)
            if 2<nargout
                [new_y1d,new_addat]=feval(nombre,t(c1),new_y1,y(c1-1,:)');
            else
                new_y1d=feval(nombre,t(c1),new_y1,y(c1-1,:)');
            end
            
        %Guardar la solución y los datos adicionales
            y(c1,:)=new_y1';
            if 2<nargout
                add_data(c1,:)=new_addat';
            end
            
        %Actualizar valores
            y1=new_y1;
            y1d=new_y1d;
            
    end
