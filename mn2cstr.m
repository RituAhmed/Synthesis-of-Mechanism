function cstr=mn2cstr(mn)
%Funcion para convertir una matriz numerica en una cell de strings
%Datos de entrada
%mn (Matriz numerica)
%
%Datos de salida
%cstr (Cell de strings)
%
%                               PROCESO
%Crear la cell con las misma dimensiones que mn
    tam=size(mn);
    cstr=cell(tam);
%Recorrer toda la matriz mn
    for c1=1:tam(1)
        for c2=1:tam(2)
            cstr(c1,c2)=cellstr(num2str(mn(c1,c2)));
        end
    end