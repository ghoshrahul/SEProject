//4pics 1 word, the game
import android.view.inputmethod.InputMethodManager;
import android.content.Context;
int rect1x, rect1y, rect2x, rect2y,rect3x,rect3y,rect4x,rect4y;
int img_re2x,img_re2y,img_re3x,img_re3y,img_re4x,img_re4y;
int rectSize = 100;
boolean rect1Over = false;
boolean rect2Over = false;
boolean rect3Over = false;
boolean rect4Over = false;
boolean rect5Over = false;
boolean rect6Over = false;
boolean rect7Over = false;
boolean dis_img2=false,dis_img3=false,dis_img4=false;
String[] answer = {"NATURE","INSECT","ICE","GESTURE","MALODOUROUS","GALAXY"};// answers of each level
String[] user_answer={"______","______","___","_______","___________","______"}; //user answers
String[] user_answer_copy={"______","______","___","_______","___________","______"}; 
String[] ques_letters={"","","","","",""}; ////initializing the question letters
String[] ques_letters_copy={"","","","","",""};//these are to be changed
int level = 1,flag =0;
int answer_length=answer[level-1].length();
int counter=0;
int max_level=6; //maximum no of levels in the game
int[] counter_box1=new int[max_level];
int[] counter_box2=new int[max_level];
PImage img1,img2,img3,img4,new1,new2,new3,new4,box1,box2,box3,box4;
String im1="image1.jpg",im2="image2.jpg",im3="image3.jpg",im4="image4.jpg"; //initial first 4 images
char[] x = user_answer_copy[level-1].toCharArray();


// uploading new images once a level is completed
void another(){
  if (level > max_level)
   { 
     noLoop();
     background(0);
     text("You have won the game",0.3*width,height/5);
     exit();
   }
  else{
  im1 = "image"+str(level*4-3)+".jpg";
  im2 = "image"+str(level*4-2)+".jpg";
  im3 = "image"+str(level*4-1)+".jpg";
  im4 = "image"+str(level*4-0)+".jpg";
  x=user_answer[level-1].toCharArray();
  
  }
}

void setup(){
  //initial setup
  background(0);
  size(displayWidth,displayHeight);
  rect1x = width - width/5;
  rect1y = height - height/10;
  rect2x = width - width/5;
  rect2y = height - height/5;
  rect3x = width/10;
  rect3y = height - height/10;
  rect4x = width/10;
  rect4y = height - height/5;
  img_re2x = width/2-10;
  img_re2y = 200;
  img_re3x = 25;
  img_re3y = 600;
  img_re4x = width/2-10;
  img_re4y = 600;
  ques_letters[level-1] = get_letters(answer[level-1]);
  img1=loadImage(im1);
  img2=loadImage(im2);
  img3=loadImage(im3);
  img4=loadImage(im4);
  new1=img1.get(0,0,300,300);
  new2=img2.get(0,0,300,300);
  new3=img3.get(0,0,300,300);
  new4=img4.get(0,0,300,300);
  box1=loadImage("hint1.png");
  box2=loadImage("dustbin.jpg");
  box3=loadImage("keyboard.jpg");
  box4=loadImage("check.jpg");
}

int check(String answer, String user_answer_fun) //checking the user answer matches the correct answer
{
   if (user_answer_fun.equals(answer))
      {
      level++;
      dis_img2=dis_img3=dis_img4=false;
      noLoop();
      another();
      setup();   
      loop();
   
      return 1;
      }
   else
      {
       //text("Incorrect answer, Please try again",width/5,height/10);
       user_answer[level-1]=user_answer_copy[level-1];
       //x=user_answer_copy[level-1].to;
       x = user_answer_copy[level-1].toCharArray();
       counter_box1[level-1]=0;
       return 0;
       }
}

//showing the virtual keyboard
void showVirtualKeyboard() 
{
  InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
  imm.toggleSoftInput(InputMethodManager.SHOW_FORCED, 0);
 
}
//hiding the virtual keyboard
 void hideVirtualKeyboard() 
{
  InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
  imm.toggleSoftInput(InputMethodManager.HIDE_IMPLICIT_ONLY, 0);
}

void initial_setup(){ //game setup
  //textSize(40);
  String text1="LeveL " + str(level);
  if (level <= max_level ){
  textSize(40);
  text(text1,width/2-width/10,height/20);
  image(box1,rect1x, rect1y);
  image(box2,rect2x, rect2y);
  image(box3,rect3x, rect3y);
  image(box4,rect4x, rect4y);
  image(new1,25,200);
  if(dis_img2){image(new2,350,200);}
  if(dis_img3){image(new3,25,600);}
  if(dis_img4){image(new4,350,600);}
 
  }
}

void draw(){
  frameRate(60);
  update(mouseX,mouseY); //detecting the current touch position
  fill(255);
  
  if(level<=max_level)
  {
    textSize(30);
    text(ques_letters[level-1],width/2-width/6,height-height/10); //displaying the 14-character set
    text(user_answer[level-1],width/2-width/6,height-height/20); //displaying the user answer set
  }
  else
  {
    text("You have won the game",0.3*width,height/5);
  }
  
}

