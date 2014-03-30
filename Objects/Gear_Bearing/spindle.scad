$fn = 50;

union() {
  cylinder($fn = 6, r = 3.7, h = 30);

  difference () {
    cylinder(r = 20, h = 5);

    translate([0, 0, 2])
      union() {
        for(x = [1:36]) {
          rotate( x * 10 )
            rotate( [ 45, 0, 0 ] )
            linear_extrude(height = 10, center = true, convexity = 10, twist = 0)
            translate([20.5, 0, 0])
            rotate(45)
            square([1.5, 1.5], center = true);
          rotate( x * 10 )
            rotate( [ -45, 0, 0 ] )
            linear_extrude(height = 10, center = true, convexity = 10, twist = 0)
            translate([20.5, 0, 0])
            rotate(45)
            square([1.5, 1.5], center = true);
        }
      }
  }

  difference() {
    translate([0, 0, 5])
      cylinder(r = 13, h = 6);

    translate([0, 0, 11])
      rotate_extrude(convexity = 10)
      translate([13, 0, 0])
      circle(r = 6);
  }
}

