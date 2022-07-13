function jacphi=eval_jac(const_data,t,q,c)
%Funci�n para evaluar el jacobiano de las ecuaciones de restricci�n

%Entradas
%const_data (Struct con [constraint_class p] o [constraint_class p fun])
%t (Instante temporal para evaluar las ecuaciones re�nomas
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geom�tricas)

%Salidas
%jacphi (Matriz con la evaluaci�n num�rica de jac)

%Extraer datos de la restricci�n
    constraint_class=const_data.constraint_class;
    p=const_data.p;
    if strcmp(constraint_class,'phi_coord_t')
        fun=const_data.fun;
    end

%Determinar el tipo de ecuaci�n de restricci�n
    if strcmp(constraint_class,'phi_3D_rs_3uv')
        jacphi=jacphi_3D_rs_3uv(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_rs_1ap')
        jacphi=jacphi_3D_rs_1ap(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_2uv_angle')
        jacphi=jacphi_3D_2uv_angle(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_2puv')
        jacphi=jacphi_3D_2puv(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_1p1uv_alin')
        jacphi=jacphi_3D_1p1uv_alin(p,q,c);
    elseif strcmp(constraint_class,'phi_3D_1uv_basis_angle')
        jacphi=jacphi_3D_1uv_basis_angle(p,q,c);
    elseif strcmp(constraint_class,'phi_coord_t')
        jacphi=jacphi_coord_t(p,q,fun,t);
    elseif strcmp(constraint_class,'phi_3D_rs_2p')
        jacphi=jacphi_3D_rs_2p(p,q,c);
    end
