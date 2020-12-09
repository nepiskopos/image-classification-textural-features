function [ Generated_shapes ] = sample_generator( sdir, tdir, c, s )
% SAMPLE_GENERATOR Generates figures from existing classes
%   Generates C*S mosaic grayscale figures from the original C classes
%   (S figures from each class), and distorts them with random rotation,
%   shift and zoom
%
    Lst=[1 1 129 129 ];
    Cst=[1 129  1 129 ];
    
    Generated_shapes=zeros(1,c*s,'uint8');

    for ishape=1:c
        filename=[sdir,'120',int2str(ishape),'rf.tif'];
        im=imread(filename);
        for jshape=1:s
            ims=im(Lst(jshape):Lst(jshape)+127,Cst(jshape):Cst(jshape)+127);
            imwrite(ims,[tdir,'ld_smpl_',int2str(ishape),'_',int2str(jshape),'.tif']);
            idx=(ishape-1)*s+jshape; %Index in the random numbers table
            Generated_shapes(idx)=ishape;
        end
    end
    
end