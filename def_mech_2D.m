function def_mech_2D
%Funcion para definir el modelado cinematico
%
%Datos de entrada
%Via menus graficos
%
%Datos de salida
%Archivos:
%   kinematic_def.mat (actualizado)
%   
%                                   CODIGO
%Cargar los datos
    if exist('kinematic_def.mat')==2
        load 'kinematic_def.mat'
        n=size(mech,1);
    else
        mech={};
        n=0;
    end
%Menu principal
    v1=true;
    while v1
        op1=menu('Kinematic constraints','Add','Modify','Delete','Details','Save','Exit');
        switch op1
            case 1 %Añadir
                op2=menu('Constraint type','RS2P','RS3P','RS3PA','RS4P','R','RP'...
                         ,'P','ANG_COORD','LIN_COORD','GEAR','ROT_ABS','COORD_T','D2P');
                switch op2
                    case 1 %RS2P
                        I=imread('RS2P.jpg');
                        figure=imshow(I);
                        title('2 POINT RIGID SOLID')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','L_1_2:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_rs2p','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 2 %RS3P
                        I=imread('RS3P.jpg');
                        figure=imshow(I);
                        title('3 POINT RIGID SOLID')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','L_1_2:','L_1_3:','L_2_3:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_rs3p','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 3 %RS3PA
                        I=imread('RS3PA.jpg');
                        figure=imshow(I);
                        title('ALIGNED 3 POINT RIGID SOLID')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','L_1_2:','L_1_3:','L_2_3:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_rs3pa','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 4 %RS4P
                        I=imread('RS4P.jpg');
                        figure=imshow(I);
                        title('4 POINT RIGID SOLID')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','x_4:','y_4:','L_1_2:','L_1_3:','L_2_3:','lambda:','mu:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_rs4p','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 5 %R
                        I=imread('R.jpg');
                        figure=imshow(I);
                        title('REVOLUTE PAIR')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_R','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 6 %RP
                        I=imread('RP.jpg');
                        figure=imshow(I);
                        title('RP PAIR')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_RP','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 7 %P
                        I=imread('P.jpg');
                        figure=imshow(I);
                        title('PRISMATIC PAIR')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','x_4:','y_4:','L_1_2:','L_3_4:','beta:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_P','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 8 %ANG_COORD
                        I=imread('ANG_COORD.jpg');
                        figure=imshow(I);
                        title('ANGULAR COORDINATE')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','x_4:','y_4:','L_1_2:','L_3_4:','beta:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_ang_coord','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 9 %LIN_COORD
                        I=imread('LIN_COORD.jpg');
                        figure=imshow(I);
                        title('LINEAR COORDINATE')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','L_1_2:','d:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_lin_coord','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 10 %GEAR
                        I=imread('GEAR.jpg');
                        figure=imshow(I);
                        title('GEAR PAIR')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','x_4:','y_4:','R_1_2:','R_3_4:','delta:','psi:','delta_0:','psi_0:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_gear','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 11 %ROT_ABS
                        I=imread('ROT_ABS.jpg');
                        figure=imshow(I);
                        title('ABSOLUTE ROTATION')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','L_1_2:','theta:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_rot_abs','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 12 %COORD_T
                        I=imread('COORD_T.jpg');
                        figure=imshow(I);
                        title('COORDINATE DEPENDING ON TIME')
                        daspect([1 1 1]);
                        dat=inputdlg({'x:','f_x:'},'Pointer (+ if variable, - if constant)'...
                            ,1,{'',''},'on');
                        close all
                        if 0<length(dat)
                            p=str2num(dat{1});
                            fun=dat{2};
                            constraint=struct('constraint_class','phi_coord_t','p',p,'fun',fun);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 13 %D2P
                        I=imread('D2P.jpg');
                        figure=imshow(I);
                        title('DISTANCE BETWEEN 2 POINTS')
                        daspect([1 1 1]);
                        dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','d:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_d2p','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                end
            case 2 %Modificar
                if 0<n
                %Mostrar lista de ecuaciones de restriccion
                    [s,ok]=listdlg('Name','Kinematic constraints','SelectionMode','single','ListString',mn2cstr(1:n));
                %Si se acepta la seleccion
                    if ok==1
                        %Determinar la clase de restriccion
                        constraint=mech{s};
                        %Presentar los datos en una ventana inpuldlg
                        if strcmp(constraint.constraint_class,'phi_rs2p')
                            I=imread('RS2P.jpg');
                            figure=imshow(I);
                            title('2 POINT RIGID SOLID')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','L_1_2:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_rs2p','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_rs3p')
                            I=imread('RS3P.jpg');
                            figure=imshow(I);
                            title('3 POINT RIGID SOLID')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','L_1_2:','L_1_3:','L_2_3:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_rs3p','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_rs3pa')
                            I=imread('RS3PA.jpg');
                            figure=imshow(I);
                            title('ALIGNED 3 POINT RIGID SOLID')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','L_1_2:','L_1_3:','L_2_3:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_rs3pa','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_rs4p')
                            I=imread('RS4P.jpg');
                            figure=imshow(I);
                            title('4 POINT RIGID SOLID')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','x_4:','y_4:','L_1_2:','L_1_3:','L_2_3:','lambda:','mu:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_rs4p','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_R')
                            I=imread('R.jpg');
                            figure=imshow(I);
                            title('REVOLUTE PAIR')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_R','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_RP')
                            I=imread('RP.jpg');
                            figure=imshow(I);
                            title('RP PAIR')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_RP','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_P')
                            I=imread('P.jpg');
                            figure=imshow(I);
                            title('PRISMATIC PAIR')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','x_4:','y_4:','L_1_2:','L_3_4:','beta:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_P','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_ang_coord')
                            I=imread('ANG_COORD.jpg');
                            figure=imshow(I);
                            title('ANGULAR COORDINATE')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','x_4:','y_4:','L_1_2:','L_3_4:','beta:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_ang_coord','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_lin_coord')
                            I=imread('LIN_COORD.jpg');
                            figure=imshow(I);
                            title('LINEAR COORDINATE')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','L_1_2:','d:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_lin_coord','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_gear')
                            I=imread('GEAR.jpg');
                            figure=imshow(I);
                            title('GEAR PAIR')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','x_3:','y_3:','x_4:','y_4:','R_1_2:','R_3_4:','delta:','psi:','delta_0:','psi_0:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_gear','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_rot_abs')
                            I=imread('ROT_ABS.jpg');
                            figure=imshow(I);
                            title('ABSOLUTE ROTATION')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','L_1_2:','theta:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_rot_abs','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_coord_t')
                            I=imread('COORD_T.jpg');
                            figure=imshow(I);
                            title('COORDINATE DEPENDING ON TIME')
                            daspect([1 1 1]);
                            dat=inputdlg({'x:','f_x:'},['Constraint pointer ' int2str(n)]...
                                ,1,{num2str(constraint.p) constraint.fun},'on');
                            close all
                            if 0<length(dat)
                                p=str2num(dat{1});
                                fun=dat{2};
                                constraint=struct('constraint_class','phi_coord_t','p',p,'fun',fun);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_d2p')
                            I=imread('D2P.jpg');
                            figure=imshow(I);
                            title('DISTANCE BETWEEN 2 POINTS')
                            daspect([1 1 1]);
                            dat=inputdlg({'x_1:','y_1:','x_2:','y_2:','d:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_d2p','p',dat);
                                mech{s}=constraint;
                            end
                        end
                    end
                else
                    msgbox('There are no constraints to modify','WARNING','warn');
                end
            case 3 %Borrar
                if 0<n
                %Mostrar lista de ecuaciones de restriccion
                    [s,ok]=listdlg('Name','Kinematic constraints','SelectionMode','single','ListString',mn2cstr(1:n));
                %Si se acepta la seleccion
                    if ok==1
                        new_mech={};
                        if 1<s
                            new_mech=[new_mech;mech(1:s-1)];
                        end
                        if s<n
                            new_mech=[new_mech;mech(s+1:n)];
                        end
                        mech=new_mech;
                        n=n-1;
                    end
                else
                    msgbox('There are no constraints to delete','WARNING','warn');
                end
            case 4 %Detalles del modelado
                mech_2D_details(mech);
            case 5 %Guardar
                if 0<n
                    save('kinematic_def.mat','mech');
                end
            case 6 %Salir
                v1=false;
        end
    end