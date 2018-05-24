function [ contArray ] = conexos4(x,y,xor,yor,M )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

x=x+1;
y=y+1;
cc4=[];
for i=3:5
    
    try
        top=M(y-1,x,i);
    catch
        top=-1;
    end
    
    try
        bot=M(y+1,x,i);
    catch
        bot=-1;
    end
    
    try
        left=M(y,x-1,i);
    catch
        left=-1;
    end
    
    try
        right=M(y,x+1,i);
    catch
        right=-1;
    end
    
    cc4=[cc4;top,bot,left,right];
end

cont=0;
contArray=[];

for u=1:4
    for i=1:3
        
        if cc4(i,u)==-1
            
            
        else
            if (M(yor+1,xor+1,2+i)>(cc4(i,u)-60)) && (M(yor+1,xor+1,2+i)<(cc4(i,u)+60))
                cont=cont+1;
            end
            
        end
    end
    contArray=[contArray;cont];
    cont=0;
end
end

