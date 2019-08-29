
abstract class Animal{
  void breathe();
  void makenoise(){
    print("animal make noise");
  }

}


class person implements Animal {
  String name,nationality;


  person(this.name, this.nationality);

  @override
  void breathe() {
    print("person breathe noisle");
  }

  @override
  void makenoise() {
    print("person shouting");
  }
@override
  String toString()  => "$name , $nationality";
}


main(List<String> arguments) {

var jeni = new person("Jeni","India");
    print(jeni);


}
