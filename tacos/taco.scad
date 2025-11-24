// Open Taco, parametric taco modeling.
steps = 200;
xmin  = 0.01;
xmax  = 5;
scale = 10;
depth = 50;
module side(){
// first curve
curve1 = [
    for (i = [0:steps])
        let (
            x = xmin + (xmax - xmin) * i / steps,
            y = log(x)
        )
        [x*scale, y*scale]
];

// second curve (shifted)
curve2 = [
    for (i = [0:steps])
        let (
            x = xmin + (xmax - xmin) * i / steps,
            y = log(x)
        )
        [x*scale - 1, y*scale + 1]
];
linear_extrude(height = depth) 
difference() {
    color("yellow") polygon(curve2);
    polygon(curve1);
    
}
}
//side();

union(){
side();
translate([0,-35,depth])rotate([180,0,0]) side();
}
