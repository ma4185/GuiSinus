function wave_infinity()
% Diese Funktion erstellt eine 2-dimensionale Grafik in der sich Schallwellen kreisförmig ausbreiten.
% Anwendung: wave_infinity
% Eingegebener Parameter:
%           keine eigegebenen Parameter
% Ausgegebener Parameter:
%           Grafik mit verschiedenen Anzahlen an Schallquellen, mit der
%           variablen Einstellung von Amplitude und Frequenz

% Authoren: Nora Jürgens, Hanna Möhle, M. Osterloh
%           (Jade Hochschule, 2. Prüfungsleistung Daten und Algorithmen)
% Version:  1.0 programmiert am 15.06.2015 NJ HM MO
%           dokumentiert am 15.06.2015 NJ HM MO
% 
% wichtiger Hinweis: Grundlage des Codes beruht auf folgender Quelle: Oleg Alexandro, File:Two sources interference.gif , erstellt am
%          03:11, 13 January 2008 (UTC), URL: http://commons.wikimedia.org/wiki/File:Two_sources_interference.gif, zuletzt
%          besucht am 15.06.2015 13:54
clc
clear
close all

% Variablen anlegen
L   = 10;
sep = 4;
N   = 500;

freq   = 10;
x_koor=[];
y_koor=[];
W=[];
wave_ampl=[];
x=[];
idx=[];

V   = linspace(-L, L, N);
[X, Y] = meshgrid(V, V);
I=sqrt(-1);

%Positionen der Schallquellen anlegen
R1  = sqrt( (X-sep).^2 + Y.^2 );
R2  = sqrt( (X+sep).^2 + Y.^2 );
R3  = sqrt( (Y+sep).^2 + (X+sep).^2 );
R4  = sqrt( (Y-sep).^2 + (X-sep).^2 );

Z = exp(I*freq*R1)./R1+ exp(I*freq*R2)./R2;

M   = 30;
T   = linspace(0.0, 2*pi, M);
T   =T(1:(M-1));
amp = 0.8;
scale = 30/(2*amp);
time=(0:0.01:5);


%% buttons

% Erstellen von Buttons zur Einstellung der Frequenz, Amplitude und der
% Anzahl der Schallquellen

handle.start_stop = uicontrol('position',[10 45 100 30], ...
    'String','START', ...
    'callback',@(h,e)(start_stop));

handle.popupmenu = uicontrol('Style','popupmenu',...
    'position',[10 80 100 30], ...
    'string',{'2 sound sources','3 sound sources','4 sound sources'},...
    'callback',@(h,e)(number_source));

handle.frequency = uicontrol('Style', 'slider',...
    'Min',1,'Max',60,'Value',10,...
    'Position', [10 120 100 20],...
    'Callback',@(h,e)(frequency));

handle.freq_text = uicontrol('style', 'text', ...
    'position', [20 150 100 20], ...
    'string', '3.5');

handle.amplitude = uicontrol('Style', 'slider',...
    'Min',0.1,'Max',2,'Value',0.8,...
    'Position', [10 180 100 20],...
    'Callback',@(h,e)(amplitude));

handle.amp_text = uicontrol('style', 'text', ...
    'position', [20 210 100 20], ...
    'string', '0.8');

handle.amp_descript = uicontrol('style', 'text', ...
    'position', [10 210 50 20], ...
    'string', 'Amplitude:');

handle.freq_descript = uicontrol('style', 'text', ...
    'position', [10 150 60 20], ...
    'string', 'Frequency:');

idx=1;
draw()

%%
% Funktion ist für die Berechnung der Werte und für die Darstellung in der
% Animation zuständig (Hauptfunktion, zur Darstellung des Bildes)
    function draw(iter)
        if nargin == 0
            iter = 1;
        end
        
        hfig=figure(1);
        W = real(Z*exp(-I*T(iter)));
        W = max(W, -amp);
        W = min(W, amp);
        W=W+amp;
        
        h = image(scale*(W));
        axis equal; axis off;
        colormap(hot)
        set(h, 'buttondownfcn', @addpoint);
        
        drawnow
        wave_ampl=W(x_koor,y_koor);
        if ~isempty(wave_ampl)
            x(idx)=wave_ampl;
            figure(2);
            time= 0:0.01:(idx-1)*0.01;
            plot(time, x(1:idx));
            idx=idx+1;
        end
        
    end

%%
% Der Start/Stop-Botton startet oder stoppt die Animation
    function start_stop()
        
        set(gcbo,'String',setdiff({'START' 'STOP'},get(gcbo,'String')));
        
        
        while strcmp('STOP',get(gcbo,'String'))
            
            for iter=1:length(T)
                draw(iter)
                pause(0.01);
            end
        end
        
    end

%%
% Anzahl der Schallquellen kann ausgewählt werden und wird in der Berechnung zur Animation
% der Graphik geändert
    function number_source()
        
        wahl_schall=get(handle.popupmenu, 'value');
        auswahl_schall=get(handle.popupmenu, 'string');
        
        switch auswahl_schall{wahl_schall}
            case '2 Schallquellen'
                Z = exp(I*freq*R1)./R1 + exp(I*freq*R2)./R2;
                
            case '3 Schallquellen'
                Z = exp(I*freq*R1)./R1 + exp(I*freq*R2)./R2+ exp(I*freq*R3)./R3;
                
            case '4 Schallquellen'
                Z = exp(I*freq*R1)./R1 + exp(I*freq*R2)./R2+ exp(I*freq*R3)./R3+ exp(I*freq*R4)./R4;
                
        end
        
    end

%%
% Frequenz kann ausgewählt werden und wird in der Berechnung zur Animation
% der Graphik geändert
    function frequency()
        
        freq = get(handle.frequency, 'value');
        set(handle.freq_text, 'string', num2str(freq));
        number_source()
        draw()
        
    end

%%
% Amplitude kann ausgewählt werden und wird in der Berechnung zur Animation
% der Graphik geändert
    function amplitude()
        
        amp = get(handle.amplitude, 'value');
        set(handle.amp_text, 'string', num2str(amp));
        start_stop()
        draw()
    end

%%
% Punkt für die lokale Wellenform kann ausgewählt werden
    function addpoint(h, event)
        
        koor=event.IntersectionPoint;
        x_koor=round(koor(1));
        y_koor=round(koor(2));
        x=zeros(length(T),1);
        
        
    end
end
