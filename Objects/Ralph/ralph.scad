scale([2.5,2.5,3]) {
  difference(){
    cylinder(h=3, r=17.5, $fa=1);
    translate([-8.25,-13,0]) {
      scale([10,10,10]) {
        linear_extrude(height = 1)
          import_dxf("/Users/jyurek/Documents/3D/Objects/Ralph/ralph.dxf");
      }
    }
  }
  cylinder(h=0.25,r=17.5,$fa=1);
}
