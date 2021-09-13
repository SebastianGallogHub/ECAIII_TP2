%% Declaro las variables de tiempo de la simulación

p = .01;%pi

fase1 = 0;
fase2 = fase1+2*p/3;
fase3 = fase2+2*p/3;

alfa = 0;
theta = p/6 + alfa;
anchoPulso = 5;
Q = 100;
C = 500e-5;
tCorto = 0.2;

t1 = fase1;
t2 = fase2;
t3 = fase3;

%%
%alfa = 0
clc
alpha = 0;
theta = p/6+ alpha;

t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx')
%Esto es igual que la rectificación con diodos. Las mismas gráficas y
%conclusiones

%%
%Prueba
clc
alpha = p/6;
theta = p/6+ alpha;

t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx')

%Esto es lo que muestran en el apunte (theta = 60°). El tiempo que conduce
%cada tiristor es el equivalente a un desarrollo de 120° en cualquier tipo
%de carga.

%En este caso la corriente en la carga es ininterrumpida.

%En los casos de corriente ininterrumpida, el ángulo de apagado (theta2) 
%de cada tiristor, coincide con el ángulo de encendido del tiristor 
%siguiente y la transferencia de corriente de un tiristor al otro se 
%produce por conmutación natural, al igual que con diodos.

%Cuando el apagado (theta2) se produce antes de que encienda el tiristor 
%siguiente, la corriente resulta interrumpida (pulsante).

%%
%alfa = pi/3
clc
alpha = p/3;
theta = p/6+ alpha;

t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx')

%Acá empezamos a ver corriente continua pero una tensión negativa en la
%carga debido a la resistencia al cambio de corriente de la carga L que
%provoca que el T1 siga conduciendo. Luego entra en conducción T2 debido a
%la presencia del trigger en su gate. 

%La corriente continua se sigue dando porque L no se alcanza a descargar
%por completo.

%%
%alfa = pi/2
clc
alpha = p/2;
theta = p/6+ alpha;

t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;


sim('TP2_R3FMO_ctrl_2016.slx')

%%
%alfa = 0; anchoPulso = 35
clc
anchoPulso = 40;
alpha = p/3;
theta = p/6+ alpha;

t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx')

%%
%alfa = 0; anchoPulso = 5; (potencia en la carga) Qm01 = 100VAr
clc
anchoPulso = 35;
alpha = 0;
theta = p/6+ alpha;

t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx')

%%
%alfa = 0; anchoPulso = 5; (potencia en la carga) Qm02 = 50VAr
clc
Q = 50;
anchoPulso = 5;
alpha = p/2;
theta = p/6+ alpha;

t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx')

%%
%alfa = 0; anchoPulso = 5; (potencia en la carga) Qm02 = 50VAr
clc
Q = 100;
%tCorto = 0.2;
tCorto = 0.06;
anchoPulso = 5;
alpha = p/3;
theta = p/6+ alpha;

t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx')
