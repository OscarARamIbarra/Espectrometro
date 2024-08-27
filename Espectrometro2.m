close all; clear; clc;
A = imread('C:\Users\alfre\OneDrive\Pictures\Prueba9.jpg');
B = rgb2gray(A); 

I = B;

BW = I > 20;
%%imshow(BW)
BW = bwareaopen(BW, 50);
BW = imfill(BW, 'holes');
%%imshow(BW)
L = bwlabel(BW);
numele = max(max(L));
stats = regionprops(L,'all');
areas = stats.Area;
AR = zeros(1, numele);
for i=1:numele
    AR(1,i)=stats(i).Area;
end
maximo=max(AR);
lugar = find(AR==maximo);
E = stats(lugar).BoundingBox;
M1 = imcrop(A,E);

BM1 = rgb2gray(M1);

%%figure
imshow(BM1)
Y = improfile;
close all
subplot(121); imshow(M1);
subplot(122);plot(Y); 

xline(79,'-r',{'Rojo 650nm'});
xline(148,'-',{'Naranja 630nm'});
xline(215,'-y',{'Amarillo 600nm'});
xline(319,'-g',{'Verde 550nm'});
xline(491,'-c',{'Cian 490nm'});
xline(629,'-b',{'Azul 470nm'});






