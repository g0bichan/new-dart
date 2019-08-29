
class location {
  num lat, lng;

  location(this.lat, this.lng)

}

class elevatedlocation extends location {
  elevatedlocation(num lat, num lng) : super(lat, lng);

}


main(List<String> arguments) {

var elevated = new elevatedlocation(23.89,-234.98);
print("location=${elevated.lat}, ${elevated.lng}");

}