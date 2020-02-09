import 'dart:math';

class RandomContentService{
  bool randomBool(){
    var rng = new Random();
    return rng.nextBool();
  }

  bool randomProbability(int percentage){
    if(randomNumber() <= percentage){
      return true;
    }
    return false;
  }

  String randomPhoto(){
    List<String> photos = [
      "assets/images/photo_1.jpeg",
      "assets/images/photo_2.jpeg",
      "assets/images/photo_3.jpeg",
      "assets/images/photo_4.jpeg",
    ];
    var rng = new Random();
    int index = rng.nextInt(photos.length);
    return photos[index];
  }

  String randomName(){
    List<String> photos = [
      "John Doe",
      "Tony Stark",
      "Robert Downey",
      "Karl Rock",
      "Marry Goes",
      "Gecko Moriah",
    ];
    var rng = new Random();
    int index = rng.nextInt(photos.length);
    return photos[index];
  }

  int randomNumber(){
    var rng = new Random();
    int num = rng.nextInt(100);
    return num;
  }
}