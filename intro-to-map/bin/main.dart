

main(List<String> arguments) {

  var winners = {

    "first": "bill",
    "second": "george",
    "third": "bond"
  };

 /*var winnersecond = {
     '1' : "gobi"
     '2' : "nath"
     '3' : "gggg"
 };*/

  //print(winnerssecond['2']);
  print(winners["second"]);
  winners.forEach(( k,v) => print(k));
  //winners.forEach( (k,v) => print(k));
  //var keys = winnersecond.keys;
  //var values = winnersecond.values;
  var keys = winners.keys;
  var values = winners.values;

print(keys);
print(values);

}
