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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ResultSection(),
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
                        onPressed: () {},
                        bgColor: AppColors.orangeColor,
                      );
                    }

                    return CalculatorButton(
                      bgColor: newIndex > 4
                          ? AppColors.blackGrey
                          : AppColors.greyColor,
                      text: listItems[index],
                      onPressed: () {},
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
                        child: Text(
                          '0',
                          style: TextStyle(color: Colors.white,fontSize: 20),
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
                          style: TextStyle(color: Colors.white,fontSize: 20),
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
                          '=',
                          style: TextStyle(color: Colors.white,fontSize: 20),
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
}

class ResultSection extends StatelessWidget {
  const ResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '0',
      style: TextStyle(
          fontSize: 66, color: Colors.white, fontWeight: FontWeight.w400),
    );
  }
}
