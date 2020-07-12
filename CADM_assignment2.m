    clear all
    clc
    fprintf('\t\t General Bezier plot\n')
    fprintf('______________________________________________________________\n')
    n=input('Enter number of control points for bezier curve: ');
    fprintf("Plot the bezier curve in graph");
    n1=n-1;
    axis([0 100,0,100])
    grid on
    grid minor
    [p]=ginput(n);


    for i=0:1:n1
        coeff(i+1)=factorial(n1)/(factorial(i)*factorial(n1-i));
    end
    J=[];
    D=[];
    for t=0:0.002:1
    for d=1:n
        %Blending functions for the given points
        J(d)=coeff(d)*((t^(d-1))*((1-t)^(n-d)));
    end
        D=cat(1,D,J);
    end
    B=D*p;
    line(B(:,1),B(:,2),'Color','g')
    line(p(:,1),p(:,2),'Color','k','Marker','o')
    grid minor
    title("Bezier curve for n points (Order n-1)");
    xlabel('postition in x');
    ylabel('position in y');
    legend('Bezier Curve','Actual curve','Location','southeast');
    grid minor




