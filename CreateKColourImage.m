% The CreateKColourImage function creates a k-colour image for an image 
% that has had its pixels divided into k clusters.  All pixels in a given 
% cluster will be recoloured using the mean colour values for that cluster
% Inputs: clusters,  A 2D array with m rows and n columns, specifying which
%         cluster each pixel belongs to 
%         means,A 3D array containing k rows, 1 column and 3 layers, where
%         each row contains the mean colour values for the cluster 
%         corresponding to that row number.  E.g. the mean R, G and B 
%         values for cluster 1 will be stored in row 1.  The mean R, G and
%         B values for cluster 2 will be stored in row 2 and so on
% Output: myImage, It returns a single output, A 3D array of unsigned 8 bit
%         integers with m rows, n columns and 3 layers, representing an RGB
%         image.  The colour of each pixel in the image is determined by 
%         the colour associated with that cluster.  E.g. all pixels in 
%         cluster 1 will be coloured using the RGB values from row 1 of the
%         second input.
% author: D.Silva

function [myImage]= CreateKColourImage(clusters,means)

% converts double values into rounded uint8 values
A=round(uint8(means));

% Assign variables to array values
[rows,cols,~]=size(clusters);

% loop through rows and cols
for i= 1:rows
    for j=1:cols
        for k=1:length(means) % loop through all the clusters
            if clusters(i,j)==k %find co-ordinates of the pixels
                for l= 1:3
                    % assign cluster means into the new arrays to their
                    % respective positions
                    myImage(i,j,l)= A(k,1,l);
                end
            end
        end
    end
end


