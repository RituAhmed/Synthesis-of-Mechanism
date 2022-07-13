function [t,y,add_data]=AB3(nombre,t,yini)
%Integrador Adams-Bashforth, explícito y multipaso (3 pasos)
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
    y0=yini;
    if 2<nargout
        [y0d,addat]=feval(nombre,t(1),y0,y0);
        nad=length(addat);
    else
        y0d=feval(nombre,t(1),y0,y0);
    end
    
%Inicializar salidas
    y=zeros(nt,nv);
    yd=y;
    
    y(1,:)=y0';
    yd(1,:)=y0d';
    
    if 2<nargout
        add_data=zeros(nt,nad);
        add_data(1,:)=addat';
    end
    
%Para el primer paso se usa el método de Euler explícito
    y1=y0+it*y0d;
    
    if 2<nargout
        [y1d,addat]=feval(nombre,t(2),y1,y0);
    else
        y1d=feval(nombre,t(2),y1,y0);
    end
    
    y(2,:)=y1';
    yd(2,:)=y1d';
    
    if 2<nargout
        add_data(2,:)=addat';
    end

%Para el segundo paso se usa el método de AB2
    %Definir yi-1d
        yiminus1d=yd(1,:)';
            
    %Definir yi y yid
        yi=y(2,:)';
        yid=yd(2,:)';
            
    %Calcular yiplus1
        yiplus1=yi+it*(1.5*yid-0.5*yiminus1d);
            
    %Calcular las derivadas en yiplus1
        if 2<nargout
            [yiplus1d,addat]=feval(nombre,t(3),yiplus1,yi);
        else
            yiplus1d=feval(nombre,t(3),yiplus1,yi);
        end
            
    %Guardar la solución y los datos adicionales
        y(3,:)=yiplus1';
        yd(3,:)=yiplus1d';
            
        if 2<nargout
            add_data(3,:)=addat';
        end

%Para los pasos siguientes se usa el método AB3
    for c1=4:nt
        %Definir yi-2d
            yiminus2d=yd(c1-3,:)';
            
        %Definir yi-1d
            yiminus1d=yd(c1-2,:)';
            
        %Definir yi y yid
            yi=y(c1-1,:)';
            yid=yd(c1-1,:)';
            
        %Calcular yiplus1
            yiplus1=yi+it*((23/12)*yid-(4/3)*yiminus1d+(5/12)*yiminus2d);
            
        %Calcular las derivadas en yiplus1
            if 2<nargout
                [yiplus1d,addat]=feval(nombre,t(c1),yiplus1,yi);
            else
                yiplus1d=feval(nombre,t(c1),yiplus1,yi);
            end
            
        %Guardar la solución y los datos adicionales
            y(c1,:)=yiplus1';
            yd(c1,:)=yiplus1d';
            
            if 2<nargout
                add_data(c1,:)=addat';
            end

    end
