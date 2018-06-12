function [ roi,num_cc,num_euler,num_agujeros ] = roiAgujeros( nombreImagen,punto_inicial_x,punto_inicial_y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

A = imread(nombreImagen); %Lectura de imagen
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
imagesc(A)
[longitudY,lontigudX] = size(A(:,:,1));
X1=[];
Y1=[];
cont=0;

%Matrices de posición
for i=1:longitudY 
    X1=[X1;0:lontigudX-1];
    Y1=[Y1;ones(1,lontigudX)*cont];
    cont=cont+1;
end


R=A(:,:,1); %Rojo
G=A(:,:,2); %Verde
B=A(:,:,3); %Azul

%Creación de la matriz(PosiciónX,PosiciónY,Rojo,Verde,Azul) 
M=X1;
M(:,:,2)=Y1;
M(:,:,3)=R;
M(:,:,4)=G;
M(:,:,5)=B;

[out,cero_celdas,uno_celdas]=cc_from_seed(punto_inicial_x,punto_inicial_y,M);
roi=out;



num_dos_celdas=size(roi);
num_dos_celdas=num_dos_celdas(1);


cero_celdas=unique(cero_celdas,'rows');
uno_celdas=unique(uno_celdas,'rows');

num_cero_celdas=size(cero_celdas);
num_cero_celdas=num_cero_celdas(1);

num_uno_celdas=size(uno_celdas);
num_uno_celdas=num_uno_celdas(1);

num_euler=num_cero_celdas-num_uno_celdas+num_dos_celdas;
num_agujeros=1-num_euler;
num_cc=1;
subplot(2,2,2)
imagesc(A)

hold on

scatter(out(:,1)+1,out(:,2)+1,50,[1 0 1],'filled','square')

msg = cell(6,1);
msg{1} = sprintf('Número de Euler:%2.0f',num_euler);
msg{2} = sprintf('Número de CC:%2.0f',1);
msg{3} = sprintf('Número de Agujeros:%2.0f',num_agujeros);
msg{4} = sprintf('Número de 0 celdas:%2.0f',num_cero_celdas);
msg{5} = sprintf('Número de 1 celdas:%2.0f',num_uno_celdas);
msg{6} = sprintf('Número de 2 celdas:%2.0f',num_dos_celdas);
mensaje=msgbox(msg,'INFO');
set(mensaje,'position',[360,100,190,150])
object_handles = findall(mensaje)
set( object_handles(4), 'FontSize', 15)
end

