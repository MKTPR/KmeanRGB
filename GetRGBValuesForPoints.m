% GetRGBValuesForPoints fuction is responsible for extracting the RGB
% values of the list of specified points from a 3D array
% Inputs: A= a 3D image array which contains the RGB values for the points
%         P= a 2D array of k rows and 2 columns containing the row and
%         column values for each of the points
% Output: seedMeans= a 3D array containing k rows, 1 column, and 3 layers
%         containing the colour information for each pixels from the image
% author: D.Silva
function [seedMeans]= GetRGBValuesForPoints(A,P)

% Assign variables to array values
[rows,~]=size(P);

for i= 1:rows % loop through all rows
    for k= 1:3 % loops through layers 1,2 and 3
       % Uses row number 'A(P(i))' and column number A(P(i+rows) to
       % extract RGB value from array A and inset into array 'seedMeans'
        seedMeans(i,1,k)= A(P(i),P(i+rows),k);
    end  
end

