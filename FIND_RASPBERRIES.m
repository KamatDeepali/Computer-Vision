function HW06_ddk9074_FIND_RASPBERRIES(filem)
 
%reads in mage
im_rgb= imread(filem);
 
% aligns image at following coordinates in figure
figure('Position',[10 10 1024 768]);
imshow( im_rgb );
 
%selecting raspberry points in the image 
fprintf('SELECT FOREGROUND OBJECT:\n');
fprintf('Click on points to capture positions. Hit return to end...\n');
[x_fg, y_fg] = ginput();
 
%converting image to hsv
im_hsv = rgb2hsv( im_rgb );

%taking the hue and value points of the image
imhue = im_hsv(:,:,1);
imvalue = im_hsv(:,:,3);
 
fg_indices = sub2ind( size(imhue), round(y_fg), round(x_fg) );
fg_hues = imhue( fg_indices );
fg_values = imvalue( fg_indices );
 
feature_vec =[fg_hues fg_values]
 
im_testhsv = rgb2hsv(im_rgb);
gry_im=rgb2gray(im_rgb);
imhue = im_testhsv(:,:,1);
imvalue = im_testhsv(:,:,3);
test_features= [imhue(:) imvalue(:)];
d = mahal(test_features,feature_vec);
 
gry_im(ind2sub(size(im_testhsv),find(d<=1)))=0;
gry_im(ind2sub(size(im_testhsv),find(d>1)))=255;
figure;
imshow(im2uint8(im_rgb));
 
figure(2)
imshow(im2uint8(gry_im));

end