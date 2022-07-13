function d2phit=eval_d2phit(const_data,t,q,dq,c)
%Función para evaluar la segunda derivada temporal de las ecuaciones de restricción

%Entradas
%const_data (Struct con [constraint_class p] o [constraint_class p fun])
%t (Instante temporal para evaluar las ecuaciones reónomas
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las derivadas temporales de las coordenadas del mecanismo)
%c (Vector fila con las constantes geométricas)

%Salidas
%d2phit (Vector columna con la evaluación numérica de las filas del d2phit)

%Extraer datos de la restricción
    constraint_class=const_data.constraint_class;
    p=const_data.p;
    if strcmp(constraint_class,'phi_coord_t')
        fun=const_data.fun;
    end

%Determinar el tipo de ecuación de restricción
    if strcmp(constraint_class,'phi_rs2p')
        d2phit=0;
    elseif strcmp(constraint_class,'phi_rs3p')
        d2phit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_rs3pa')
        d2phit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_rs4p')
        d2phit=zeros(5,1);
    elseif strcmp(constraint_class,'phi_R')
        d2phit=zeros(2,1);
    elseif strcmp(constraint_class,'phi_RP')
        d2phit=0;
    elseif strcmp(constraint_class,'phi_P')
        d2phit=zeros(2,1);
    elseif strcmp(constraint_class,'phi_ang_coord')
        d2phit=0;
    elseif strcmp(constraint_class,'phi_lin_coord')
        d2phit=zeros(2,1);
    elseif strcmp(constraint_class,'phi_gear')
        d2phit=zeros(5,1);
    elseif strcmp(constraint_class,'phi_rot_abs')
        d2phit=0;
    elseif strcmp(constraint_class,'phi_coord_t')
        [fx,dfx,d2fx]=feval(fun,t);
        d2phit=-d2fx;
    elseif strcmp(constraint_class,'phi_d2p')
        d2phit=0;
    end