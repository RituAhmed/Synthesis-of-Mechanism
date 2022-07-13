function [q,f,dat_iter,dat_error]=calc_pos(t,qini,c)
%Funci�n para resolver el problema de la posici�n del mecanismo

%Tolerancia al error para el problema de posici�n
    tol=1e-8;
    
%M�todo de Newton modificado (solo calcular la matriz jacobiano en la
%iteraci�n inicial)
    modif=false; %false --> m�todo original y true --> m�todo modificado
    
%M�ximo n�mero de iteraciones (para evitar bucles infinitos si no hay
%soluci�n)
    nmax=20;
    
%Iniciar q y q_var
    q=qini;
    
%Evaluar las ecuaciones de restriccion
    f=calc_phi(t,q,c);
           
%Evaluar el error
    error=norm(f);
    
%Iniciar matriz con datos de iteraci�n y vector de errores
    dat_iter=q';
    dat_error=error;
    
%Inicializar contador de iteraciones
    iter=1;
            
%Siguiente iteraci�n del m�todo N-R
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