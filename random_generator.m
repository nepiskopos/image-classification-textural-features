function [ GnrtTxtr ] = random_generator( sdir, tdir, c, n, m )
% RANDOM_GENERATOR Generates figures from existing classes
%   Generates N objects (mosaic grayscale images) randomly selected from the
%   prototype C classes by applying distortion with random rotation, shift, zoom and noise
%
    % Initialaise random number generator of MATLAB
    rand('state',sum(100*clock));
    
    % Read the C prototype textures
    MulIma=zeros(6,256,256,'uint8');  % 3 dimension array to save all C
                                      % prototype images
    for i=1:c
        MulIma(i,:,:)=imread([sdir,'120', num2str(i),'rf.tif']);
    end
    
    RandTexture=ceil(rand(n,m)*6);  % Generate an array NxM with random
                                    % integers in the interval [1,6]
%     disp('The Constructed array of textures consists of:')
%     disp(RandTexture);
    GnrtTxtr=RandTexture';
    
%     % Save in GroundTrue.dat the N*M labels of the generated textures
%     vol=fopen([tdir,'GroundTrue.dat'],'w');
%     fprintf(vol,'%d\t',GnrtTxtr(:));
%     fclose(vol);

    % Generate Image-array of textures according  to the array of numbers
    Texture_samples=zeros(256,320,'uint8');
    for i=1:n
        for j=1:m
            v1=ceil(rand(2,1)*192)+1;   % Select randomly a part of 64x64 from 
            v2=ceil(rand(2,1)*192)+1;   % 256x356 initial texture
            % Use squeeze cmd for coping data from 3D to 2 or 1 D arrays
            Texture_samples(((64*(i-1))+1):((64*(i-1))+64),((64*(j-1))+1):((64*(j-1))+64))...
                =squeeze(MulIma(RandTexture(i,j),v1:v1+63,v2:v2+63));
        end
    end
    
    % Save the constructed mosaic image
    imwrite(Texture_samples,[tdir,'random_textures.tif']);
    
    GnrtTxtr=GnrtTxtr(:)';
end