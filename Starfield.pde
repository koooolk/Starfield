//My code here
Particle stinky[];

void setup()
{
	size(600,600);
	background(132, 118, 219);
	frameRate(60);

	stinky = new Particle[500];

	for(int i=2;i<stinky.length;i++){

			stinky[i]=new NormalParticle();
			stinky[1]=new JumboParticle();
			stinky[0]=new OddballParticle();
	} 
}
void draw()
{
	for(int i=0;i<stinky.length;i++){
		stinky[i].show();
		stinky[i].move();
	}
}
interface Particle
{

	public void move();
	public void show();

}
class NormalParticle implements Particle
{
	double myX,myY,myAngle,mySpeed;

	NormalParticle(){

		myX=300;
		myY=300;
		myAngle=2*Math.PI*Math.random();
		mySpeed=10*Math.random();

	}
	public void move(){

		myX=myX+Math.cos(myAngle)*mySpeed;
		myY=myY+Math.sin(myAngle)*mySpeed;
		myAngle+=.005;
		
	}
	public void show(){

		fill(255,255,255);
	
		ellipse((float)myX,(float)myY,20.0,20.0);

	}
}
class OddballParticle implements Particle//uses an interface
{
	double myX,myY,myAngle,mySpeed;
	int turn=0;

	OddballParticle(){
		myX=300;
		myY=300;
		myAngle=2*Math.PI*Math.random();
		mySpeed=10*Math.random();
	}
	public void move(){
		if(myY==myX)turn+=1;
		if(turn%2==0){
			myX=myX+Math.cos(myAngle)*mySpeed;
			myY=myY+Math.sin(myAngle)*mySpeed;
			myAngle+= -.1;
		}
		else if(turn%2!=0){
			myX=myX+Math.cos(myAngle)*mySpeed;
			myY=myY-Math.sin(myAngle)*mySpeed;
			myAngle+= -.1;
		}
	}
	public void show(){
		fill(255,0,255);
	
		rect((float)myX,(float)myY,20.0,20.0);
	}

}
class JumboParticle extends NormalParticle//uses inheritance
{
		public void show(){
		fill(0255,150,255);
	
		ellipse((float)myX,(float)myY,30.0,30.0);
	}
}

