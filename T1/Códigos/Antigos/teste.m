clear all
clc
close

xe = -19; % distancia do CG ate a empenagem em metros (negativo porque é para trás), tirado do desenho em planta
xa = -0.5; %distancia do CG ate a asa em metros (negativo porque é para trás), tirado do desenho em planta
m = 50000; % mmasa da aeronave em kg, tirado do paper
Aa = 92.5; % area de referencia da asa em m², tirado do paper
ARa = 8; % Aspect Ratio da asa, tirado do paper
Ae = 26; % area de referencia da empenagem em m², tirado do paper
ARe = 5.6; % Aspect Ratio da empenagem, calculado no XFLR5
Vcz = 830/3.6; % Velocidade de cruzeiro tirada da wikipedia, convertida de km/h para m/s
h = 10000; % Altura de cruzeiro em metros, estimada com base na altura máxima tirada de diversas fontes
ea = 1; % Fator de correção de Oswald da asa
ee = 1; % Fator de correção de Oswald da empenagem

I = 2157603; % Inércia do avião em kg*m² estimada no CAD
g = 9.8; % aceleração da gravidade ao nível do mar em m/s²
ca = 3.57; % corda média da asa em metros, calculada no XFLR5
ce = 2.24; % corda média da empenagem em metros, calculada no XFLR5
W = m*g; % Peso da aeronave em Newtons
%Vmax = 890/3.6 % km/h -> m/s

%Calculando rho do ar, com dados e fórmula tirada do PPT

rho0 = 1.225; % Densidade do ar no nível do mar em kg/m³
lambda = -6.5/1000; % Constante que entra na equação em K/m
R = 287; % Constante universal dos gases em J/kgK
T0 = 288.15; % Temperatura de referência em K
rho = rho0*(1+lambda*h/T0)^(-(g/(lambda*R))-1); % Densidade do ar na altura em cruzeiro em kg/m³

%Thrust maximo (82.3kN tirado da General Electric)
Tmax = 2*82.3*10^3*rho/rho0; % N corrigindo pela densidade na altura de cruzeiro

%Coeficientes aerodinamicos com base nas contas preliminares, foi selecionado um perfil NACA, de onde foram tirados os coeficientes do XFLR5 e do database AirfoilTools.com

%Cl
cldeltae = -0.876;
cl0a  = 0.358;
cl0e =  -cl0a;
clalphaa = 0.088*180/pi; % para ficar em radianos~]
clalphae = clalphaa;

%Cd
cd0 = 0.008; % cd0 do perfil de asa
%cd0fus = (Tmax-0.5*rho*cd0*Vmax^2*(Aa+Ae))/(0.5*rho*Vmax*Vmax*Af)
cd0fus = 0.1*pi*3.35*3.35*0.25/Aa; %0.1 foi tirado do forum de aviacao para area frontal
cd0e = cd0; % cd0 empenagem
cd0a = cd0+cd0fus; % cd0 da asa mais a fuselagem

%Cm para o centro aerodinamico (1/4 de corda, conforme calculado no XFLR5)
cmaca = -0.05;
cmace = 0.05;

%Valores tirados do EES
Tcz = 30415.4924; % Thrust de equilíbrio em Newtons
alphacz = 0.0288763294; % angulo de ataque de equilibrio em radianos
deltaequilibrio = -0.157216933; % angulo do elevador na condição de cruzeiro em radianos

%Encontrando as matrizes do sistema linear


%Definindo variaves para economizar escrita

sacz = sin(alphacz); % seno do alpha de cruzeiro
cacz = cos(alphacz); % cosseno do alpha de cruzeiro
PdAa = 0.5*rho*Aa*Vcz^2; % Pressao dinamica * Areaa
DPdAa = rho*Aa*Vcz; % Derivada da pressão dinâmica * Aa na velocidade
PdAe = 0.5*rho*Ae*Vcz^2; % Pressao dinamica * Areae
DPdAe = rho*Ae*Vcz; % Derivada da pressão dinâmica * Ae na velocidade
DenCda = pi*ARa*ea; % Denominador do Cda
DenCde = pi*ARe*ee; % Denominador do Cde

%Fazendo derivadas parciais de cada termo, bem como forças e momentos, tudo na condição de equilibrio calculada no EES

%Sustentação Asa
cla = clalphaa*alphacz+cl0a;
La = PdAa*cla; % Sustentação gerada pela asa em newtons
DLaDv = DPdAa*cla; % Derivada de La na velocidade
DLaDgama = -PdAa*clalphaa; % Derivada de La em gama
DLaDtheta = PdAa*clalphaa; % Derivada de La em theta
DLaDdelta = 0;

%Sustentação empenagem
cle = +clalphae*alphacz+cl0e+cldeltae*deltaequilibrio;
Le = PdAe*cle; % Sustentação gerada pela empenagem em newtons
DLeDv = DPdAe*cle; % Derivada de Le na velocidade
DLeDgama = -PdAe*clalphae;%talvez sinal errado -> Acho que tava certo % Derivada de Le em gama
DLeDtheta = PdAe*clalphae;%talvez sinal errado -> Acho que tava certo % Derivada de Le em theta
DLeDdelta = PdAe*cldeltae;

%Arrasto Asa
cda = cd0a+(cla^2)/DenCda;
Da = PdAa*cda; % Arrasto gerado pela asa em newtons
DDaDv = DPdAa*cda; % Derivada de Da na velocidade
DDaDgama = PdAa*(clalphaa^2*(-2*alphacz)-2*clalphaa*cl0a)/DenCde; % Derivada de Da em gama
DDaDtheta = PdAa*(clalphaa^2*(2*alphacz)+2*clalphaa*cl0a)/DenCda; % Derivada de Da em theta
DDaDdelta = 0;

