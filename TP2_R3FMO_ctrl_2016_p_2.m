%Todos los ensayos se realizan con una carga {P=100W; Q=100VAr}

clear all; close all; clc
p = .01;%pi
fase1 = 0;
fase2 = fase1+2*p/3;
fase3 = fase2+2*p/3;
Q = 200;
C = 500e-5;
T = 0.06;
%% 2)Sin error; alpha = pi/2; anchoPulso = 5; 
alpha = p/2;
theta = p/6+ alpha;
anchoPulso = 5; 
tCorto = 0.2;   
t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx');clc;

%Valores sin falla para las comparaciones
tout_ =tout;
th1_ = th1;
Vc_ = Vc;
Vc_ef_2 = Vc_ef(end);
Vc_m_2 = Vc_m(end);
icarga_ef_2 = icarga_ef(end);
icarga_m_2 = icarga_m(end);

%% 2)Gráficas
figure('units','normalized','outerposition',[0 0 1 1]);hold on; 
subplot(311);
plot(tout,v1, 'r--',tout,v2, 'g--',tout,v3, 'b--');hold on; 
plot(tout,p1, 'r',tout,p2, 'g',tout,p3, 'b');hold on; 
legend('Vf_1','Vf_2','Vf_3','Trigger 1','Trigger 2','Trigger 3','Location','NorthEastOutside');
ylabel('Tensión (V)');
title('Funcionamiento sin fallas: alfa=pi/2; P=100W; Q=100VAr');

subplot(312);
plot(tout,v1, 'r--',tout,v2, 'g--',tout,v3, 'b--');hold on; 
plot(tout, th1, 'k','LineWidth', 1.1);grid on;
legend('Vf_1','Vf_2','Vf_3','Vt_1','Location','NorthEastOutside');
ylabel('Tensión (V)');

subplot(313);
plot(tout,v1, 'r--',tout,v2, 'g--',tout,v3, 'b--');hold on; 
plot(tout,Vc,'k','LineWidth', 1.1);grid on;
legend('Vf_1','Vf_2','Vf_3','V_c','Location','NorthEastOutside');
ylabel('Tensión (V)');

xlabel('Tiempo [s]'); saveas(gcf,'RTMOC_Sin_Fallas_pi_2_100_w_100_VAr_I.png');

figure('units','normalized','outerposition',[0 0 1 1]); hold on;
subplot(211);
plot(tout,Vc,'b',tout,Vc_ef,'k',tout,Vc_m,'r--');grid on;
ylabel('Tensión (V)');
legend('Instantánea','Eficaz','Media','Location','NorthEastOutside');
title('Funcionamiento sin fallas: alfa=pi/2; P=100W; Q=100VAr');

subplot(212);
plot(tout,icarga,'b',tout,icarga_ef,'k',tout,icarga_m,'r--');grid on;
legend('Instantánea','Eficaz','Media','Location','NorthEastOutside');
ylabel('Corriente (A)');

xlabel('Tiempo [s]'); saveas(gcf,'RTMOC_Sin_Fallas_pi_2_100_w_100_VAr_II.png');

%% 2)A)T1 desfasado; alpha = pi/2; anchoPulso = 5
t1 = 0;
sim('TP2_R3FMO_ctrl_2016.slx');clc;
Vc_ef_2A = Vc_ef(end);
Vc_m_2A = Vc_m(end);
icarga_ef_2A = icarga_ef(end);
icarga_m_2A = icarga_m(end);

%% 2)A)Gráficas
figure('units','normalized','outerposition',[0 0 1 1]);hold on; 
subplot(311);
plot(tout,v1, 'r--',tout,v2, 'g--',tout,v3, 'b--');hold on; 
plot(tout,p1, 'r',tout,p2, 'g',tout,p3, 'b');hold on; 
legend('Vf_1','Vf_2','Vf_3','Trigger 1','Trigger 2','Trigger 3','Location','NorthEastOutside');
ylabel('Tensión (V)');
title('T1 desfasado: alfa=pi/2; P=100W; Q=100VAr');