void update(int x, int y) { //checking if the touch is over a particular box or not
  if ( overRect(rect1x, rect1y, rectSize, rectSize) ) {
    rect1Over=true;
    fill(0,255,0);
    text("Get a correct alphabet",width/4,height/10);
  } 
  else if ( overRect(rect2x, rect2y, rectSize, rectSize) ) {
    rect2Over=true;
    fill(0,255,0);
    text("Remove extra characters",width/4,height/10);
 
  }
 else if ( overRect(rect3x, rect3y, rectSize, rectSize) ) {
    rect3Over=true;
    fill(0,255,0); 
    text("Show keyboard",width/3,height/10);
  }
 else if ( overRect(rect4x, rect4y, rectSize, rectSize) ) {
    rect4Over=true;
    fill(0,255,0);
    text("Check for answer",width/3,height/10);
  }
  else if ( overRect(rect4x, rect4y, rectSize, rectSize) ) {
    rect4Over=true;
  }
   else if ( overRect(img_re2x, img_re2y, rectSize*3, rectSize*3) ) {
    rect5Over=true;
  }
   else if ( overRect(img_re3x, img_re3y, rectSize*3, rectSize*3) ) {
    rect6Over=true;
  }
   else if ( overRect(img_re4x, img_re4y, rectSize*3, rectSize*3) ) {
    rect7Over=true;
  }
 
  else {
    rect1Over = rect2Over = rect3Over = rect4Over= rect5Over= rect6Over= rect7Over= false;
    background(0);
    initial_setup();
  }
}

void mousePressed() { //action according to where a human has touched the screen
  if (rect1Over) {
    counter_box1[level-1]++;
    hint1(answer[level-1]);
  }
  if (rect2Over && counter_box2[level-1] < 2) {
    counter_box2[level-1]++;
    hint2(answer[level-1],ques_letters_copy[level-1]);
  }
  if (rect3Over) {
    showVirtualKeyboard();
  }
  if (rect4Over) {
    int r = check(answer[level-1],user_answer[level-1]);
    if(r == 0)
      {
        user_answer[level-1]="";
        user_answer[level-1]=user_answer_copy[level-1];
      }
  }
  if(rect5Over){
    dis_img2=true;
  }
  if(rect6Over && dis_img2){
    dis_img3=true;
  }
  if(rect7Over && dis_img3){
    dis_img4=true;
  }
}



boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}



void hint1(String answer){ //Getting a correct character
  x[counter_box1[level-1]-1]=answer.charAt(counter_box1[level-1]-1);
  counter_box1[level-1]=counter_box1[level-1]%answer.length();
  user_answer[level-1]=new String(x);
 
}

void hint2(String answer, String ques_letters_copy) //Removing extra characters
{
  char[] y = ques_letters_copy.toCharArray();
  y=reverse(y);
  int rl=int(random(13-answer.length()))+1;
  println(rl);
  int i=0;
  for(i=0;i<rl;i++)
      y[i]=' ';
  //y[int(random(13-answer.length()))]=y[int(random(12-answer.length()))]='_';
  y=reverse(y);
  ques_letters[level-1]=new String(y);
  ques_letters[level-1] = shuffleArray(ques_letters[level-1],ques_letters[level-1].length());
}

String get_letters(String answer){ //getting the 14 set of characters
  if(level > max_level)
    noLoop();
  int max_length = 14;
  int random_length = max_length - answer.length();
  String rand="";
  int i=0;
  for(i=0;i<random_length;i++)
  {
    rand=rand+char(int(random(25)+1+65));
  }
  println(answer);
  String ques_letters = answer + rand;
  ques_letters_copy[level-1]=ques_letters;
  ques_letters = shuffleArray(ques_letters,ques_letters.length());
  fill(255);
  println(ques_letters);
  return ques_letters;
}

String shuffleArray(String char_array,int strlength) //Fisher Yates shuffle.
{
  char[] array =char_array.toCharArray();
  //int r = int(random(length)+1);
  for(int i= strlength-1;i>0;i--)
  {
    int index = int(random(strlength));
    char a = array[index];
    array[index]=array[i];
    array[i]=a;
  }
  char_array=new String(array);
  return char_array;
}

void keyPressed() //user answer through virtual keyboard.
{
  if(key>='a' && key<='z')
  { 
     x[counter_box1[level-1]]=char(int(key)-32);
     counter_box1[level-1]++;
     user_answer[level-1]=new String(x);
     
  }
  else if(key=='\n')
  {
    user_answer[level-1]="";
    user_answer[level-1]=user_answer_copy[level-1];
    x = user_answer_copy[level-1].toCharArray();
    counter_box1[level-1]=0;
  }
  hideVirtualKeyboard();
  counter_box1[level-1]=counter_box1[level-1]%answer[level-1].length();
}



