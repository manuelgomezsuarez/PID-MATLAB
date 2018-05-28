function [ seedArray ] = seedGenerator(M,numberSeed,dist)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%M=matrix
%numberSeed=numero de semillas a filtrar segun distancia
%dist=distancia que debe haber entre cada semilla

seedArray=[];


pixelValueR=M(:,:,3)-M(:,:,4)-M(:,:,5);
pixelValueWhite=M(:,:,3)+M(:,:,4)+M(:,:,5);
[Y,X]=find(pixelValueWhite >620);

seedArrayWhite=[X,Y];
seedArrayWhite=seedArrayWhite-1;

Ms = sort(pixelValueR(:),'descend');                   
%ResultR = Ms(1:ceil(numberSeed))
seedArray=[seedArrayWhite];


for i=1:numberSeed
    [Y,X]=find(pixelValueR==Ms(i));
    seedArray=[seedArray;X-1,Y-1];
end

%for i=1:numberSeed
%    [Y,X]=find(pixelValueR==ResultR(i));
%    seedArray=[seedArray;X-1,Y-1]
%end

sz=size(seedArray);
seedArray2=[seedArray(1,1),seedArray(1,2)]; %la matriz que vamos arellenar con las semillas importantes


for i=1:sz(1)       %iteracion sobre la matriz con muchas semillas
    szA=size(seedArray2);
    if szA(1)==numberSeed
        break
    end
    x1=seedArray(i,1);
    y1=seedArray(i,2);
    x1y1=[x1 y1];
    valid=ismember(x1y1,seedArray2,'rows');
    for u=1:szA(1)       
        %sqrt((y2-y1)^2+(x2-x1)^2) %Where (x1,y1) and (x2,y2) are coordinates of two pixels 
        x2=seedArray2(u,1);
        y2=seedArray2(u,2);
        x2y2=[x2 y2];
        distancia=sqrt((y2-y1)^2+(x2-x1)^2);
        if distancia <= dist 
            valid=valid+1;
        end     
    end
    
    if valid==0
        seedArray2=[seedArray2;x1,y1];
    end
    

end

seedArray=seedArray2;

end



