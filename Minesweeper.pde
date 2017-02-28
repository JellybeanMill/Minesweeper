public final static int gridNum = 30;
private BombButton [][] deButtons = new BombButton[30][30];
private int amountran = 0;
private int sweepers = 10;
private int defusers = 200;
private boolean gameover = false;
private boolean defusing = false;
public void setup()
{
	size(1000,600);
	for(int lp1=0;lp1<gridNum;lp1++)
	{
		for(int lp2=0;lp2<gridNum;lp2++)
		{
			deButtons[lp2][lp1] = new BombButton(lp2,lp1,0);
		}
	}
	for(int lp1=0;lp1<125;lp1++)
	{
		int toBombX = (int)(Math.random()*30);
		int toBombY = (int)(Math.random()*30);
		if(deButtons[toBombX][toBombY].getDirective()==1){lp1--;}
		else{deButtons[toBombX][toBombY].setDirective(1);}
	}
	for(int lp1=0;lp1<gridNum;lp1++)
	{
		for(int lp2=0;lp2<gridNum;lp2++)
		{
			deButtons[lp2][lp1].createInfo();
		}
	}
}
public void keyReleased()
{
	if(key==' '){defusing = !defusing;}
}
public void draw()
{
	background(0);
	for(int lp1=0;lp1<deButtons.length;lp1++)
	{
		for(int lp2=0;lp2<deButtons[lp1].length;lp2++)
		{
			deButtons[lp2][lp1].show();
		}
	}
	fill(255);
	textAlign(LEFT, TOP);
	if(sweepers==0&&defusers==0){gameover=true;}
	if(gameover==false)
	{
		if(defusing==false)
		{
			textSize(30);
			text("Sweepers: "+sweepers,625,50);
			textSize(20);
			text("Defusers: "+defusers,625,100);
		}
		else
		{
			textSize(20);
			text("Sweepers: "+sweepers,625,50);
			textSize(30);
			text("Defusers: "+defusers,625,100);}
	}
	else
	{
		text("Game Over",625,50);
	}
}
public void mouseClicked()
{
	if(gameover==false)
	{
		int locateX = (int)(mouseX/20.0);
		int locateY = (int)(mouseY/20.0);
		if(locateX<=gridNum)
		{
			deButtons[locateX][locateY].engage();
		}
	}
}
class BombButton
{
	private int myX, myY, myDirective, myInfo;
	private boolean exposed, isDead;
	public BombButton(int x, int y, int direct)
	{
		myX = x;
		myY = y;
		myDirective = direct;
		exposed = false;
		myInfo = 0;
		isDead = false;
	}
	public int getDirective(){return myDirective;}
	public void setDirective(int direct){myDirective=direct;}
	public void createInfo()
	{
		if(myDirective == 0)
		{
			if(isValid(myX-1,myY-1)&&deButtons[myX-1][myY-1].getDirective()==1){myInfo++;}
			if(isValid( myX ,myY-1)&&deButtons[ myX ][myY-1].getDirective()==1){myInfo++;}
			if(isValid(myX+1,myY-1)&&deButtons[myX+1][myY-1].getDirective()==1){myInfo++;}
			if(isValid(myX-1, myY )&&deButtons[myX-1][ myY ].getDirective()==1){myInfo++;}
			if(isValid(myX+1, myY )&&deButtons[myX+1][ myY ].getDirective()==1){myInfo++;}
			if(isValid(myX-1,myY+1)&&deButtons[myX-1][myY+1].getDirective()==1){myInfo++;}
			if(isValid( myX ,myY+1)&&deButtons[ myX ][myY+1].getDirective()==1){myInfo++;}
			if(isValid(myX+1,myY+1)&&deButtons[myX+1][myY+1].getDirective()==1){myInfo++;}
		}
		if(myDirective == 1){myInfo=9;}
	}
	public boolean isValid(int row, int col)
	{
		if(row>=0&&col>=0&&row<=gridNum-1&&col<=gridNum-1){return true;}
		return false;
	}
	public void show()
	{
		rectMode(CENTER);
		if (exposed == false)
		{
			fill(169,169,169);
			rect(((myX)*20)+10,((myY)*20)+10,20,20);
		}
		else
		{
			if(myDirective==0)
			{
				if(isDead==false);
				{
					fill(225);
					rect(((myX)*20)+10,((myY)*20)+10,20,20);
					fill(0);
					textSize(18);
					textAlign(CENTER,CENTER);
					if(myInfo!=0){text(myInfo,((myX)*20)+10,((myY)*20)+10);}
				}
				else
				{
					fill(0);
					rect(((myX)*20)+10,((myY)*20)+10,20,20);
				}
			}
			if(myDirective==1)
			{
				fill(225,0,0);
				rect(((myX)*20)+10,((myY)*20)+10,20,20);
			}
		}
	}
	public void engage()
	{
		if(exposed==false)
		{
			exposed=true;
			if(defusing==false&&isDead==false)
			{
				if(myDirective==0)
				{
					if(myInfo==0)
					{
						amountran++;
						if(isValid(myX-1,myY-1)){deButtons[myX-1][myY-1].engage();}
						if(isValid( myX ,myY-1)){deButtons[ myX ][myY-1].engage();}
						if(isValid(myX+1,myY-1)){deButtons[myX+1][myY-1].engage();}
						if(isValid(myX-1, myY )){deButtons[myX-1][ myY ].engage();}
						if(isValid(myX+1, myY )){deButtons[myX+1][ myY ].engage();}
						if(isValid(myX-1,myY+1)){deButtons[myX-1][myY+1].engage();}
						if(isValid( myX ,myY+1)){deButtons[ myX ][myY+1].engage();}
						if(isValid(myX+1,myY+1)){deButtons[myX+1][myY+1].engage();}
					}
				}
				else if(myDirective==1)
				{
					sweepers--;
				}
			}
			else
			{
				if(myDirective==0)
				{
					isDead=true;
				}
			}
		}
	}
}