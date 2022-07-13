function d2jacphi=eval_d2jac(const_data,t,q,dq,d2q,c)
%Funcion para evaluar la segunda derivada temporal del jacobiano de las ecuaciones de restriccin

%Entradas
%const_data (Struct con [constraint_class p] o [constraint_class p fun])
%t (Instante temporal para evaluar las ecuaciones reonomas
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades en las coordenadas globales)
%d2q (Vector columna con las aceleraciones en las coordenadas globales)
%c (Vector fila con las constantes geometricas)

%Salidas
%d2jacphi (Matriz con la evaluacion numérica de las filas del d2jac)

%Extraer datos de la restriccion
    constraint_class=const_data.constraint_class;
    p=const_data.p;
    if strcmp(constraint_class,'phi_coord_t')
        fun=const_data.fun;
    end

%Determinar el tipo de ecuacion de restriccion
    if strcmp(constraint_class,'phi_rs2p')
        d2jacphi=d2jacphi_rs2p(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_rs3p')
        d2jacphi=d2jacphi_rs3p(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_rs3pa')
        d2jacphi=d2jacphi_rs3pa(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_rs4p')
        d2jacphi=d2jacphi_rs4p(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_R')
        d2jacphi=d2jacphi_R(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_RP')
        d2jacphi=d2jacphi_RP(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_P')
        d2jacphi=d2jacphi_P(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_ang_coord')
        d2jacphi=d2jacphi_ang_coord(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_lin_coord')
        d2jacphi=d2jacphi_lin_coord(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_gear')
        d2jacphi=d2jacphi_gear(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_rot_abs')
        d2jacphi=d2jacphi_rot_abs(p,q,dq,d2q,c);
    elseif strcmp(constraint_class,'phi_coord_t')
        d2jacphi=d2jacphi_coord_t(p,q,dq,d2q,fun,t);
    elseif strcmp(constraint_class,'phi_d2p')
        d2jacphi=d2jacphi_d2p(p,q,dq,d2q,c);
    end
