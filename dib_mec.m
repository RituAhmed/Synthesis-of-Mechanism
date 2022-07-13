function dib_mec(q,c)
%Función para representar gráficamente la posición del mecanismo
                
%Dibujar todas las barras
    %GUIA AC - Z
    draw_bar_3D(c(10:12),[c(10) c(11) c(12)+0.2],'-','b')
    hold on
    %ESLABON B (patin)
    draw_bar_3D(q(1:3),q(1:3),'-','r')
    %CAMA
    fill3([q(1) q(1) q(1)+0.2 q(1)+0.2],[q(2)-0.1 q(2)+0.1 q(2)+0.1 q(2)-0.1], [q(3) q(3) q(3) q(3)],'g','FaceAlpha',0.3) % Coordenadas relativas desde el patin
    %ESLABON DF
    draw_bar_3D(c(13:15),[c(13) c(14)-0.2 c(15)],'-','r')
    %GUIA EH - X
    draw_bar_3D(q(4:6),[q(4)+0.2 q(5) q(6)],'-','g')
    %ESLABON GI
    draw_bar_3D(q(7:9),q(10:12),'-','r')
    %SR EXTR
    %draw_ref_sys_3D(q(7:9),q(19:21),q(22:24),q(25:27),0.01)
    
    %TCP
        plot3(q(10),q(11),q(12),'MarkerSize',1,'MarkerFaceColor','r')
    %No mantener más barras
        hold off
    %Definir los limites de visualización
        %daspect([3 3 3]) %Relación de aspecto
%         pbaspect auto
%         daspect auto
%         axis([-0.1 0.3 -0.3 0.3 -0.3 0.3]) %Rango de visualización
        axis([0.095 0.11 0.14 0.16 0.18 0.22])
        grid on %Rejilla
    %Etiquetar el gráfico
        xlabel('X')
        ylabel('Y')
        zlabel('Z')
        view([45 25])

