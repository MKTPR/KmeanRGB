% KMeansRGB function partitions the points in an image into k clusters,
% using the k-means algorithm to do so.
% Inputs: A= a 3D array which contains an RGB image.
%         seedMeans= seedMeans= a 3D array which contains the colour 
%         information for each pixels from the image, used to initialise
%         the k-means algorithm
%         maxiteration= the maximum number of iterations to perform
% Outputs: clusters= a 2D array which contains the cluster values for each
%          pixel of the original image, for which it was assigned to
%          means= means= a 3D array which contains the mean values for
%          each cluster
% author: D.Silva
function[clusters,means]= KMeansRGB(A,seedMeans,maxiteration)

count=1; % make variable 'count' to use for while loop

% Assign variables t array values
[rows,~,~]=size(seedMeans);
k=rows; % Obtain k value to use for UpdateMeans function

clusters=AssignToClusters(A,seedMeans);% obtain initial cluster positions
means=UpdateMeans(A,k,clusters);

while count<maxiteration % Condition for loop to limit the iteration number
    % 'isequal' function used
    % retrieved from: https://au.mathworks.com/help/matlab/ref/isequal.html
    x = isequal(seedMeans,means);
    if x==0 % check for convergence
        seedMeans=means; % re-assign new means for seedMeans
        % input new means into AssignToClusters function to reassign
        % clusters
        clusters=AssignToClusters(A,means);
        means=UpdateMeans(A,k,clusters); %Calculate new cluster means
        count=count+1;
    else % Stop loop before it reaches max iteration number, if convergence
        % is achieved (seedMeans==means)
        count= count+ maxiteration;
    end
end
x = isequal(seedMeans,means);
if x==0
    % Message for convergence not reached, by the limiting conditions.
    disp('Maximum number of iterations reached before convergence was achieved')
end