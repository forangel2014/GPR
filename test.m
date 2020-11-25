clc, clear all, close all
rng(0,'twister');
N = 1000;
x = linspace(-10,10,N)';
y = sin(x) + 0.01*randn(N,1);
histfit(y);

% 2. Fit the model using 'exact' and predict using 'exact'.
gpr = fitrgp(x,y,'Basis','linear','Optimizer','QuasiNewton',...
    'verbose',1,'FitMethod','exact','PredictMethod','exact');

% 3. Plot results.
plot(x,y,'r');
hold on;
%%%%
z = linspace(-10,30,2*N)';
%%%%
plot(z,resubPredict(gpr),'b');
xlabel('x');
ylabel('y');
legend('Data','GPR fit');