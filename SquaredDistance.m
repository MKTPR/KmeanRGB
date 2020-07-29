% SquaredDistance function calculates the squared distance between two
% points in 3D space
% Inputs: P= an array which contains the colour values for a pixel, 
%         interpreted as a point in 3D space.
%         Q= an array which contains the colour values for a pixel, 
%         interpreted as the second point in 3D space.
% Output: squaredDistance= the distance between the two
%         points in 3D space squared
% author: D.Silva
function squaredDistance= SquaredDistance(P,Q)

% Calls upon the 1st, 2nd 3rd value of each array to calculate the
% sum of the differences between the elements in the array and squares it
squaredDistance= (P(1)-Q(1))^2 + (P(2)-Q(2))^2+ (P(3)-Q(3))^2;
