function phi=eval_phi(const_data,t,q,c)
%Funci�n para evaluar las ecuaciones de restricci�n

%Entradas
%const_data (Struct con [constraint_class p] o [constraint_class p fun])
%t (Instante temporal para evaluar las ecuaciones re�nomas
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%phi (Vector columna con la evaluaci�n num�rica de las ecuaciones de
%restricci�n)

%Extraer datos de la restricci�n
    constraint_class=const_data.constraint_class;
    p=const_data.p;
    if strcmp(constraint_class,'phi_coord_t')
        fun=const_data.fun;
    end

%Determinar el tipo de ecuaci�n de restricci�n
    if strcmp(constraint_class,'phi_3D_rs_3uv')
        phi=phi_3D_rs_3uv(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_rs_1ap')
        phi=phi_3D_rs_1ap(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_2uv_angle')
        phi=phi_3D_2uv_angle(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_2puv')
        phi=phi_3D_2puv(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_1p1uv_alin')
        phi=phi_3D_1p1uv_alin(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_1uv_basis_angle')
        phi=phi_3D_1uv_basis_angle(p,q,c);
    elseif strcmp(constraint_class,'phi_coord_t')
        phi=phi_coord_t(p,q,fun,t);
    elseif strcmp(constraint_class,'phi_3D_rs_2p')
        phi=phi_3D_rs_2p(p,q,c);
    end
