function [t,s,add_data]=AB2_TrabajoSySM(nombre,t,si,qi)
%Integrador Adams-Bashforth de orden 2
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
    s1=si;
    if 2<nargout
        [s1d,qprev,addat]=feval(nombre,t(1),s1,qi);
        nad=length(addat);
    else
        [s1d,qprev]=feval(nombre,t(1),s1,qi);
    end
    
%Inicializar salidas
    s=zeros(nt,nv);
    sd=s;
    
    s(1,:)=s1';
    sd(1,:)=s1d';
    
    if 2<nargout
        add_data=zeros(nt,nad);
        add_data(1,:)=addat';
    end
    
%Para el primer paso se usa el método de Euler explícito
    s2=s1+it*s1d;
    if 2<nargout
        [s2d,qprev,addat]=feval(nombre,t(2),s2,qi);
    else
        [s2d,qprev]=feval(nombre,t(2),s2,qi);
    end
    
    s(2,:)=s2';
    sd(2,:)=s2d';
    
    if 2<nargout
        add_data(2,:)=addat';
    end
        
%Para los pasos siguientes se usa el método AB2
    for c1=3:nt
        %Definir yi-1d
            siminus1d=sd(c1-2,:)';
            
        %Definir yi y yid
            si=s(c1-1,:)';
            sid=sd(c1-1,:)';
            
        %Calcular yiplus1
            siplus1=si+it*(1.5*sid-0.5*siminus1d);
            
        %Calcular las derivadas en yiplus1
            if 2<nargout
                [siplus1d,new_qprev,addat]=feval(nombre,t(c1),siplus1,qprev);
            else
                [siplus1d,new_qprev]=feval(nombre,t(c1),siplus1,qprev);
            end
            
        %Guardar la solución y los datos adicionales
            s(c1,:)=siplus1';
            sd(c1,:)=siplus1d';
            qprev = new_qprev;

            if 2<nargout
                add_data(c1,:)=addat';
            end

    end
