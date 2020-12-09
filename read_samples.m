function [ features ] = read_samples( dir, c, s )
% READ_SAMPLES Calculates the Hu invariant moments of images
%   Given C distinct classes and S samples (mosaic grayscale images) from each
%   class, read these samples and calculate their features
%
    features=zeros(c*s,3,'double');   % Matrix to save all features
    classes=zeros(1,c*s,'uint8');     % Vector to save all classes

    for texture=1:c                   % For every class
        for item=1:s                  % For every sample of that class
            
            im=imread([dir,'ld_smpl_',num2str(texture),'_',num2str(item),'.tif']);
            
            % Constuct 8x8 Cooccuraance Matrix
            sss=graycomatrix(im,'offset',[0 1]);
            
            % Compute 'contrast','homogeneity','Correlation' from the
            % Cooccurance Matrix
            stats = graycoprops(sss,{'Contrast','Homogeneity','Energy'});
            
            % Be careful! stats is a stuctured variable
            features((texture-1)*s+item,1)=stats.Contrast;
            features((texture-1)*s+item,2)=stats.Homogeneity;
            features((texture-1)*s+item,3)=stats.Energy;
            
            classes((texture-1)*s+item)=texture;

        end
    end
end