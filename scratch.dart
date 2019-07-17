import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1(){
  String result = 'task 1 data';
  print(result);
}

Future<String> task2() async{
  String result = "task 2 data";

  //synchronous method
  Duration threeSeconds = Duration(seconds:3);
//  sleep(threeSeconds);

  //asynchronous
  await Future.delayed(threeSeconds,(){
    print(result);
  });

  return result;

}

void task3(String result){
  print(result);
}
