function [t,s,add_data]=Euler(nombre,t,si,qi)
%Integrador de Euler de primer orden, explícito y de paso simple
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
    nv=length(si);
    
%Calcular los datos adicionales en el instante inicial e inicializar matriz
%de datos adicionales
    s1=si;
    if 2<nargout
        [s1d,qprev,addat]=feval(nombre,t(1),s1,qi);
        nad=length(addat);
    else
        [s1d,qprev]=feval(nombre,t(1),s1,qi);
    end
    
%Inicializar salidas
    s=zeros(nt,nv);
    s(1,:)=s1';
    
    if 2<nargout
        add_data=zeros(nt,nad);
        add_data(1,:)=addat';
    end
    
%Para los pasos siguientes se usa el método de Euler
    for c1=2:nt
        %Definir yi y yid
            si=

            %yi=y(c1-1,:)';
            %yid=y0d;
            
        %Calcular yiplus1
            new_s1=s1+it*
            %yiplus1=yi+it*yid;
            
%Evaluar la función sobre la solución en el siguiente instante temporal (n+1)
            if 2<nargout
                [new_s1d,new_qprev,new_addat]=feval(nombre,t(c1),new_s1,qprev);
            else
                [new_s1d,new_qprev]=feval(nombre,t(c1),new_s1,qprev);
            end
%Guardar la solución y los datos adicionales
            s(c1,:)=new_s1';
            if 2<nargout
                add_data(c1,:)=new_addat';
            end
%Actualizar valores
            s1=new_s1;
            s1d=new_s1d;
            qprev=new_qprev;

    end