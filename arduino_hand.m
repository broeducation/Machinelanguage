clear
se=strel('square',10);
nob=0;
j=0;

var=webcam( 'Integrated Webcam');
 while(1)
    snap=snapshot(var);
    snap=flip(snap,2);
    green=snap(:,:,2);
    gray=rgb2gray(snap);
    img=(green-gray);
    img=(img*3);
    img=im2bw(img,0.17);
    im=bwareaopen(img,500);
    io=imdilate(im,se);
    rp=regionprops('table',io);
    rps=[rp.Centroid];   %for finding centroid
    bx=[rp.BoundingBox]  ;  %for making boundingbox
    [var1 var2]=bwlabel(io); %var1=have object && var2= have no of object
    k=var2;
    
    
    disp(var2);
    vam=num2str(var2);
    vamw=strcat(vam,'object task execute');
    disp(vamw)
    j=num2str(k);
    subplot(1,2,1),imshow(snap);
    subplot(1,2,2),imshow(io);
    hold on
    xlabel(j)
    hold on
    if(k>0)
        tts(vamw);
       % clear a
        %a=arduino('COM7','uno');
        %writeDigitalPin(a, 'D13', 1);
        %delete(instrfindall);
     y=rps(:,2);
     xaxis=rps(:,1);
     xmax=max(rps(:,1));
     ymax=max(rps(:,2));
     [rc cc]=size(y);
     ymaxstr=num2str(ymax);
     
     
     
     
        for i=1:rc
           er=strcat('ymax=',ymaxstr);
          if(y(i)==ymax)
           pr=rps(i,:);
           sn=pr(1,1);
           rt=pr(1,2);
           plot(sn,rt,'*g');
           hold on
           break;
          end
         end 

        for i=1:k
           pr=rps(i,:);
           sn=pr(1,1);
           rt=pr(1,2);
           hold on
           plot(xaxis(i),y(i),'*g');
           hold on
           line([sn xaxis(i)],[rt y(i)]);
           hold on
        end
    
    
    
    end
 end