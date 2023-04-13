r = 0.8; sigma = 1/12; gamma = 1/10; beta = 0.9; N = 1000;
Si = 700; Ei = 250; Ii = 40; Ri = 10;

f = @(t,u)([-r*beta/N*u(1)*u(3); r*beta/N*u(1)*u(3)-sigma*u(2);sigma*u(2)-gamma*u(3); gamma*u(3)]);
t = 0:0.2:80;
u0 = [Si; Ei; Ii; Ri];
u = RK4System(f,t,u0);

plot(t, u(1, :), t, u(2, :), t, u(3, :), t, u(4, :), 'lineWidth', 1.5)
legend('S(t)', 'E(t)', 'I(t)','R(t)')
xlabel('Time')
ylabel('Individuals')
grid on

R0 = r * beta/gamma