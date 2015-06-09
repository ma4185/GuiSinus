function wave_infinity()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
clc
clear 
close all 

L   = 10;
sep = 4;
N   = 500;
k   = 10;

V   = linspace(-L, L, N);

[X, Y] = meshgrid(V, V);

I=sqrt(-1);
R1  = sqrt( (X-sep).^2 + Y.^2 );
R2  = sqrt( (X+sep).^2 + Y.^2 );
R3  = sqrt( (Y+sep).^2 + (X+sep).^2 );
R4  = sqrt( (Y-sep).^2 + (X+sep).^2 );

Z = exp(I*k*R1)./R1 + exp(I*k*R2)./R2; %%??

%temp='2 Schallquellen';
M   = 10;
T   = linspace(0.0, 2*pi, M); 
T   =T(1:(M-1));
cut = 0,8;
scale = 30/(2*cut);

%% buttons

handle.popupmenu = uicontrol('Style','popupmenu',...
                    'position',[10 80 100 30], ...
                    'string',{'2 Schallquellen','3 Schallquellen','4 Schallquellen'},...
                    'callback',@(h,e)(number_source))

handle.start_stop = uicontrol('position',[10 45 100 30], ...
                    'String','START', ...
                    'callback',@(h,e)(start_stop))


% wahl_schall=get(handle.popupmenu, 'value');
% auswahl_schall=get(handle.popupmenu, 'string');
% chosen_schall=auswahl_schall(wahl_schall);



    function draw()
        figure(1);
        scrsz = get(0, 'Screensize');
        W = real(Z*exp(-I*T(1)));
        W = max(W, -cut);
        W = min(W, cut);
        
        image(scale*(W+cut));
        axis equal; axis off;
        drawnow
        
    end

    function start_stop()
        
        %switch %%handel kram
            %case 
                set(gcbo,'String',setdiff({'START' 'STOP'},get(gcbo,'String')));
                while strcmp('STOP',get(gcbo,'String'))
                    
                    for iter=1:length(T)
                        
                        W = real(Z*exp(-I*T(iter)));
                        W = max(W, -cut);
                        W = min(W, cut);
                        
                        image(scale*(W+cut));
                        axis equal; axis off;
                        drawnow;
                        
                        pause(0.01);
                    end
                end
        %end
    end

    function number_source()
        
        wahl_schall=get(handle.popupmenu, 'value');
        auswahl_schall=get(handle.popupmenu, 'string');

        
        switch auswahl_schall{wahl_schall}
            case '2 Schallquellen'
                Z = exp(I*k*R1)./R1 + exp(I*k*R2)./R2;

            case '3 Schallquellen'
                Z = exp(I*k*R1)./R1 + exp(I*k*R2)./R2+ exp(I*k*R3)./R3;

            case '4 Schallquellen'
                Z = exp(I*k*R1)./R1 + exp(I*k*R2)./R2+ exp(I*k*R3)./R3+ exp(I*k*R4)./R4;

        end

    end



end

