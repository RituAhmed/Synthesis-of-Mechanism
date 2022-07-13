function djacphi=eval_djac(const_data,t,q,dq,c)
%Función para evaluar la derivada temporal del jacobiano de las ecuaciones de restricción

%Entradas
%const_data (Struct con [constraint_class p] o [constraint_class p fun])
%t (Instante temporal para evaluar las ecuaciones reónomas
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades en las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%djacphi (Matriz con la evaluación numérica de las filas del djac)

%Extraer datos de la restricción
    constraint_class=const_data.constraint_class;
    p=const_data.p;
    if strcmp(constraint_class,'phi_coord_t')
        fun=const_data.fun;
    end

%Determinar el tipo de ecuación de restricción
    if strcmp(constraint_class,'phi_3D_rs_3uv')
        djacphi=djacphi_3D_rs_3uv(p,q,dq,c);
    elseif strcmp(constraint_class,'phi_3D_rs_1ap')
        djacphi=djacphi_3D_rs_1ap(p,q,dq,c);
    elseif strcmp(constraint_class,'phi_3D_2uv_angle')
        djacphi=djacphi_3D_2uv_angle(p,q,dq,c);
    elseif strcmp(constraint_class,'phi_3D_2puv')
        djacphi=djacphi_3D_2puv(p,q,dq,c);
    elseif strcmp(constraint_class,'phi_3D_1p1uv_alin')
        djacphi=djacphi_3D_1p1uv_alin(p,q,dq,c);
    elseif strcmp(constraint_class,'phi_3D_1uv_basis_angle')
        djacphi=djacphi_3D_1uv_basis_angle(p,q,dq,c);
    elseif strcmp(constraint_class,'phi_coord_t')
        djacphi=djacphi_coord_t(p,q,dq,fun,t);
    elseif strcmp(constraint_class,'phi_3D_rs_2p')
        djacphi=djacphi_3D_rs_2p(p,q,dq,c);
    end
