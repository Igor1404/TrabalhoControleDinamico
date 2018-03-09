    clc
%Utilizando o compensador de atraso

syms s;

%Não compensado
n = 2;
d = [1 6 5 0];
K = 2;
G = tf(n,d)
G1 = K*G


Gnc = feedback(G,1)


figure(1);
step(Gnc)
grid on;

%Margem de fase e de ganho do sistema não compensado
figure(2)
margin(G1)
grid on;


figure(3)
rlocus(G1)

% nc = [3.15 9 6.428]
% dc = [1 0]

% % % % % Função de transferencia do controlador
 nc = [6.3 36.9 66.8 38.4];
 dc = [1 0];
%  
 
Gc = tf(nc,dc)
Gcc = Gc*G1;
GMFC = feedback(Gcc,1)
% % % % % % Degrau do Sistema compensador por atraso

figure(4)
step(GMFC)
grid on

%%%Rlocus controlada
figure(5)
rlocus(GMFC);

% % % % % Margem de fase e de ganho do sistema compensado
figure(6)
margin(GMFC)
grid on


figure(7)
nyquist(GMFC)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pp = zpk([-0.0009],-0.80,1)
% sys = tf(pp)
% G3c = sys*Gcc;
% 
% GG3 = feedback(G3c,1)
% 
% figure(5)
% step(GG3)
% grid on
% 
% figure(6)
% margin(GG3)
% grid on

