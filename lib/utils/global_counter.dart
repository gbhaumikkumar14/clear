
class Counter{
  static final Counter _instance = Counter._internal();
  int _counter = 0;

  factory Counter(){
    return _instance;
  }

  int getUniqueNumber(){
    _counter++;
    return _counter;
  }

  Counter._internal();
}