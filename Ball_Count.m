function Ball_Count(imt)
im1 = imread(imt);
imshow(im1);
%img1 = rgb2gray(im1);
%imgthresh = graythresh(im1);
 im = im2double(im1);
 
 for i = 1:3
    im1          = im(1:3:end,1:3:end,i);     % SUB-SAMPLING THE IMAGE
    flsb         = fspecial('sobel') / 8;
    dFdy         = imfilter( im1, flsb, 'same' );
    dFdx         = imfilter( im1, flsb', 'same' );
    dFmag        = sqrt( dFdy.^2 + dFdx.^2 );
    
    dFmag(dFmag<= 0.17) = 0;
    dFmag(dFmag> 0.17) = 1;
    if i==1
        DF = dFmag;
    else
        DF = imadd(DF,dFmag);  
    end
 end

DF = im2bw(DF, graythresh(DF));
DF = bwareaopen(DF,50);

DF = imfill(DF,'holes');

im = strel('disk', 1);
DF = imopen(DF,im);

im = strel('disk', 2);
DF = imerode(DF,im);

im = strel('disk',2);
DF = imopen(DF,im);

im = strel('disk', 3);
DF = imopen(DF,im);

im = strel('disk', 3);
DF = imopen(DF,im);

im = strel('disk',3);
DF = imerode(DF,im);

im = strel('disk',3);
DF = imopen(DF,im);

im = strel('disk',1);
DF = imerode(DF,im);

%DF = imfill(DF,'holes');
[B,L] = bwboundaries(DF,'noholes');
%stats=regionprops(img7,'Area');
%centroids = cat(1, STATS.Centroid);
imshow(DF)
%plot(centroids(:,1), centroids(:,2), 'r*')
display(length(B));%display(count);
 

end

