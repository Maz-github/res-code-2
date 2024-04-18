package;
import flixel.FlxSprite;

class SonicNumber extends FlxSprite {
  public var number(default, set):Int = 0;
  public function new(x:Float=0,y:Float=0,initialValue:Int=0,?folder:String = 'sonic2'){
    super(x,y);
    switch(folder){
      case 'chaotix':
        loadGraphic(Paths.image('sonicUI/${folder}/numbers'), true, 7, 13);
      case 'chotix':
        loadGraphic(Paths.image('sonicUI/${folder}/numbers'), true, 7, 13);
      default:
		if (folder == 'soniccd')
			loadGraphic(Paths.image('sonicUI/sonic1/numbers'), true, 10, 11);
		else
			loadGraphic(Paths.image('sonicUI/${folder}/numbers'), true, 10, 11);
    }
    var numbers = ["0","1","2","3","4","5","6","7","8","9"];

    for(idx in 0...numbers.length){
      var anim = numbers[idx];
      animation.add(anim,[idx],0,false);
    }

    number = initialValue;
    antialiasing=false;
  }

  function set_number(realVal:Int){
    var val:String = Std.string(realVal);
    if(animation.getByName(val)!=null){
      animation.play(val,true);
      return number=realVal;
    }else{
      animation.play('0',true);
      return number=0;
    }
  }
}
