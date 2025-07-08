k=[1 1;0.2 -0.3];
a=k.*inv(k)';
abs(a-1);
disp(a);
