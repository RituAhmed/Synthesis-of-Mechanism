function d2phit=eval_d2phit(const_data,t,q,dq,c)
%Funci?n para evaluar la segunda derivada temporal de las ecuaciones de restricci?n

%Entradas
%const_data (Struct con [constraint_class p] o [constraint_class p fun])
%t (Instante temporal para evaluar las ecuaciones re?nomas
%q (Vector columna con las coordenadas globales)
%dq (Vector columna con las derivadas temporales de las coordenadas del mecanismo)
%c (Vector fila con las constantes geom?tricas)

%Salidas
%d2phit (Vector columna con la evaluaci?n num?rica de las filas del d2phit)

%Extraer datos de la restricci?n
    constraint_class=const_data.constraint_class;
    p=const_data.p;
    if strcmp(constraint_class,'phi_coord_t')
        fun=const_data.fun;
    end

%Determinar el tipo de ecuaci?n de restricci?n
    if strcmp(constraint_class,'phi_3D_rs_3uv')
        d2phit=zeros(6,1);
    elseif strcmp(constraint_class,'phi_3D_rs_1ap')
        d2phit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_3D_2uv_angle')
        d2phit=0;
    elseif strcmp(constraint_class,'phi_3D_2puv')
        d2phit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_3D_1p1uv_alin')
        d2phit=zeros(3,1);
    elseif strcmp(constraint_class,'phi_3D_1uv_basis_angle')
        d2phit=zeros(2,1);
    elseif strcmp(constraint_class,'phi_coord_t')
        [fx,dfx,d2fx]=feval(fun,t);
        d2phit=-d2fx;
    elseif strcmp(constraint_class,'phi_3D_rs_2p')
        d2phit=0;
    end