private BombButton [][] deButtons = new BombButton[30][30];
private int amountran = 0;
public void setup()
{
	size(1000,600);

	for(int lp1=0;lp1<30;lp1++)
	{
		for(int lp2=0;lp2<30;lp2++)
		{
			deButtons[lp2][lp1] = new BombButton(lp2,lp1,0);
		}
	}
	for(int lp1=0;lp1<90;lp1++)
	{
		int toBombX = (int)(Math.random()*30);
		int toBombY = (int)(Math.random()*30);
		if(deButtons[toBombX][toBombY].getDirective()==1){lp1--;}
		else{deButtons[toBombX][toBombY].setDirective(1);}
	}
	for(int lp1=0;lp1<30;lp1++)
	{
		for(int lp2=0;lp2<30;lp2++)
		{
			deButtons[lp2][lp1].createInfo();
		}
	}
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
}
public void mouseClicked()
{
	int locateX = (int)(mouseX/20.0);
	int locateY = (int)(mouseY/20.0);
	if(locateX<=30)
	{
		deButtons[locateX][locateY].engage();
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
		if(row>=0&&col>=0&&row<=29&&col<=29){return true;}
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
				fill(225);
				rect(((myX)*20)+10,((myY)*20)+10,20,20);
				fill(0);
				textSize(18);
				textAlign(CENTER,CENTER);
				if(myInfo!=0){text(myInfo,((myX)*20)+10,((myY)*20)+10);}
			}
		}
	}
	public void engage()
	{
		
		if(myDirective==0&&exposed==false)
		{	
			exposed=true;
			if(myInfo==0)
			{
				System.out.println("Run "+amountran);
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
	}
}