% AssignToClusters function assigns each pixel of an image to it's nearest
% cluster based on the cluster means
% Inputs: A= a 3D array which contains the RGB values for each pixels
%         seedMeans= A 3D array which contains the colour information for
%         each of k means(the cluster means to compare with the RGB values)
% Output: cluster= a 2D array which contains the cluster values for each
%         pixel of the original image, for which it was assigned to
% author: D.Silva
function [clusters]= AssignToClusters(A,seedMeans)

% Assign variables to array values
[rows,cols,~]=size(A);
[ROWS,~,~]=size(seedMeans);

% Pre-allocate array for clusters to optimise
clusters=zeros(rows,cols);
B=zeros(1,ROWS);
squaredDistance=zeros(rows,cols,ROWS);

for k= 1:ROWS % loop through all the seedMeans
    % Partly-vectorised, calculate the squaredDistances for between the
    % image and the seedMeans for each cluster and store in an array
    squaredDistance(:,:,k)=(A(:,:,1)-seedMeans(k,1,1)).^2 + ...
        (A(:,:,2)-seedMeans(k,1,2)).^2 + (A(:,:,3)-seedMeans(k,1,3)).^2;
end

for i= 1:rows % loop through all the rows
    for j=1:cols % loop through the columns
        % find which cluster the shortest squaredDistace belongs to
        [x,y]=min(squaredDistance(i,j,:));
        
        clusters(i,j)=y; % store in a new array 'clusters'
    end
end

