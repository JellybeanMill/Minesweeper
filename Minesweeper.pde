int [][] bombField;
public void setup()
{
    size(1000,600);
}
class BombButton
{
    private int myX, myY, myDirective, myInfo;
    private boolean exposed;
    public BombButton(int x, int y, int direct, int info)
    {
        myX = x;
        myY = y;
        myDirective = direct;
        myInfo = info;
		exposed = false;
    }
    public void getInfo()
    public void show()
    {
        if (exposed == false){rect(((x+1)*10)+5,((y+1)*10)+5,10,10);}
        else ()
    }
}