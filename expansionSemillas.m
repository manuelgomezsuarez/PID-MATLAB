function [ res ] = expansionSemillas(imagen,numberSeed,dist)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

A = imread(imagen); %Lectura de imagen

figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,3,1,'align')
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

%Creación de la matriz 5d, (PosiciónX,PosiciónY,Rojo,Verde,Azul) 
M=X1;
M(:,:,2)=Y1;
M(:,:,3)=R;
M(:,:,4)=G;
M(:,:,5)=B;


seeds=seedGenerator(M,numberSeed,dist);

seeds

subplot(1,3,2)
imagesc(A)
hold on

for i=1:size(seeds,1)
    seeds(i,1)
    seeds(i,2)
    circle(seeds(i,1)+1,seeds(i,2)+1,dist)
end
scatter(seeds(:,1)+1,seeds(:,2)+1,35,[0 1 0],'filled')


szSeeds=size(seeds);

out=[];
for i=1:szSeeds
    out=[out;cc_from_seed(seeds(i,1),seeds(i,2),M)];
end

%expansionSemillas('6x3.jpg',1,1)
subplot(1,3,3)
imagesc(A)
hold on
scatter(out(:,1)+1,out(:,2)+1,35,[1 0 1],'filled')

res=0;
end



