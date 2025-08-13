class Intro {

  PImage intro;
  boolean fondoLoadState;
  PImage[] loadAnimation = new PImage[8];

  int fadeText = 255;
  boolean isFadingText;


  Intro() {
    //Imagen de fondo pesada
    fondo = requestImage("background.jpg");

    //Cargar Imagenes de loadScreen
    intro = loadImage("intro.jpg");
    for (int i=0; i<loadAnimation.length; i++) {
      loadAnimation[i] = loadImage(dataPath("girar-derecha") + "//" + "birdBall0" + i + "Der.png");
    }
  }


  void RunLoaderScreen() {
    image(intro, 0, 0);
    int cambiarSprite = frameCount/6;
    image(loadAnimation[cambiarSprite%loadAnimation.length], width-100, height-85);

    println("fondo cargado: " + isFondoCargado());
    if (isFondoCargado()) escena = "menu";
  }

  void RunMenu() {
    image(intro, 0, 0);
    pushStyle();
    textSize(24);
    textAlign(CENTER);
    fill(230, fadeText);
    text("presiona espacio o muestra el patron", width/2, height-50);
    popStyle();

    if (fadeText <= 50) {
      isFadingText = false;
    } else if (fadeText >= 255) {
      isFadingText = true;
    }
    float speedFade = 2;
    if (isFadingText) {
      fadeText -= speedFade;
    } else fadeText += speedFade;

    //Cambiar Escena
    if (keyPressed) {
      if (key == ' ')
        escena = "juego";
    }
  }


  boolean isFondoCargado() {
    if ( (fondo.width != 0) && (fondo.width != -1) ) {
      return true;
    }
    return false;
  }
}//end class
