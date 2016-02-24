function correlation_plot(f)
%����Եķֲ�ͼ
x=mod(floor(rand(1,10000)*10000),511)+1;
y=mod(floor(rand(1,10000)*10000),511)+1;
z=x;
v=y+1;
for i=1:10000
    a(i)=f(y(i)+(x(i)-1)*512);
    b(i)=f(v(i)+(z(i)-1)*512);
end
figure,plot(a,b,'.');
axis([1,250,1,250]);
xlabel('pixel gray value on location (x,y)');
ylabel('pixel gray value on location (x,y+1)');