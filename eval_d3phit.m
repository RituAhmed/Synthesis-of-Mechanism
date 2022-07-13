function d3phit=eval_d3phit(const_data,t,q,dq,d2q,c)
%Función para evaluar la tercera derivada temporal de las ecuaciones de restriccion

%Entradas
%const_data (Struct con [constraint_class p] o [constraint_class p fun])
%t (Instante temporal para evaluar las ecuaciones reonomas
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las velocidades en las coordenadas globales)
%d2q (Vector columna con las aceleraciones en las coordenadas globales)
%c (Vector fila con las constantes geometricas)

%Salidas
%d3phit (Vector columna con la evaluacion numerica de las filas del d3phit)

%Extraer datos de la restriccion
    constraint_class=const_data.constraint_class;
    p=const_data.p;
    if strcmp(constraint_class,'phi_coord_t')
        fun=const_data.fun;
    end

%Determinar el tipo de ecuación de restricción
    if strcmp(constraint_class,'phi_rs2p')
        d3phit=0;
    elseif strcmp(constraint_class,'phi_rs3p')
        d3phit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_rs3pa')
        d3phit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_rs4p')
        d3phit=zeros(5,1);
    elseif strcmp(constraint_class,'phi_R')
        d3phit=zeros(2,1);
    elseif strcmp(constraint_class,'phi_RP')
        d3phit=0;
    elseif strcmp(constraint_class,'phi_P')
        d3phit=zeros(2,1);
    elseif strcmp(constraint_class,'phi_ang_coord')
        d3phit=0;
    elseif strcmp(constraint_class,'phi_lin_coord')
        d3phit=zeros(2,1);
    elseif strcmp(constraint_class,'phi_gear')
        d3phit=zeros(5,1);
    elseif strcmp(constraint_class,'phi_rot_abs')
        d3phit=0;
    elseif strcmp(constraint_class,'phi_coord_t')
        [fx,dfx,d2fx,d3fx]=feval(fun,t);
        d3phit=-d3fx;
    elseif strcmp(constraint_class,'phi_d2p')
        d3phit=0;
    end