subplot(312);
plot(tout, th1, 'k','LineWidth', 1.1); hold on;
plot(tout_, th1_, 'b--'); grid on;
legend('Vt_1 falla','Vt_1 normal','Location','NorthEastOutside');
ylabel('Tensión (V)');

subplot(313);
plot(tout, Vc, 'k','LineWidth', 1.1); hold on;
plot(tout_, Vc_, 'b--'); grid on;
legend('V_c falla','V_c normal','Location','NorthEastOutside');
ylabel('Tensión (V)');

xlabel('Tiempo [s]'); saveas(gcf,'RTMOC_T1_Desfasado_DC_5_pi_2_100_w_100_VAr_I.png');

figure('units','normalized','outerposition',[0 0 1 1]);hold on; 
subplot(211);
plot(tout,Vc,'b',tout,Vc_ef,'k',tout,Vc_m,'r--');grid on;
ylabel('Tensión (V)');
legend('Instantánea','Eficaz','Media','Location','NorthEastOutside');
title('T1 desfasado: alfa=pi/2; P=100W; Q=100VAr');

subplot(212);
plot(tout,icarga,'b',tout,icarga_ef,'k',tout,icarga_m,'r--');grid on;
legend('Instantánea','Eficaz','Media','Location','NorthEastOutside');
ylabel('Corriente (A)');

xlabel('Tiempo [s]'); saveas(gcf,'RTMOC_T1_Desfasado_DC_5_pi_2_100_w_100_VAr_II.png');

%% 2)B)T1 desfasado; alpha = pi/2; anchoPulso = 5
t1 = 0;
anchoPulso = 40;
sim('TP2_R3FMO_ctrl_2016.slx');clc;
Vc_ef_2B = Vc_ef(end);
Vc_m_2B = Vc_m(end);
icarga_ef_2B = icarga_ef(end);
icarga_m_2B = icarga_m(end);

%% 2)B)Gráficas
figure('units','normalized','outerposition',[0 0 1 1]);hold on; 
subplot(311);
plot(tout,v1, 'r--',tout,v2, 'g--',tout,v3, 'b--');hold on; 
plot(tout,p1, 'r','LineWidth', 1.1);
plot(tout,p2, 'g');
plot(tout,p3, 'b--','LineWidth', 1.2);
legend('Vf_1','Vf_2','Vf_3','Trigger 1','Trigger 2','Trigger 3','Location','NorthEastOutside');
ylabel('Tensión (V)');
title('T1 desfasado: alfa=pi/2; P=100W; Q=100VAr; anchoPulso=40%');

subplot(312);
plot(tout, th1, 'k','LineWidth', 1.1); hold on;
plot(tout_, th1_, 'b--'); grid on;
legend('Vt_1 falla','Vt_1 normal','Location','NorthEastOutside');
ylabel('Tensión (V)');

subplot(313);
plot(tout, Vc, 'k','LineWidth', 1.1); hold on;
plot(tout_, Vc_, 'b--'); grid on;
legend('V_c falla','V_c normal','Location','NorthEastOutside');
ylabel('Tensión (V)');

xlabel('Tiempo [s]'); saveas(gcf,'RTMOC_T1_Desfasado_DC_40_pi_2_100_w_100_VAr_I.png');

figure('units','normalized','outerposition',[0 0 1 1]);hold on; 
subplot(211);
plot(tout,Vc,'b',tout,Vc_ef,'k',tout,Vc_m,'r--');grid on;
ylabel('Tensión (V)');
legend('Instantánea','Eficaz','Media','Location','NorthEastOutside');
title('T1 desfasado: alfa=pi/2; P=100W; Q=100VAr; anchoPulso=40%');

subplot(212);
plot(tout,icarga,'b',tout,icarga_ef,'k',tout,icarga_m,'r--');grid on;
legend('Instantánea','Eficaz','Media','Location','NorthEastOutside');
ylabel('Corriente (A)');

xlabel('Tiempo [s]'); saveas(gcf,'RTMOC_T1_Desfasado_DC_40_pi_2_100_w_100_VAr_II.png');

%% 2)C)Error de Corto; alpha = pi/2; anchoPulso = 5
T = 0.1;
alpha = p/2;
theta = p/6+ alpha;
anchoPulso = 5; 
tCorto = 0.2;
t1 = fase1+theta;
t2 = fase2+theta;
t3 = fase3+theta;

