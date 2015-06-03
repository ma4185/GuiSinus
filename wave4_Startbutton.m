 clc;
 close all
 clear 

L=10;
sep = 4;
N=500; 
k= 15;
%k2=1;

V=linspace(-L, L, N);

[X, Y] = meshgrid(V, V);
 
I=sqrt(-1);
R1= sqrt( (X-sep).^2 + Y.^2 );
R2= sqrt( (X+sep).^2 + Y.^2 );
%R3= sqrt( (Y+sep).^2 + (X+sep).^2 );
 
% Sum of Green's functions for two point sources
Z = exp(I*k*R1)./R1 + exp(I*k*R2)./R2;%+ exp(I*k*R3)./R3;
 
M=10;
T=linspace(0.0, 2*pi, M); T=T(1:(M-1));
cut = 0.8;
scale = 30/(2*cut);



%%

handles.fig = figure(1);

scrsz = get(0, 'Screensize'); 

W = real(Z*exp(-I*T(1)));
W = max(W, -cut);
W = min(W, cut);
 
image(scale*(W+cut));
axis equal; axis off;
drawnow
%Start und Stop Button      
uicontrol('position',[10 45 100 30], ...
          'String','START', ...
          'callback','sine_wave_a_Startbutton')
%Dropdown für Anzahl der SQ
% uicontrol('Style','popupmenu',...
%           'position',[10 80 100 30], ...
%           'string',{'2 Schallquellen','3 Schallquellen','4 Schallquellen'},...
%           'callback',@sine_wave_a1)  %(''2 Schallquellen'')
% %Slider für Frequenz      
% uicontrol('Style', 'slider',...
%         'Min',1,'Max',50,'Value',25,...
%         'Position', [10 80 20 70],...
%         'Callback','sine_wave-a1(''Frequenz'')');       

