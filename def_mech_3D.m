function def_mech_3D
%Funci贸n para definir el modelado cinem谩tico
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
        op1=menu('Kinematic constraints 3D','Add','Modify','Delete','Details','Save','Exit');
        switch op1
            case 1 %A馻dir
                op2=menu('Constraint class','Rigid Solid - 3 unitary vectors',...
                          'Rigid Solid - Additional point',...
                          'Angle between 2 unitary vectors',...
                          '2 parallel unitary vectors',...
                          'Point aligned with an unitary vector',...
                          'Angle of an unitary vector respect to a planar basis',...
                          'Coordinate depending on time');
                switch op2
                    case 1 %3D_rs_3uv
                        I=imread('rs_3uv.jpg');
                        figure=imshow(I);
                        title('Rigid Solid - 3 unitary vectors')
                        daspect([1 1 1]);
                        dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:','u3x:','u3y:','u3z:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_3D_rs_3uv','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 2 %3D_rs_1ap
                        I=imread('rs_1ap.jpg');
                        figure=imshow(I);
                        title('Rigid Solid - Additional point')
                        daspect([1 1 1]);
                        dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:','u3x:','u3y:','u3z:',...
                            'xA:','yA:','zA:','xB:','yB:','zB:','cx:','cy:','cz:'},'Pointers (+ if variable, - if constant)',...
                            1,{'','','','','','','','','','','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_3D_rs_1ap','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 3 %2uv_angle
                        I=imread('2uv_angle.jpg');
                        figure=imshow(I);
                        title('Angle between 2 unitary vectors')
                        daspect([1 1 1]);
                        dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:','theta'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_3D_2uv_angle','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 4 %2puv
                        I=imread('2puv.jpg');
                        figure=imshow(I);
                        title('2 parallel unitary vectors')
                        daspect([1 1 1]);
                        dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_3D_2puv','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 5 %1p1uv_alin
                        I=imread('1p1uv_alin.jpg');
                        figure=imshow(I);
                        title('Point aligned with an unitary vector')
                        daspect([1 1 1]);
                        dat=inputdlg({'ux:','uy:','uz:','xA','yA','zA','xB','yB','zB','d'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_3D_1p1uv_alin','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 6 %1uv_basis_angle
                        I=imread('1uv_basis_angle.jpg');
                        figure=imshow(I);
                        title('Angle of an unitary vector respect to a planar basis')
                        daspect([1 1 1]);
                        dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:','u3x:','u3y:','u3z:','theta'},'Pointers (+ if variable, - if constant)'...
                            ,1,{'','','','','','','','','',''},'on');
                        close all
                        if 0<length(dat)
                            dat=cstr2mn(dat);
                            constraint=struct('constraint_class','phi_3D_1uv_basis_angle','p',dat);
                            mech=[mech;constraint];
                            n=n+1;
                        end
                    case 7 %COORD_T
                        I=imread('coord_t.jpg');
                        figure=imshow(I);
                        title('Coordinate depending on time')
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
                end
            case 2 %Modificar
                if 0<n
                %Mostrar lista de ecuaciones de restricci贸n
                    [s,ok]=listdlg('Name','Kinematic constraints','SelectionMode','single','ListString',mn2cstr(1:n));
                %Si se acepta la seleccion
                    if ok==1
                        %Determinar la clase de restricci贸n
                        constraint=mech{s};
                        %Presentar los datos en una ventana inpuldlg
                        if strcmp(constraint.constraint_class,'phi_3D_rs_3uv')
                            I=imread('rs_3uv.jpg');
                            figure=imshow(I);
                            title('Rigid Solid - 3 unitary vectors')
                            daspect([1 1 1]);
                            dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:','u3x:','u3y:','u3z:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_3D_rs_3uv','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_3D_rs_1ap')
                            I=imread('rs_1ap.jpg');
                            figure=imshow(I);
                            title('Rigid Solid - Additional point')
                            daspect([1 1 1]);
                            dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:','u3x:','u3y:','u3z:',...
                            'xA:','yA:','zA:','xB:','yB:','zB:','cx:','cy:','cz:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_3D_rs_1ap','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_3D_2uv_angle')
                            I=imread('2uv_angle.jpg');
                            figure=imshow(I);
                            title('Angle between 2 unitary vectors')
                            daspect([1 1 1]);
                            dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:','theta'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_3D_2uv_angle','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_3D_2puv')
                            I=imread('2puv.jpg');
                            figure=imshow(I);
                            title('2 parallel unitary vectors')
                            daspect([1 1 1]);
                            dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_3D_2puv','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_3D_1p1uv_alin')
                            I=imread('1p1uv_alin.jpg');
                            figure=imshow(I);
                            title('Point aligned with an unitary vector')
                            daspect([1 1 1]);
                            dat=inputdlg({'ux:','uy:','uz:','xA','yA','zA','xB','yB','zB','d'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_3D_1p1uv_alin','p',dat);
                                mech{s}=constraint;
                            end
                        elseif strcmp(constraint.constraint_class,'phi_3D_1uv_basis_angle')
                            I=imread('1uv_basis_angle.jpg');
                            figure=imshow(I);
                            title('Angle of an unitary vector respect to a planar basis')
                            daspect([1 1 1]);
                            dat=inputdlg({'u1x:','u1y:','u1z:','u2x:','u2y:','u2z:','u3x:','u3y:','u3z:','theta'},['Constraint pointers ' int2str(n)]...
                                ,1,mn2cstr(constraint.p),'on');
                            close all
                            if 0<length(dat)
                                dat=cstr2mn(dat);
                                constraint=struct('constraint_class','phi_3D_1uv_basis_angle','p',dat);
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
                        end
                    end
                else
                    msgbox('There are no constraints to modify','WARNING','warn');
                end
            case 3 %Borrar
                if 0<n
                %Mostrar lista de ecuaciones de restricci贸n
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
                mech_3D_details(mech);
            case 5 %Guardar
                if 0<n
                    save('kinematic_def.mat','mech');
                end
            case 6 %Salir
                v1=false;
        end
    end