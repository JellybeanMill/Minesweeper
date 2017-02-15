int [][] bombField = new int[60][60];
public void setup()
{
	size(1000,600);
	for(int lp1=0;lp1<60;lp1++)
	{
		int toBombX = (int)(Math.random()*60);
		int toBombY = (int)(Math.random()*60);
		if(bombField[toBombX][toBombY]==1){lp1--;}
		else{bombField[toBombX][toBombY]=1;}
	}
}
public void draw()
{

}
class BombButton
{
	private int myX, myY, myDirective, myInfo;
	private boolean exposed;
	public BombButton(int x, int y, int direct)
	{
		myX = x;
		myY = y;
		myDirective = direct;
		exposed = false;
	}
	public void getInfo()
	{
		if(myDirective == 1)
		{
			
		}
	}
	public void show()
	{
		if (exposed == false){rect(((x+1)*10)+4,((y+1)*10)+4,10,10);}
		else ()
	}
}