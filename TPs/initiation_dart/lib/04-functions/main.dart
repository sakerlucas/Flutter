void exercice4() {
  void sayHello(String param) {
    print('Hello, $param !');
  }

  sayHello('World');

  int sum(int a, int b) {
    return a + b;
  }

  print(sum(2, 3));

  int sumMany(List<int> numbers) {
    int sum = 0;
    for (int number in numbers) {
      sum += number;
    }
    return sum;
  }

  List<int> numbers = [1, 2, 3, 4, 5];
  print(sumMany(numbers));

  void sumAndPrint(num param1, num param2, {bool shouldPrint = false}) {
    num result = param1 + param2;
    if (shouldPrint) {
      print('$param1 + $param2 = $result');
    }
  }

  sumAndPrint(1, 1, shouldPrint: true);
  sumAndPrint(1, 4);

  num sumAndFormat(num param1, num param2, {String? ft}) {
    num result = param1 + param2;
    if (ft == null) {
      return result;
    } else if (ft == 'double') {
      return result.toDouble();
    } else if (ft == 'int') {
      return result.toInt();
    } else {
      throw Exception('Format $ft inconnu');
    }
  }

  print(sumAndFormat(2.5, 1.78, ft: 'double'));
  print(sumAndFormat(2.5, 1.78, ft: 'int'));

  String Function(String) strReverse = (String str) {
    return str.split('').reversed.join();
  };
  String hello = 'Hello';
  String reversed = strReverse(hello);
  print(reversed);

  void fibonacci(int n) {
    int a = 0;
    int b = 1;
    int c = 0;
    for (int i = 0; i < n; i++) {
      print(a);
      c = a + b;
      a = b;
      b = c;
    }
  }

  fibonacci(17);
}

void exercice4_2() {}
