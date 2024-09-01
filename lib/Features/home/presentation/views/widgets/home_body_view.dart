import 'package:flutter/material.dart';
import 'package:wolves/Features/home/presentation/views/widgets/custom_button.dart';
import 'package:wolves/constants.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: const Text('Wolves'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child:
                        Image.asset('assets/images/output-onlinepngtools.png')),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  buttonTitle: 'List of Players',
                  onPressed: () {
                    Navigator.pushNamed(context, '/players');
                  },
                ),
                CustomButton(
                  buttonTitle: 'Customized Roles',
                  onPressed: () {
                    Navigator.pushNamed(context, '/players');
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
                const Spacer(
                  flex: 1,
                ),
                CustomButton(
                  buttonTitle: 'Get Started',
                  onPressed: () {
                    Navigator.pushNamed(context, '/players');
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