%Arrasto empenagem
cde = cd0e+(cle^2)/DenCde;
De = PdAe*cde; % Arrasto gerado pela empenagem em newtons
DDeDv = DPdAe*cde; % Derivada de De na velocidade
DDeDgama = PdAe*(clalphae^2*(-2*alphacz)-2*clalphae*cl0e-2*clalphae*cldeltae*deltaequilibrio)/DenCde;%talvez sinal do termo que multilpica dois cls tenha que inverter -> Acho que arrumei% Derivada de Dem em gama
DDeDtheta = PdAe*(clalphae^2*(2*alphacz)+2*clalphae*cl0e+2*clalphae*cldeltae*deltaequilibrio)/DenCde;%talvez sinal do termo que multilpica dois cls tenha que inverter -> Acho que arrumei % Derivada de De em theta
DDeDdelta = PdAe*(2*cl0e*cldeltae+2*clalphae*cldeltae*alphacz + 2*(cldeltae^2)*deltaequilibrio)/DenCde;

%Momentos
Ma = PdAa*ca*cmaca; % Momento gerado pela distribuicao de pressoes na asa em Nm
Me = PdAe*ce*cmace; % Momento gerado pela distribuicao de pressoes na empenagem em Nm

%Conferindo se derivadas do equilibrio sao nulas

Vdoteq = (Tcz*cacz-Da-De)/m;
Gamadoteq = (Tcz*sacz+La+Le-W)/(m*Vcz);
ThetaDDeq = (La*xa*cacz+Le*xe*cacz+Da*xa*sacz+De*xe*sacz+Ma+Me)/I;

%Derivadas parciais das equações

%Velocidade dot
DvdotDv = 1*(-DDaDv-DDeDv)/m;
DvdotDgama = 1*(Tcz*sacz-DDaDgama-DDeDgama-W)/m;
DvdotDtheta = 1*(-Tcz*sacz-DDaDtheta-DDeDtheta)/m;
DvdotDT = cacz/m;
DvdotDdelta = 1*(-DDeDdelta)/m;

%Gama dot
DgamadotDv = ((1*(DLaDv+DLeDv)*(m*Vcz))-m*(Tcz*sacz+La+Le-W))/((m*Vcz)^2);
DgamadotDgama = 1*(-Tcz*cacz+DLaDgama+DLeDgama)/(m*Vcz);
DgamadotDtheta = 1*(Tcz*cacz+DLaDtheta+DLeDtheta)/(m*Vcz);
DgamadotDT = sacz/(m*Vcz);
DgamadotDdelta = 1*(DLeDdelta)/(m*Vcz);

%Theta dot dot
DthetaddDv = 1*(DLaDv*xa*cacz+DLeDv*xe*cacz+DDaDv*xa*sacz+DDeDv*xe*sacz+DPdAa*ca*cmaca+DPdAe*ce*cmace)/I;
DthetaddDgama = 1*(DLaDgama*xa*cacz+La*xa*sacz+DLeDgama*xe*cacz+Le*xe*sacz+DDaDgama*xa*sacz-Da*xa*cacz+DDeDgama*xe*sacz-De*xe*cacz)/I;
DthetaddDtheta = 1*(DLaDtheta*xa*cacz-La*xa*sacz+DLeDtheta*xe*cacz-Le*xe*sacz+DDaDtheta*xa*sacz+Da*xa*cacz+DDeDtheta*xe*sacz+De*xe*cacz)/I;
DthetaddDT = 0;
DthetaddDdelta = 1*(DLeDdelta*xe*cacz+DDeDdelta*xe*sacz)/I;

%Montando o espaco de estados, fazendo x1 = V-Vcz, x2 = Gama, x3 = thetadot, x4 = theta-thetaeq, u1 = T - Tcz, u2 = delta - deltaequilibrio

%Modulos das perturbacoes
PertV = Tcz*0.1; % Forca em Newtons
PertGama = Tcz*0.1; % Forca em Newtons
PertThetad = 60000; % Momento em Nm

A = [DvdotDv,DvdotDgama,0,DvdotDtheta;DgamadotDv,DgamadotDgama,0,DgamadotDtheta;DthetaddDv,DthetaddDgama,0,DthetaddDtheta;0,0,1,0];
B = [DvdotDT, DvdotDdelta, PertV/m;DgamadotDT,DgamadotDdelta,PertGama/(m*Vcz);DthetaddDT,DthetaddDdelta,PertThetad/(I);0,0,0];
C = [1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1];
D = [0,0,0;0,0,0;0,0,0;0,0,0];

aviao = ss(A,B,C,D);

p=1;
t = linspace(0,2000,20000);

EntradaT = ones(1,length(t))*0;
EntradaDelta = ones(1,length(t))*0;
EntradaPert = zeros(1,length(t));

InicioEntradaP = [100,1100] ;
FimEntradaP = [400,1400] ;
SinalEntradaP = [0,0];
for i = 1:length(InicioEntradaP)
    EntradaPert(1,InicioEntradaP(i)/p:FimEntradaP(i)/p) = SinalEntradaP(i);
end

udegrau=[EntradaT;EntradaDelta;EntradaPert];
V0 = 1; 
Gamma0 = 0*pi/180;
ThetaDot0 = 0;
Theta0 = 0*pi/180;

x0 = [V0,Gamma0,ThetaDot0,Theta0];

[y,t,x] = lsim(aviao,udegrau,t,x0);
Velocidade = x(:,1) + Vcz;


figure(1)
hold on
plot(t,Velocidade)