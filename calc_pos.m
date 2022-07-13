function [q,f,dat_iter,dat_error]=calc_pos(t,qini,c)
%Función para resolver el problema de la posición del mecanismo

%Tolerancia al error para el problema de posición
    tol=1e-8;
    
%Método de Newton modificado (solo calcular la matriz jacobiano en la
%iteración inicial)
    modif=false; %false --> método original y true --> método modificado
    
%Máximo número de iteraciones (para evitar bucles infinitos si no hay
%solución)
    nmax=20;
    
%Iniciar q y q_var
    q=qini;
    
%Evaluar las ecuaciones de restriccion
    f=calc_phi(t,q,c);
           
%Evaluar el error
    error=norm(f);
    
%Iniciar matriz con datos de iteración y vector de errores
    dat_iter=q';
    dat_error=error;
    
%Inicializar contador de iteraciones
    iter=1;
            
%Siguiente iteración del método N-R
    while tol<error && iter<=nmax
        %Evaluar el jacobiano de las ecuaciones de restriccion
            if not(modif&&(1<iter))
                jac=calc_jac(t,q,c);
            end
                
        %Calcular el incremento de q
            incq=-jac\(f);
                    
        %Construir el nuevo vector q
            q=q+incq;
                    
        %Evaluar las ecuaciones de restriccion
            f=calc_phi(t,q,c);

        %Evaluar el error
            error=norm(f);
            
        %Actualizar matriz con datos de iteracion y error
            dat_iter=[dat_iter;q'];
            dat_error=[dat_error; error];
            
        %Actualizar el contador de iteraciones
            iter=iter+1;
            
    end
    
    %Aviso si no converge
        if tol<error
            disp(['Position problem does not converge at ' num2str(t) ' s'])
        end