function [ds,q,addat]=f_matriz_R(t,s,qprev)
%Función a integrar con la formulación de matriz R
%
%Entradas
%t (Instante temporal o vector columna con los instantes temporales de
%cálculo)
%s (Vector columna o matriz con [z;dz] por columnas)
%qprev (Vector columna con la solución de la posición en el instante
%anterior)
%
%Salidas
%ds (Vector columna o matriz con [dz;d2z] por columnas)
%q (Vector columna o matriz con la q por columnas
%addat (Vector columna o matriz con los datos adicionales por columnas)

%Definir las constantes globales a utilizar
    global nq nz nr na pvar pz mass c Kctc

%Definir constantes
    g=[0,0,-9.81];
    
%Determinar cuantos instantes temporales hay
    [nf,nc]=size(s);
    
%Bucle para calcular en todos los instantes temporales
    ds=zeros(nf,nc);
    %na=3;
    addat=zeros(3*nq+na,nc);
    for c1=1:nc
        %Extraer datos
            z=s(1:nz,c1);
            dz=s(nz+1:nz+nz,c1);
            
        %Resolver el problema de la posición
            q=calc_pos_z(t(c1),z,qprev,c,pvar,pz);
            
        %Calcular el error en la posicion
            %errpos=norm(phi)
            
        %Calcular el jacobiano de las restricciones cinemáticas
            jac=calc_jac(t(c1),q,c);
            [jacvar,jacz]=selec_var(jac,pvar);
                    
        %Calcular la velocidad
            dphit=calc_dphit(t(c1),q,c);
            
        %Calcular la velocidad
            dq=calc_vel_z(nq,dz,pvar,pz,jacvar,jacz,dphit);
            
        %Calcular la derivada del jacobiano respecto del tiempo
            djac=calc_djac(t(c1),q,dq,c);
            
        %Calcular el valor de las derivadas de las restricciones cinemáticas
        %respecto del tiempo
            d2phit=calc_d2phit(t(c1),q,dq,c);
            
        %Calcular la matriz R y dRdz
            R=calc_R(pvar,pz,jacvar,jacz,dphit);
            dRdz=calc_dRdz(dq,pvar,pz,jacvar,jacz,djac,d2phit);
            
        %Crear la matriz de masas
            M=calc_M_3D;
            
        %Crear el vector de fuerzas generalizadas
            %Pesos
                Qext=zeros(nq,1);
                Qext=add_weight_3D(Qext,mass,g);
                
        %Crear el vector de fuerzas de control
            
            B=zeros(nq,na);
            B(13,1)=1;
            B(14,2)=1;
            B(15,3)=1;
            
        %Definir el movimiento deseado
            [zdes,dzdes,d2zdes]=calc_z(t(c1),c);
            
        %Generar las matrices mKp y mKd
            mKp=Kctc*eye(nz,nz);
            mKd=2*sqrt(mKp);
            
        %Construir la matriz M_ y el vector Q_
            M_=R'*M*R;
            Q_=R'*(Qext-M*dRdz);
            
            if or(max(isnan(M_)),max(isinf(M_)))
                disp(['Problema de NaN o Inf en t=' num2str(t(c1))])
            elseif rank(M_)<nz
                disp(['Problema de rank(A) en t=' num2str(t(c1)) ' --> rank(A)=' int2str(rank(A))])
            end

        %Calcular el vector de fuerzas de control CTC
            Qa_=M_*(d2zdes+mKd*(dzdes-dz)+mKp*(zdes-z))-Q_;
            
        %Calcular los esfuerzos en los actuadores
            U=inv(R'*B)*Qa_;
     
        %Resolver el sistema lineal
            d2z=M_\(Q_+Qa_);
            
        %Calcular la aceleración de todas las coordenadas
            d2q=calc_acel_z(nq,dq,d2z,pvar,pz,jacvar,jacz,djac,d2phit);
            
        %Guardar resultados
            ds(:,c1)=[dz;d2z];
            addat(:,c1)=[q;dq;d2q;U];
            
    end