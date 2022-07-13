function dphit=eval_dphit(const_data,t,q,c)
%Función para evaluar la derivada temporal de las ecuaciones de restricción

%Entradas
%const_data (Struct con [constraint_class p] o [constraint_class p fun])
%t (Instante temporal para evaluar las ecuaciones reónomas
%q (Vector columna con las coordenadas globales)
%c (Vector fila con las constantes geométricas)

%Salidas
%dphit (Vector columna con la evaluación numérica de las filas del dphit)

%Extraer datos de la restricción
    constraint_class=const_data.constraint_class;
    p=const_data.p;
    if strcmp(constraint_class,'phi_coord_t')
        fun=const_data.fun;
    end

%Determinar el tipo de ecuación de restricción
    if strcmp(constraint_class,'phi_3D_rs_3uv')
        dphit=zeros(6,1);
    elseif strcmp(constraint_class,'phi_3D_rs_1ap')
        dphit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_3D_2uv_angle')
        dphit=0;
    elseif strcmp(constraint_class,'phi_3D_2puv')
        dphit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_3D_1p1uv_alin')
        dphit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_3D_1uv_basis_angle')
        dphit=zeros(2,1);
    elseif strcmp(constraint_class,'phi_coord_t')
        [fx,dfx]=feval(fun,t);
        dphit=-dfx;
    elseif strcmp(constraint_class,'phi_3D_rs_2p')
        dphit=0;
    end
