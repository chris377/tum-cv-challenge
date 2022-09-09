function [foreground,im2] = get_foreground(im)
% this function helps the user to get the foreground
[X,Y,D]=size(im);
figure('Name','please cut off the foreground','NumberTitle','off');
imshow(im);

% begin to choosing the point
h = drawfreehand;
mask = createMask(h);

% filling
im2 = inpaintExemplar(im,mask,'FillOrder','tensor','PatchSize',18);
mask2=-1*(mask-1);
foreground = uint8(255.*mask.*im);
foreground = foreground+uint8(255.*mask2);

close;

end

