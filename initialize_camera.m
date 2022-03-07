function [hcam] = initialize_camera()
% Initialise contrast variable which will be used for comparison
val_focus_prev = 0;
% Initialise variable for maximum recorded contrast
val_max = 5;
% Add NET assembly
% May need to change specific location of library
NET.addAssembly('C:\Windows\System32\uc480DotNet.dll');
hcam.cam = uc480.Camera; % Create camera object handle
hcam.cam.Init(0); % Open the 1st available camera
hcam.cam.Display.Mode.Set(uc480.Defines.DisplayMode.DiB); % Set display mode to bitmap (DiB)
hcam.cam.PixelFormat.Set(uc480.Defines.ColorMode.RGBA8Packed); % Set color mode to 8-bit RGB
hcam.cam.Trigger.Set(uc480.Defines.TriggerMode.Software); % Set trigger mode to software (single image acquisition)
[~, MemId] = hcam.cam.Memory.Allocate(true); % Allocate image memory
[~, Width, Height, Bits, ~] = hcam.cam.Memory.Inquire(MemId); % Obtain image information
warning('off','images:initsize:adjustingMag');% Turn off warning for too big image
hcam.MemId = MemId;
hcam.Width = Width;
hcam.Height = Height;
hcam.Bits = Bits;
end