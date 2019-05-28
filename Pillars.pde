//
class Pillars {
  private Pillar pillar_up=null;
  private Pillar pillar_down=null;

  private float speed=0;

  private boolean touchedLeft=false;


  Pillars() {
    pillar_up= new Pillar(Pillar.PILLAR_TYPE_UP);
    pillar_down= new Pillar(Pillar.PILLAR_TYPE_DOWN);

    speed=180;
    touchedLeft=false;
    newWave();
  }

  boolean isTouchedLeft() {
    return touchedLeft;
  }


  void newWave() {
    reset();
    touchedLeft=false;
    action();
  }

  void reset() {
    pillar_down.reset();
    pillar_up.reset();
  }

  void action() {
    float val=random(1);

    if (val< 0.5)
    {
      pillar_down.move(speed);
    } else {
      pillar_up.move(speed);
    }
  }

  void update(float dt) {
    pillar_down.update(dt);
    pillar_up.update(dt);
    
    if(pillar_down.isTouchLeft() || pillar_up.isTouchLeft())
    {
      touchedLeft=true;
    }
  }

  void render() {
    pillar_down.render();
    pillar_up.render();
  }
}
