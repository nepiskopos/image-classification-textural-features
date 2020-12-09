function [ features ] = read_randoms( dir, n, m )
% READ_RANDOMS Calculates the three feature components of each sub-texture
%   Given a mosaic image that consists of NxM images of size 64x64, read
%   the mosaic image, compute compute the three feature components and
%   return a NxMx3 matrix with the features

    im=imread([dir,'random_textures.tif']);
    features=zeros(n*m,3);
    
    p=1;
    [k,l]=size(im);
    
    for i=1:k/n:k
        for j=1:l/m:l
            
            part=uint8(im(i:i+63,j:j+63));
            
            % Constuct 8x8 Cooccuraance Matrix
            sss=graycomatrix(part,'offset',[0 1]);

            % Compute 'contrast','homogeneity','Correlation' from the
            % Cooccurance Matrix
            stats = graycoprops(sss,{'Contrast','Homogeneity','Energy'});

            % Be careful! stats is a stuctured variable
            features(p,1)=stats.Contrast;
            features(p,2)=stats.Homogeneity;
            features(p,3)=stats.Energy;
            
            p=p+1;
            
        end
    end
    
%     % Read the from GroundTrue.dat the N*M labels of the generated textures
%     vol=fopen([dir,'GroundTrue.dat'],'r');
%     classes=fscanf(vol, '%d\t')';
%     classes=uint8(classes);
%     fclose (vol);
    
end