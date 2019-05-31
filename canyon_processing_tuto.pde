/*
Projet Canyon Processing
 Tutoriel video
 Mai 2019
 Copyright A.DeCarvalho
 */

import java.util.*;
import ddf.minim.*;

//
float now=0;
float ex=0;
int fps=0;
float timer=0;

//
ez_InputManager gInputManager=null;
ez_StageManager gStageManager=null;

Minim gMinim=null;

//
void setup() {
  size(800, 480);
  
  gMinim= new Minim(this);

  gInputManager= new ez_InputManager();

  gStageManager= new ez_StageManager();

  gStageManager.addStage(new GameStage());
  //gStageManager.addStage(new ConcluStage());
}


//
void draw() {
  background(51);

  now=millis();
  float dt=(now-ex)/1000.0f;

  timer+=dt;
  fps++;
  if (timer >1.0f)
  {
    //println("fps= "+fps);
    fps=0;
    timer=0;
  }
  //
  gStageManager.update(dt);
  gStageManager.render();

  gInputManager.update();

  //
  ex=now;
}

//
void keyPressed() {
  gInputManager.setKeyboardPressed(keyCode);
}

//
void keyReleased() {
  gInputManager.setKeyboardReleased(keyCode);
}
