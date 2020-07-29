% UpdateMeans function is responsible for calculating the mean values of
% each cluster
% Inputs: A= a 3D array which contains the RGB values for each pixel
%         k= the total number of cluster values
%         clusters= a 2D array which contains the cluster values for each
%         pixel of the original image, for which it was assigned to
% Output: means= a 3D array which contains the mean values for each cluster
% author: D.Silva
function[means]=UpdateMeans(A,k,clusters)

% Assign variables to array values
[rows,cols,~]=size(A);

G=zeros(rows,cols,3);
for i=1:3 % loop through the layers in 3D array A
    for g= 1:k % loop through all the cluster values
        % find position values of each cluster
        position= find(clusters==g); 
        % same position value for all three layers
        G=A(:,:,i);
        % calculate means values for each cluster for all three layers and
        % insert into new array 'means'.
        means(g,1,i)= mean(G(position));
    end
end