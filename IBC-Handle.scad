include <Round-Anything/polyround.scad>
module inlay(){  
    difference(){
      cylinder(h=21, d=24, center=true);
        translate([0,20,0])
            cube([20,20,22], center=true);
        translate([0,-20,0])
            cube([20,20,22], center=true);
    }
}

module axle(){
    difference(){
        difference() {
            cylinder(h=27, d=36, center=true);
            translate([0,0,10.1])
            cylinder(h=7, d=30, center=true);
        }
        translate([0,0,0])
            inlay();
    }
}

module handle(){
    //Points
    p0=[0,0,0];
    p1=[30,0,5];
    p2=[100,80,3];
    p3=[80,80,3];
    p4=[30,25,3];
    p5=[0,25,0];
    points= [p0,p1,p2,p3,p4,p5];
    //linear_extrude(height=27)
    //    polygon(polyRound(points,2));
    polyRoundExtrude(points,27,0,3,fn=50);
}

//resolution
$fa = 1;
$fs = 0.4;

//Combine Elements
translate([18,0,12])
    cube([5, 5, 22], center= true);
axle();
mirror([1,0,0])
    rotate([0,0,-45])
        difference(){
        translate([10,-12,-13.5])
            handle();
            cylinder(h=30,d=31, center=true);
        }