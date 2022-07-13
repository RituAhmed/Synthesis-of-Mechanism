function mech_3D_details(mech)
%Funcion para presentar los detalles del modelado cinematico
%
%Datos de entrada
%mech (Cell con la definicion de las ecuaciones de restriccion)
%
%Datos de salida
%mech (Cell con la definicion de las ecuaciones de restriccion)
%
%Determinar el numero de bloques de ecuaciones
    n=size(mech,1);
%Iniciar contadores de ecuaciones, variables y constantes
    neqtotal=0;
    nredtotal=0;
    ptotal=[];
%Recorrer todos los bloques de ecuaciones
    for c1=1:n
        %Extraer la definicion
            constraint=mech{c1};
            clase=constraint.constraint_class;
            p=constraint.p;
        %Contar numero de ecuaciones del bloque
            if strcmp(clase,'phi_3D_rs_3uv')
                neq=6;
                nred=0;
            elseif strcmp(clase,'phi_3D_rs_1ap')
                neq=3;
                nred=0;
            elseif strcmp(clase,'phi_3D_2uv_angle')
                neq=1;
                nred=0;
            elseif strcmp(clase,'phi_3D_2puv')
                neq=2;
                nred=1;
            elseif strcmp(clase,'phi_3D_1p1uv_alin')
                neq=3;
                nred=0;
            elseif strcmp(clase,'phi_3D_1uv_basis_angle')
                neq=1;
                nred=1;
            elseif strcmp(clase,'phi_coord_t')
                neq=1;
                nred=0;
            elseif strcmp(clase,'phi_3D_rs_2p')
                neq=1;
                nred=0;
            end
        %Anadir a contadores totales
            neqtotal=neqtotal+neq;
            nredtotal=nredtotal+nred;
            ptotal=[ptotal;p];
    end
%Ordenar el vector ptotal
    ptotal=sort(ptotal);
%Extraer c y p
    nc=[];
    lc=0;
    np=[];
    lp=0;
    for c2=1:length(ptotal)
        if ptotal(c2)<0 %Es constante
            nc=[nc ptotal(c2)];
            lc=lc+1;
        end
        if 0<ptotal(c2) %Es variable
            np=[np ptotal(c2)];
            lp=lp+1;
        end
    end
    nnc=nc(1);
    for c3=2:lc
        if nc(c3)~=nnc(length(nnc))
            nnc=[nnc nc(c3)];
        end
    end
    nnp=np(1);
        for c4=2:lp
        if np(c4)~=nnp(length(nnp))
            nnp=[nnp np(c4)];
        end
    end
    c=sort(-nnc);
    nq=length(nnp);
%Sacar resultados por linea de comandos
    disp(['Numero de ecuaciones: ' num2str(neqtotal)])
    disp(['Numero de ecuaciones redundantes (adicionales): ' num2str(nredtotal)])
    disp(['Numero de coordenadas: ' num2str(nq)])
    disp(['Punteros p=[' num2str(nnp) ']'])
    disp(['Punteros c=[' num2str(c) ']'])