module leg(x,y,z)
{
	boardWidth = 5.8;
	legWidth = 13;
	legEndWidth = 7;
	legHeight = 40;
	union(){	
		translate([x-(legEndWidth/2),y,z])cube([legEndWidth,boardWidth,boardWidth],false);
		translate([x-(legWidth/2),y,z-(legHeight-0.01)])cube([legWidth,boardWidth,legHeight],false);
	}
}

module endBlock(x,y,z){
	boardWidth = 5.8;
	width = 15;
	height = 20;
	depth = 24;
	bodyWidth = 2;
	stopScrew = 13.5;
	difference(){
		difference(){
			union(){
				translate([x,y+boardWidth+bodyWidth+1,z-(height-5)]){
					rotate([90,0,0]){
						cylinder(r1=3,r2=5,h=bodyWidth+2,$fs=0.5);
					}
				}
				difference(){
					hull(){
						translate([x-(width/2),y-bodyWidth,z-(height)]){
							cube([width,boardWidth+(bodyWidth*2),bodyWidth],false);
						}
						translate([x-(width/2),y-(depth-boardWidth-bodyWidth),z-(boardWidth)]){
							cube([width,depth,boardWidth],false);
						}
					}
					translate([x-(width/2)+(bodyWidth),y-(depth-boardWidth-bodyWidth),z-(height)]){
						cube([width-(bodyWidth*2),depth-(boardWidth+3),height-boardWidth],false);
					}	
				}
			}
			translate([x,y+boardWidth+bodyWidth+2,z-(height-5)]){
				rotate([90,0,0]){
					cylinder(r=1.5,h=bodyWidth+3,$fs=0.5);
				}
			}
		}
		translate([x,y-(bodyWidth-boardWidth+stopScrew),z-(boardWidth+2)]){
			cylinder(r=1.5,h=bodyWidth+105,$fs=0.5);
		}
	}
}

mirror([0,0,1])difference(){
	endBlock(0,0,0);
	#leg(0,0,-5.79);
}