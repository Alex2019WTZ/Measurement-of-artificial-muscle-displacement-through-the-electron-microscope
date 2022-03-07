function [Exit] = database_displacement(val_focus,saved_max)
Diff_focus = saved_max - val_focus;
Current_scale = 0;
Estimated_focus = 0;

% guess current_scale
while Estimated_focus - val_focus  ~=0    
Estimated_focus = (-0.387)*Current_scale^2 + 47.996*Current_scale -919.5;
Current_scale = Current_scale + 1;
end 


 if 6.5< val_focus&saved_max <12.622  
    Exit =  Current_scale;  
    
 else
    Exit =0; 
 end
 
 
end









 %Estimated_focus = (-0.387)*Current_scale^2 + 47.996*Current_scale -919.5;