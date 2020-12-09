function [ output ] = classifier_knn( c, s, k, train_features, rand_features )
% CLASSIFIER_kNN k-Nearest Neighbor Classifier
%   Given a number C of distinct classes, a number S of distinct samples
%   (images) from each class, a set of random objects (images) produced from the
%   original classes and their features, classify the random objects using
%   the k-Nearest Neighbors algorithm using the Euclidean distance as the
%   distance metric, then return the predictions
%
    [n, f] = size(rand_features); % Get the dimensions of random objects' maxtrix
    output=zeros(1,n,'uint8');    % Classifiers output (predictions)
    nn=zeros(1,k,'uint8');        % Nearest neighbors
    
    for i=1:n                     % For each random object
        
        dist=zeros(c*s,2);        % Matrix with col1: the Euclidean distance
                                  % between the random object and each sample of
                                  % the training set and col2: the sample's class
        
        for j=1:c                       % For each class
            for m=(j-1)*s+1:(j-1)*s+s   % For each class' sample
              
                % Calculate the Eucledian distance between the random object and
                % the class' sample. Also, keep a record of sample's class
                dist(m,1)=norm(rand_features(i,:)-train_features(m,:));
                dist(m,2)=j;
                
            end
        end
        
        dist=sortrows(dist,1);          % Sort matrix by the 1st row (distance)
                                        % in ascending order
        
        classes=dist(1:k,2);            % Get the class of the first k
                                        % rows of the matrix (k min distances)
        for j=1:c
            nn(j)=length(find(classes==j));   % Number of occurrences of class j
        end                                   % between the first k neighbors
        
        % Random object belongs to the class with the highest number of
        % occurrences between the first three rows
        output(i)=find(nn==max(nn),1);
        
    end
    
end