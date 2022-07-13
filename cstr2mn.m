function mn=cstr2mn(cstr)
%Funcion para convertir una una cell de strings en una matriz numerica
%Datos de entrada
%cstr (Cell de strings)
%
%Datos de salida
%mn (Matriz numerica)
%
%                               PROCESO
%Crear la matriz numerica con las misma dimensiones que cstr
    tam=size(cstr);
    mn=zeros(tam);
%Recorrer toda la matriz cstr
    for c1=1:tam(1)
        for c2=1:tam(2)
            mn(c1,c2)=str2num(cell2mat(cstr(c1,c2)));
        end
    end