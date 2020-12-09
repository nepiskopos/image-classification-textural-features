function [ output ] = classifier_minimum_distance( c, s, train_features, rand_features )
% CLASSIFIER_MINIMUM_DISTANCE Minimum Euclidean Distance Classifier for 2D images
%   Given a number C of distinct classes, a number S of distinct samples
%   (images) from each class, a set of random objects (images) produced from the
%   original classes and their features, classify the random objects using the
%   Minimum Euclidean Distance algorithm, then return the predictions
%
    [n,f] = size(rand_features);  % Dimensions of random objects' feature maxtrix
    output=zeros(1,n,'uint8');    % Classifier's output (predictions)
    gravity=zeros(c,f,'double');  % Classes' centers of gravity
    dists = zeros(1,c,'double');  % Vector of distances
    
    for i=1:c       % For each class
        
        % Calculate the class' gravity center using all of its samples
        gravity(i,:)=mean(train_features((i-1)*s+1:(i-1)*s+1+(s-1),:));
        
    end
    
    for j=1:n       % For each random object
        
        for i=1:c   % For each class
          
          % Calculate the Euclidean distance between the random object and 
          % each class' gravity center
          dists(i)=norm(rand_features(j,:)-gravity(i,:));
          
        end
        
        % Random object belongs to the class from which the distance is the
        % minimum between all classes
        output(j)=find(dists==min(dists),1);
        
    end
    
end