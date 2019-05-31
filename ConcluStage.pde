
class ConcluStage extends ez_Stage
{
  private PImage img=null;

  private ez_Label labelEnter=null;
  private ez_Label labelExit=null;
  private ez_Label labelPoints=null;

  private  color c=color(209, 144, 24);
  
  private AudioPlayer overMusic=null;

  //
  ConcluStage()
  {
    super();
    
    overMusic= gMinim.loadFile("musics/underground.mp3");

    img= loadImage("images/game_over.jpg");
    
    labelEnter= new ez_Label("fonts/free.ttf", 30);
    labelEnter.setColorText(c);
    labelEnter.setText("Press Enter > play");

    labelExit= new ez_Label("fonts/free.ttf", 30);
    labelExit.setColorText(c);
    labelExit.setText("Press Esc > exit");

    labelPoints= new ez_Label("fonts/free.ttf", 30);
    labelPoints.setColorText(c);
    labelPoints.setText("Points");
  }
  //
  void update(float dt)
  {
    if (gInputManager.isKeyPressed(ENTER))
    {
      gStageManager.changeStage(new GameStage(), null);
    }
  }

  //
  void render()
  {
    background(247, 247, 247);

    image(img, width/6, height/12);

    labelPoints.render(width/3, height-150);

    labelEnter.render(width/3, height-100);

    labelExit.render(width/3, height-50);
  }

  //
  void onEnter(StringDict message)
  {
    if (message != null && message.size()>0)
    {
      labelPoints.setText("Score= "+message.get("SCORE")+" pts");
    }
    //
    if(overMusic!= null)
    {
      overMusic.loop();
    }
  }

  //
  void onExit()
  {
    if(overMusic!= null)
    {
      overMusic.close();
    }
  }
}
//end
