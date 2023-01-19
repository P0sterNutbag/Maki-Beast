camera = camera_create();

global.cam_width = 256;
global.cam_height = 144;
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(global.cam_width,global.cam_height,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

follow = objPlayer;
xto = 0;
yto = 0;
alarm[1] = 1;

xOffset = 0;
yOffset = 0;
x_offset_player = 0;
y_offset_player = 0;

screenshake = 0;
screenshake_x = 0;
screenshake_y = 0;

/* Activation box
left = objPlayer.x-200;
top = objPlayer.y-130
width = 550;
height = 300;

alarm[0] = room_speed/2;

