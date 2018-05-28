dlgTitle    = 'Escoja una opción';
dlgQuestion = '¿Que programa desea ejecutar?';
choice = questdlg(dlgQuestion,dlgTitle,'Euler, agujeros y ROI','Expansion de semillas', 'Euler, agujeros y ROI');

if choice=='Euler, agujeros y ROI'
    
    prompt = {'Enter image name:','Enter coordinate x seed pixel:','Enter cooordinate y seed pixel'};
    title = 'Input';
    dims = [1 35];
    definput = {'3x3.jpg','0','0'};
    answer = inputdlg(prompt,title,dims,definput)

    imagen=char(answer(1))
    x=str2num(char(answer(2)))
    y=str2num(char(answer(3)))
    [roi,euler,num_cc,num_agujeros]=roiAgujeros(imagen,x,y)
end


    
if char(choice)== 'Expansion de semillas'
    prompt = {'Enter image name:','Enter number of seed to filter:','dist min between seeds'};
    title = 'Input';
    dims = [1 35];
    definput = {'espalda.jpg','70','5'};
    answer = inputdlg(prompt,title,dims,definput)

    imagen=char(answer(1));
    numberSeed=str2num(char(answer(2)));
    dist=str2num(char(answer(3)));
    expansionSemillas(imagen,numberSeed,dist)
end
