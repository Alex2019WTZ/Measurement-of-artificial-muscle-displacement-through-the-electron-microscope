
function [] = run_camera(hcam)
if ~exist('hcam','var'), hcam = initialize_camera(); end

val_max=0;

% c = uicontrol;
% c.String = 'Keep MAX';
% c.Callback = @refreashtwo;


while true 

%w=waitforbuttonpress
%if w==1
 p = get(gcf,'CurrentKey');
pause(0.1);
  if p == 'k'
   subplot(1,5,5);
   saved_focus = val_focus;
   fplot(saved_focus,'-b');
   ylim([0 20]);
   title('Maximum value saved');
   text(0,18,num2str(saved_focus));
   w=waitforbuttonpress
   clear p;
  end
%end

hsp1 = subplot(1,5,[1,2,3]);
hcam.cam.Acquisition.Freeze(uc480.Defines.DeviceParameter.Wait);% Acquire image
[~, tmp] = hcam.cam.Memory.CopyToArray(hcam.MemId);% Copy image from memory
Data = reshape(uint8(tmp), [hcam.Bits/8, hcam.Width, hcam.Height]);% Reshape image
Data = Data(1:3, 1:hcam.Width, 1:hcam.Height);
Data = permute(Data, [3,2,1]);
ImagePerFrame = imshow(Data);
title('Live Camera');
pause(0.01);
 
[val_focus, gray_img] = get_focus(Data);

% Display observed image and contrast value
val_max = max(val_max,val_focus);
change =abs(100*(val_focus-val_max)/val_max);
subplot(1,5,4);
fplot(val_focus,'-r');
ylim([0 20]);
title('Current contrast value ');
text(0,18,num2str(val_focus));
%subplot(4,4,[13,14,15,16]);
%fplot(val_max,'--b');
%ylabel(title(num2str(val_max)));
%title('Historical max contrast value ');
%subplot(4,4,[3,4,7,8]);
%fplot(change,'-.g');
%title('Percentage of displacement £¨%£© ');   
end

end

% function [h]=refreashtwo(src,event)
%      
% subplot(1,5,5);
% fplot(val_max,'-b');
% ylim([0 20]);
% title('Max Value');
% text(0,18,num2str(val_focus));
%  
% end
% 



