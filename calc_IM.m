function IM=calc_IM(t,q)
%Función para calcular el índice de manipulabilidad
%
%Entradas
%t (Instante de tiempo)
%q (Vector columna con las coordenadas dependientes del robot)
%
%Salidas
%IM (Índice de manipulabilidad)

%Definir las constantes globales a utilizar
    global c
      
%Definir los punteros a las coordenadas de entrada y salida del robot
    pint=[19 20 21]; 
    pout=[10 11 3]; 
    
    nq=length(q);
    %nint=length(pint);
    nout=length(pout);
    pvar=def_pvar(nq,pint);
    
%Calcular el jacobiano de las ecuaciones de restricción
    jac=calc_jac(t,q,c);
    [jacvar,jacint]=selec_var(jac,pvar);
                    
%Calcular derivada temporal de las ecuaciones de restricción
    dphit=calc_dphit(t,q,c);
            
%Calcular la matriz R
    R=calc_R(pvar,pint,jacvar,jacint,dphit);
    
%Construir la matriz H de filtrado de salidas
    H=zeros(nout,nq);
    for c1=1:nout
        H(c1,pout(c1))=1;
    end
    
%Calcular la matriz jacobiano del robot
    J=H*R;
    
%Hacer la descomposición SVD y obtener valores singulares
    vsigma=svd(J); %Ordenados de mayor a menor
    sv=sqrt(vsigma);
    
%Calcular el IM
    IM=sv(nout)/sv(1);