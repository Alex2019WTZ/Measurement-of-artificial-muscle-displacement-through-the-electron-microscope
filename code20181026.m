hcam = initialize_camera;
try
run_camera(hcam);
catch ex
    fprintf(ex.message);
end
%camera_release(hcam);