sim('TP2_R3FMO_ctrl_2016.slx');clc;

%Valores sin falla para las comparaciones
tout_ =tout;
th1_ = th1;
th1_c_ = th1_c;
Vc_ = Vc;

% Falla
tCorto = 0.028;
sim('TP2_R3FMO_ctrl_2016.slx');clc;
Vc_ef_2C = Vc_ef(end);
Vc_m_2C = Vc_m(end);
icarga_ef_2C = icarga_ef(end);
icarga_m_2C = icarga_m(end);

%% 2)C)Gráficas
figure('units','normalized','outerposition',[0 0 1 1]);hold on; 
subplot(311);
plot(tout,v1, 'r--',tout,v2, 'g--',tout,v3, 'b--');hold on; 
plot(tout,p1, 'r',tout,p2, 'g',tout,p3, 'b');hold on; 
plot(tout, pCorto, 'k','LineWidth',1.1);hold on; 
legend('Vf_1','Vf_2','Vf_3','Trigger 1','Trigger 2','Trigger 3', 'Corto','Location','NorthEastOutside');
ylabel('Tensión (V)');
title('T3 Cortocircuitado: alfa=pi/2; P=100W; Q=100VAr; anchoPulso=5%');

subplot(312);
plot(tout, th1, 'k','LineWidth', 1.1); hold on;
plot(tout_, th1_, 'b--'); grid on;
legend('Vt_1 falla','Vt_1 normal','Location','NorthEastOutside');
ylabel('Tensión (V)');

subplot(313);
plot(tout, Vc, 'k','LineWidth', 1.1); hold on;
plot(tout_, Vc_, 'b--'); grid on;
legend('V_c falla','V_c normal','Location','NorthEastOutside');
ylabel('Tensión (V)');

xlabel('Tiempo [s]'); saveas(gcf,'RTMOC_T3_Cortocircuitado_DC_5_pi_2_100_w_100_VAr_I.png');

figure('units','normalized','outerposition',[0 0 1 1]);hold on; 
subplot(211);
plot(tout,Vc,'b',tout,Vc_ef,'k',tout,Vc_m,'r--');grid on;
ylabel('Tensión (V)');
legend('Instantánea','Eficaz','Media','Location','NorthEastOutside');
title('T3 Cortocircuitado: alfa=pi/2; P=100W; Q=100VAr; anchoPulso=5%');

subplot(212);
plot(tout,icarga,'b',tout,icarga_ef,'k',tout,icarga_m,'r--');grid on;
legend('Instantánea','Eficaz','Media','Location','NorthEastOutside');
ylabel('Corriente (A)');

xlabel('Tiempo [s]'); saveas(gcf,'RTMOC_T3_Cortocircuitado_DC_5_pi_2_100_w_100_VAr_II.png');

figure('units','normalized','outerposition',[0 0 1 1]);hold on; 
subplot(211);
plot(tout, th1_c, 'k','LineWidth', 1.1); hold on;
plot(tout_, th1_c_, 'b--'); grid on; 
ylabel('Corriente [A]');
title('T3 Cortocircuitado: alfa=pi/2; P=100W; Q=100VAr; anchoPulso=5%; Corriente por T1');

subplot(212);
plot(tout, th1_c, 'k','LineWidth', 1.1); hold on;
plot(tout_, th1_c_, 'b--'); grid on;
ylabel('Corriente [A]');
title('Acercamiento');
axis([0 0.1 0 5]);

xlabel('Tiempo [s]'); saveas(gcf,'RTMOC_T3_Cortocircuitado_DC_5_pi_2_100_w_100_VAr_III.png');

%%
% 1)
Vc_ef_2
Vc_m_2 
icarga_ef_2
icarga_m_2 

%1)A)
Vc_ef_2A
Vc_m_2A
icarga_ef_2A
icarga_m_2A 

%1)B)
Vc_ef_2B
Vc_m_2B
icarga_ef_2B
icarga_m_2B

%1)C)
Vc_ef_2C
Vc_m_2C
icarga_ef_2C
icarga_m_2C
