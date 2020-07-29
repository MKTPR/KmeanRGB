% SelectKRandomPoints function is responsible for randomly selecting
% k number of pixel co-ordinates from the array created from the image A
% Inputs:  A= a 3D image array to select the pixel co-ordinates from
%          k= the number of pixel co-ordinates to select randomly
% Output:  points= a 2D array containing k rows and 2 columns, representing
%          the row and column values for each pixel
% author:  D-Silva
function [points]=SelectKRandomPoints(A,k)


% Assign variables to array values
[rows,cols,~]=size(A);

%Pre-allocate output array
points=zeros(k,2);

% creates a single array with k number of position values which are
% randomly selected withourt repeating values
% function used: 'randperm'
% Retrieved from: https://au.mathworks.com/help/matlab/ref/randperm.html
X=randperm(rows*cols,k); 

% loops through each value in array X to change position values into
% row and column values
for g=1:k 
    
    % Calculates the row at which the pixel is in
    %'rem' function used 
    % retrieved from: https://au.mathworks.com/help/matlab/ref/rem.html
    i=rem(X(g),rows); %the remainder of the division is the row number
    % if there is no remainder, the row number is equal to the number of 
    % rows in array A
    if i==0 
        i=rows;
    end
    
    % Calculates the column at which the pixel is in
    %'ceil' function used
    % retrieved from: https://au.mathworks.com/help/matlab/ref/ceil.html
    j=ceil(X(g)/rows);
    
    points(g,1)=i; % Assign row values for each position value
    points(g,2)=j; % Assign column value for each position value
end



