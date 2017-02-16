private int [][] bombField = new int[60][60];
private ArrayList<BombButton>deButtons = new ArrayList<BombButton>();
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
	for(int lp1=0;lp1<60;lp1++)
	{
		for(int lp2=0;lp2<60;lp2++)
		{
			deButtons.add(new BombButton(lp2,lp1,bombField[lp1][lp2]));
		}
	}
}
public void draw()
{
	for(int lp1=0;lp1<deButtons.size();lp1++)
	{
		deButtons.get(lp1).show();
	}
}
public void mouseClicked()
{
	int locateX = (int)(mouseX/10.0);
	int locateY = (int)(mouseY/10.0);
	if(locateX<=60)
	{
		deButtons.get(locateX+(locateY*60)).engage();
	}
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
		myInfo = 0;
	}
	public void getInfo()
	{
		if(myDirective == 0)
		{
			if(bombField[myX-1][myY-1]==1){myInfo++;}
			if(bombField[myX][myY-1]==1){myInfo++;}
			if(bombField[myX+1][myY-1]==1){myInfo++;}
			if(bombField[myX-1][myY]==1){myInfo++;}
			if(bombField[myX+1][myY]==1){myInfo++;}
			if(bombField[myX-1][myY+1]==1){myInfo++;}
			if(bombField[myX][myY+1]==1){myInfo++;}
			if(bombField[myX+1][myY+1]==1){myInfo++;}
		}
	}
	public void show()
	{
		rectMode(CENTER);
		if (exposed == false)
		{
			fill(169,169,169);
			rect(((myX)*10)+5,((myY)*10)+5,10,10);
		}
		else
		{
			if(myDirective==0)
			{
				fill(225);
				rect(((myX)*10)+5,((myY)*10)+5,10,10);
				fill(0);
				textSize(9);
				textAlign(CENTER,CENTER);
				text(myInfo,((myX)*10)+5,((myY)*10)+5);
			}
		}
	}
	public void engage()
	{
		exposed=true;
		if(myDirective==0)
		{

		}
	}
}