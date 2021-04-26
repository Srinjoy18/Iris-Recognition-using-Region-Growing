clc
clear all
close all
Image = im2double(imread('file1.jpg'));
%Image = rgb2gray(Image);
%Image = interp2(xx,yy,a,xi,yi,'*nearest');
I = Image(:, :, 1); %read the first channel (R-channel)
I = im2double(I); %transform to double
figure, imshow(I)
%imtool(I);
Isizes = size(I); %size of the image
row = Isizes(1, 1);
col = Isizes(1, 2);
threshI = 1;
[m, n]=ginput(1); %pick one pixel of the region to be segmented
m = round(m);
n = round(n);
c = impixel(I, m, n);
currPix = c(1);

surr = [-1 0; 1 0; 0 -1; 0 1];
mem = zeros(row*col, 3); 
mem(1, :) = [m, n, currPix];

J = zeros(row, col);
JTrue = zeros(row, col);

init = 0;
posInList = 1;
k=1;
while(k==1)
    
  for l=init:posInList
  for j=1:4
        m1 = m + surr(j,1);
        n1 = n + surr(j,2);
        
        check=(m1>=1)&&(n1>=1)&&(m1<=row)&&(n1<=col);
        
        current = impixel(I, m1, n1);
        currPix = current(1);
        if(check && (currPix<=threshI) && (J(m1, n1)==0))
            posInList = posInList+1;
            mem(posInList, :) = [m1, n1, currPix];
            J(m1, n1) = 1;
            JTrue(m1, n1) = currPix;
        end
  end
  end
  if(posInList == init)
      k = 0;
  else
      init = init+1;
      m = mem(init, 1, :);
      n = mem(init, 2, :);
      k = 1;
  end
end
figure, imshow(J')
figure, imshow(JTrue')
