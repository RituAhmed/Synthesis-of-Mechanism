function [q,phi,dat_iter,dat_error]=calc_pos_z(t,z,qini,c,pvar,pz)
%Función para resolver el problema de la posición del mecanismo conociendo
%el vector z

%Tolerancia al error para el problema de posición
    tol=1e-8;
    
%Método de Newton modificado (solo calcular la matriz jacobiano en la
%iteración inicial)
    modif=false; %false --> método original y true --> método modificado
    
%Máximo número de iteraciones (para evitar bucles infinitos si no hay
%solución)
    nmax=20;
    
%Iniciar q y q_var
    q=insert(qini,z,pz);
    qvar=selec_row(q,pvar);
    
%Evaluar las ecuaciones de restriccion
    phi=calc_phi(t,q,c);
           
%Evaluar el error
    error=norm(phi);
    
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
        %Separar la matriz jacobiano
            [jacvar,jacz]=selec_var(jac,pvar);
            
        %Calcular el incremento de qvar
            incqvar=-jacvar\(phi);
                    
        %Construir el nuevo vector qvar
            qvar=qvar+incqvar;
            
        %Insertar en q
            q=insert(q,qvar,pvar);
                    
        %Evaluar las ecuaciones de restriccion
            phi=calc_phi(t,q,c);

        %Evaluar el error
            error=norm(phi);
            
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