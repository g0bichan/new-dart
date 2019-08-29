

abstract class Animal {
  void breathe();

  void makenoise() {
    print("animal makes noise");
  }
}


abstract class Isfunny {

  void makepeoplelaugh();
}
class Tvshow implements Isfunny{
  String name;

  @override
  void makepeoplelaugh() {
    print("Tvshow is funny");
  }

}

class comedian extends person implements Isfunny{
  comedian(String name, String nationality) : super(name, nationality);

  @override
  void makepeoplelaugh() {
    print("makepeoplelaugh");
  }

}






class person implements Animal {
String name,nationality;

  @override
  void breathe() {
    print("person breathing through nostrils");
  }

  @override
  void makenoise() {
    print("person shouting");
  }

person(this.name, this.nationality);
@override
  String toString() => "$name $nationality";
}

main(List<String> arguments) {

var jeni = new person("Jeni","India");
    print(jeni);


}
