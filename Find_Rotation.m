function Find_Rotation(imagec)

im1 = imread(imagec);
imshow(im1);
fprintf('Select input points from image\n');
fprintf('Press enter after selection\n');
Xmat = ginput();
Xmat = Xmat';

num = fopen('PtsFile.txt','wt');
for i = 1:size(Xmat,1)
    fprintf(num,'%g\t',Xmat(i,:));
    fprintf(num,'\n');
end
fclose(num);

im2 = imread(‘image_in2.jpg');
imshow(im2);
fprintf('select points from image\n');
fprintf('Press enter after selection\n');
Ymat = ginput();
Ymat = Ymat';

num2 = fopen('PtsFile2.txt','wt');
for j = 1:size(Ymat,1)
    fprintf(num2,'%g\t',Ymat(j,:));
    fprintf(num2,'\n');
end
fclose(num2);

Xfinal = [Xmat;ones(1,size(Xmat,2) )];
Yfinal = [Ymat;ones(1,size(Ymat,2) )];
val = Yfinal/Xfinal;
disp(val)