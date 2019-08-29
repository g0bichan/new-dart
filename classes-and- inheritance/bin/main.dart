
class person {
  String name, lastname;
  int age;

  void showname() => print(name);


  void sayHello() {
    // => print("hello");
    print("hello");
  }
}

class Gobi extends person {


  String profession;


  void showprofession() => print(profession);
}
class Nath extends person {

  @override
  void sayHello(){
   //todo: implement sayHello
  print("vanakam");
}
}




main(List<String> arguments) {

  var gobi = new Gobi();
  gobi.name = "Gobi";
  gobi.profession = "busdriver";
  gobi.showname();
  gobi.showprofession();
  gobi.sayHello();

  var nath = new Nath();
  nath.name = "Nath";
  nath.showname();
  nath.sayHello();

}
