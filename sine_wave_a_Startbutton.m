function sine_wave_a_Startbutton(hObject,handle,event)

L=10;
sep = 4;
N=500; 
k=15;
%k2=15;


 V=linspace(-L, L, N);

[X, Y] = meshgrid(V, V);
 
I=sqrt(-1);
R1= sqrt( (X-sep).^2 + Y.^2 );
R2= sqrt( (X+sep).^2 + Y.^2 );
%R3= sqrt( (Y+sep).^2 + (X).^2 );
%R4= sqrt( (X).^2 + (Y-sep).^2 );
 
% Sum of Green's functions for two point sources
Z = exp(I*k*R1)./R1 + exp(I*k*R2)./R2;


M=10;
T=linspace(0.0, 2*pi, M); T=T(1:(M-1));
cut = 0.8;
scale = 30/(2*cut);

   
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
end