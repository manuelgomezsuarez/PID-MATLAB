function [ out ] = cc_from_seed(x,y,M)
%UNTITLED2 Summary of this function goes here
%   x,y position of the seed
%   M Image

%Algoritmo para detectar componentes 



pixVisitados=[];
pixNoVisitados=[x,y];
tamNoVisitados=size(pixNoVisitados);
tamNoVisitados=tamNoVisitados(1);



while tamNoVisitados > 0
    %Mirar el primero no visitado, calcular sus cc añadir el punto a
    %visitado y las cc a no visitados
    
    cc4=conexos4(pixNoVisitados(1,1),pixNoVisitados(1,2),x,y,M);
    
    pixVisitados=[pixVisitados;pixNoVisitados(1,1),pixNoVisitados(1,2)];
    
    for i=1:4
        if cc4(i)==3
            
            if i==1
                p=[pixNoVisitados(1,1) pixNoVisitados(1,2)-1];
                true=ismember(p,pixVisitados,'rows');
                true=true+ismember(p,pixNoVisitados,'rows');
                if true==0
                    pixNoVisitados=[pixNoVisitados;pixNoVisitados(1,1),pixNoVisitados(1,2)-1];
                end
            end
            if i==2
                p=[pixNoVisitados(1,1) pixNoVisitados(1,2)+1];
                true=ismember(p,pixVisitados,'rows');
                true=true+ismember(p,pixNoVisitados,'rows');
                if true==0
                    pixNoVisitados=[pixNoVisitados;pixNoVisitados(1,1),pixNoVisitados(1,2)+1];
                end
            end
            if i==3
                p=[pixNoVisitados(1,1)-1 pixNoVisitados(1,2)];
                true=ismember(p,pixVisitados,'rows');
                true=true+ismember(p,pixNoVisitados,'rows');
                if true==0
                    pixNoVisitados=[pixNoVisitados;pixNoVisitados(1,1)-1,pixNoVisitados(1,2)];
                end
            end
            if i==4
                p=[pixNoVisitados(1,1)+1 pixNoVisitados(1,2)];
                true=ismember(p,pixVisitados,'rows');
                true=true+ismember(p,pixNoVisitados,'rows');
                if true==0
                    pixNoVisitados=[pixNoVisitados;pixNoVisitados(1,1)+1,pixNoVisitados(1,2)];
                end
            end     
        end
    end
    
    pixNoVisitados(1,:)=[];
    
    
    tamNoVisitados=size(pixNoVisitados);
    
    tamNoVisitados=tamNoVisitados(1);
    pixVisitados;
    pixNoVisitados;
    
 
end

    
out=pixVisitados;

end



