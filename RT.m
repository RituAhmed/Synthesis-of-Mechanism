function [t,y,add_data]=RT(nombre,t,yini)
%Integrador regla trapezoidal, implícito y de paso simple constante
%
%Datos de entrada
%nombre (Cadena de texto entre '' indicando la función [yp,addat]=f(t,y,yprev))
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
%Definir la tolerancia y el número max de iteraciones
    tol=1E-5;
    nmax=20;
    
%Determinar el número de instantes temporales, el paso temporal, el número
%de variables y el número de coordenadas
    nt=length(t);
    it=t(2)-t(1);
    nv=length(yini);
    n=nv/2;
    
%Calcular los datos adicionales en el instante inicial e inicializar matriz
%de datos adicionales
    if 2<nargout
        [dyini,addat]=feval(nombre,t(1),yini,yini);
        nad=length(addat);
    else
        dyini=feval(nombre,t(1),yini,yini);
    end
  
%Inicializar salidas
    y=zeros(nt,nv);
    y(1,:)=yini';
    
    if 2<nargout
        add_data=zeros(nt,nad);
        add_data(1,:)=addat';
    end
    
%Repetir para cada instante temporal
    for c1=2:nt
        %Extraer posición y velocidad en el instante anterior i
            si=y(c1-1,:)';
            
        %Calcular la aceleración en el instante anterior
            if 2<nargout
                [dsi,addat]=feval(nombre,t(c1-1),si,si);
            else
                dsi=feval(nombre,t(c1-1),si,si);
            end
            
        %Calcular el predictor en el instante actual i+1
            s0=calc_predictor(it,si,dsi);
    
        %Calcular la aceleración en s0 en el instante actual i+1
            if 2<nargout
                [ds0,addat]=feval(nombre,t(c1),s0,si);
            else
                ds0=feval(nombre,t(c1),s0,si);
            end
            
        %Inicializar contador j
            j=1;
            
        %Calcular el corrector en el instante actual i+1
            sj=calc_corrector(it,si,dsi,ds0);
            
        %Calcular el error para la iteración j
            error=sqrt(sum((sj(1:n)-s0(1:n)).^2));
            
        %Bucle condicional
            citer=1;
            while tol<error && citer<=nmax
                %Actualizar s0
                    s0=sj;
                    
                %Calcular la aceleración en s0 en el instante actual i+1
                    if 2<nargout
                        [ds0,addat]=feval(nombre,t(c1),s0,si);
                    else
                        ds0=feval(nombre,t(c1),s0,si);
                    end
                    
                %Actualizar el contador j y citer
                    j=j+1;
                    citer=citer+1;
                    
                %Calcular el corrector en el instante actual i+1
                    sj=calc_corrector(it,si,dsi,ds0);

                %Calcular el error para la iteración j
                    error=sqrt(sum((sj(1:n)-s0(1:n)).^2));
            
            end
            
        %Guardar valor de s en el instante actual i+1
            y(c1,:)=sj';
            if 2<nargout
                add_data(c1,:)=addat';
            end
            
    end