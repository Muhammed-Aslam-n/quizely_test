import 'package:flutter/material.dart';
import 'package:quizly_test/constants/colors.dart';
import 'package:quizly_test/screens/widgets/calculator_button.dart';

final listItems = [
  'AC',
  '+/-',
  '%',
  '/',
  '7',
  '8',
  '9',
  'X',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
];

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String currentNumber = '0';
  double? previousNumber;
  String? operation;
  bool isPreviousResultAppended = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ResultSection(
                    result: currentNumber,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: (listItems.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 15.0,
                    // spacing between rows
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (itemBuilder, index) {
                    final newIndex = index + 1;
                    if (newIndex % 4 == 0) {
                      return CalculatorButton(
                        text: listItems[index],
                        onPressed: () {
                          calculateResult(listItems[index]);
                        },
                        bgColor: AppColors.orangeColor,
                      );
                    }

                    return CalculatorButton(
                      bgColor: newIndex > 4
                          ? AppColors.blackGrey
                          : AppColors.greyColor,
                      text: listItems[index],
                      onPressed: () {
                        calculateResult(listItems[index]);
                      },
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.blackGrey,
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              '0',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.blackGrey,
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '.',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: OutlinedButton(
                      onPressed: () {
                        if (previousNumber != null && operation != null) {
                          double secondNumber = double.parse(currentNumber);
                          switch (operation) {
                            case '+':
                              add(previousNumber!, secondNumber);
                              break;
                            case '-':
                              subtract(previousNumber!, secondNumber);
                              break;
                            case '*':
                              multiply(previousNumber!, secondNumber);
                              break;
                            case '/':
                              if (secondNumber == 0) {
                                currentNumber = "Error";
                              } else {
                                divide(previousNumber!, secondNumber);
                              }
                              break;
                            // Similar cases for multiply and divide
                          }
                          setState(() {
                            previousNumber = null;
                            operation = null;
                            isPreviousResultAppended = true;
                          });
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.blackGrey,
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '=',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void add(double a, double b) {
    currentNumber = (a + b).round().toString();
  }

  void subtract(double a, double b) {
    currentNumber = (a - b).round().toString();
  }

  void multiply(double a, double b) {
    currentNumber = (a * b).toString();
  }

  String divide(double a, double b) {
    return currentNumber = (a / b).toString();
  }

  calculateResult(item) {
    switch (item) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        setState(() {
          currentNumber = currentNumber == '0' || isPreviousResultAppended
              ? item
              : currentNumber + item;
          debugPrint('currentNumber $currentNumber');
        });
        break;
      case '+':
      case '-':
      case '*':
      case '/':
        setState(() {
          previousNumber = double.parse(currentNumber);
          operation = item;
          currentNumber = '0';
          debugPrint(
              'currentNumber $currentNumber and PrevNumber $previousNumber');
        });
        break;
      case '+/-':
        setState(() {
          currentNumber = (double.parse(currentNumber) * -1).toString();
        });
        break;
      case '%':
        if (previousNumber != null && operation != null) {
          double percentage =
              previousNumber! * (double.parse(currentNumber) / 100);
          currentNumber = percentage.toString();
          setState(() {});
        }

        break;
      case 'AC':
        setState(() {
          currentNumber = '0';
          previousNumber = null;
          operation = null;
        });
        break;
      // Add cases for other buttons if needed
    }
  }
}

class ResultSection extends StatelessWidget {
  final String result;

  const ResultSection({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Text(
      result,
      style: const TextStyle(
          fontSize: 66, color: Colors.white, fontWeight: FontWeight.w400),
    );
  }
}
