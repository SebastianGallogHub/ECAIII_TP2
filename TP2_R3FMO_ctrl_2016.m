
%Formato de nombre de variable para graficar y comparar
%<variables>_<alpha(rad)>[_<error(1 o 2)>]

%Todos los ensayos se realizan con una carga {P=100W; Q=50VAr}

%Ensayos:
%1) alpha = p/3; anchoPulso = 5%; Comparar {Normal, t1=0, corto}
%2) alpha = p/2; anchoPulso = 5%; Comparar {Normal, t1=0, corto}
%3) alpha = p/3; anchoPulso = 40%; ¿Qué pasa en corto?
%4) alpha = p/2; anchoPulso = 40%; ¿Qué pasa en corto?

%TODO: Agregar gráfica y análisis de 3 y 4
%TODO: Agregar gráfica de th1 (tensión y corriente de T1) para cada caso
%TODO: Calcular valores eficaces

clear all; close all; clc
p = .01;%pi
fase1 = 0;
fase2 = fase1+2*p/3;
fase3 = fase2+2*p/3;
Q = 50;
C = 500e-5;

%% 1)Sin error; alpha = pi/3; anchoPulso = 5; 
alpha = p/3;
theta = p/6+ alpha;
anchoPulso = 5; 
tCorto = 0.2
t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx')
tensionEnLaCarga_p_3= Vc;
corrienteEnLaCarga_p_3 = icarga;
tout_p_3 = tout;

%% 1)A)Falla de SW; alpha = pi/3; anchoPulso = 5;
t1 = 0;
tCorto = 0.2;
sim('TP2_R3FMO_ctrl_2016.slx')
tensionEnLaCarga_p_3_1= Vc;
corrienteEnLaCarga_p_3_1 = icarga;
tout_p_3_1 = tout;

%% 1)B)Error de corto; alpha = pi/3; anchoPulso = 5;
t1 = fase1+theta;
tCorto = 0.075;
sim('TP2_R3FMO_ctrl_2016.slx')
tensionEnLaCarga_p_3_2= Vc;
corrienteEnLaCarga_p_3_2 = icarga;
tout_p_3_2 = tout;

%% Sin error; alpha = pi/2; anchoPulso = 5
alpha = p/2;
theta = p/6+ alpha;
anchoPulso = 5; 
tCorto = 0.2
t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx')
tensionEnLaCarga_p_2 = Vc;
corrienteEnLaCarga_p_2 = icarga;
tout_p_2 = tout;

%% 2)A)Falla de SW; alpha = pi/2; anchoPulso = 5
t1 = 0;
tCorto = 0.2;
sim('TP2_R3FMO_ctrl_2016.slx')
tensionEnLaCarga_p_2_1= Vc;
corrienteEnLaCarga_p_2_1 = icarga;
tout_p_2_1 = tout;

%% 2)B)Error de Corto; alpha = pi/2; anchoPulso = 5
t1 = fase1+theta;
tCorto = 0.075;
sim('TP2_R3FMO_ctrl_2016.slx')
tensionEnLaCarga_p_2_2= Vc;
corrienteEnLaCarga_p_2_2 = icarga;
tout_p_2_2 = tout;

%% 3)
%TODO

%% 4)
%TODO

%% 1)Gráficas
%TODO: titulos y demás referencias
figure;hold on; 
title('Tension - Comparación con una falla de Software')
plot(tout_p_3,tensionEnLaCarga_p_3, 'b--',tout_p_3_1,tensionEnLaCarga_p_3_1, 'r');grid on;

figure;hold on 
title('Corriente - Comparación con una falla de Software')
plot(tout_p_3,corrienteEnLaCarga_p_3, 'b--',tout_p_3_1,corrienteEnLaCarga_p_3_1, 'r');grid on;

figure;hold on; 
title('Tension - Comparación con un corto en T3')
plot(tout_p_3,tensionEnLaCarga_p_3, 'b--',tout_p_3_2,tensionEnLaCarga_p_3_2, 'r');grid on;

figure;hold on 
title('Corriente - Comparación con un corto en T3')
plot(tout_p_3,corrienteEnLaCarga_p_3, 'b--',tout_p_3_2,corrienteEnLaCarga_p_3_2, 'r');grid on;

%% 2)Gráficas
figure;hold on; 
title('Tension - Comparación con una falla de Software')
plot(tout_p_2,tensionEnLaCarga_p_2, 'b--',tout_p_2_1,tensionEnLaCarga_p_2_1, 'r');grid on;

figure;hold on 
title('Corriente - Comparación con una falla de Software')
plot(tout_p_2,corrienteEnLaCarga_p_2, 'b--',tout_p_2_1,corrienteEnLaCarga_p_2_1, 'r');grid on;

figure;hold on; 
title('Tension - Comparación con un corto en T3')
plot(tout_p_2,tensionEnLaCarga_p_2, 'b--',tout_p_2_2,tensionEnLaCarga_p_2_2, 'r');grid on;

figure;hold on 
title('Corriente - Comparación con un corto en T3')
plot(tout_p_2,corrienteEnLaCarga_p_2, 'b--',tout_p_2_2,corrienteEnLaCarga_p_2_2, 'r');grid on;

%% 3)Gráficas

%% 4)Gráficas
