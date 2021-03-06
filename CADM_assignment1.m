clc
fprintf("\t\tCloud points reflection\n")
p = [2 1 2 1;3 1 2 1;3 1.5 2 1;2.5 2 2 1;2 2 2 1;2 1 1 1;3 1 1 1;3 2 1 1;2 2 1 1;3 2 1.5 1];%cube points
p1 = [3 1.5 2];
p2 = [2.5 2 2];
p3 = [3 2 1.5];
tr_x = (p1(1)+p2(1)+p3(1))/3;
tr_y = (p1(2)+p2(2)+p3(2))/3;
tr_z = (p1(3)+p2(3)+p3(3))/3;%centroid of trinagle
%triangle points plane intersection
n = cross(p1-p2,p3-p2);% direction cosines
nx = n ./ sqrt(n(1)^2 + n(2)^2 + n(3)^2);%normaliztion
d = sqrt(nx(2)^2 + nx(3)^2);
cx = nx(1);
cy = nx(2);
cz = nx(3);%cosines
Txyz = [1 0 0 0; 0 1 0 0; 0 0 1 0;-tr_x -tr_y -tr_z 1];%translation to centroid
Ry = [d 0 cx 0;0 1 0 0;-cx 0 d 0;0 0 0 1];%rotaion about y
Rx = [1 0 0 0; 0 cz/d cy/d 0;0 -cy/d cz/d 0;0 0 0 1];%rotaion about x
Refl_z = [1 0 0 0;0 1 0 0;0 0 -1 0;0 0 0 1];%reflection about z-plane
T = Txyz*Rx*Ry*Refl_z*inv(Ry)*inv(Rx)*inv(Txyz);
p_transform = p*T;
t = tiledlayout(1,2); % Requires R2019b or later
nexttile
surf(p);
nexttile
surf(p_transform);