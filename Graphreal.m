clc
a=[-1,3;1,1;1,-1;1,0;0,1]
b=[10,6,2,0,0]
c=[2,3]
x1=0:0.1:max(b)
x12=(b(1)-a(1,1)*x1)/a(1,2)
x22=(b(2)-a(2,1)*x1)/a(2,2)
x32=(b(3)-a(3,1)*x1)/a(3,2)
x12=max(0,x12)
x22=max(0,x22)
x32=max(0,x32)

plot(x1,x12,'r',x1,x22,'g',x1,x32,'b')
ylabel('output')
xlabel('input')
legend('-x1+3*x2>10','x1+x2>6','x1-x2>2')

sol=[]
for i=1:size(a,1)
    A1=a(i,:)
    B1=b(i)
    for j=i+1:size(a,1)
        A2=a(j,:)
        B2=b(j)
        A3=[A1;A2]
        B3=[B1;B2]
        X=A3\B3
        sol=[sol,X]
    end
end

x1=sol(1,:)
x2=sol(2,:)
y1=find(-x1+3*x2>10)
sol(:,y1)=[]
x1(y1)=[]
x2(y1)=[]
y2=find(x1+x2>6)

x1(y2)=[]
x2(y2)=[]

sol(:,y2)=[]
y3=find(x1-x2>2)
x1(y3)=[]
x2(y3)=[]
sol(:,y3)=[]
y4=find(x1<0)
x1(y4)=[]
x2(y4)=[]
sol(:,y4)=[]
y5=find(x2<0)
x1(y5)=[]
x2(y5)=[]
sol(:,y5)=[]

z=c*sol
[value,loc]=max(z)
value
sol(:,loc)

