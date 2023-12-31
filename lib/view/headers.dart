import 'package:flutter/material.dart';
import 'package:photospot/view/home_screen.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    Image venmoLogo = Image.asset(
      'images/venmo-logo-1024x269.webp', // Replace with your Venmo logo image path
      width: screenWidth * .08, // Adjust the width as needed
    );
    Image cashappLogo = Image.asset(
      'images/cash-app-logo-512x512.png', // Replace with your CashApp logo image path
      width: screenWidth * .08, // Adjust the width as needed
    );
    Image paypalLogo = Image.asset(
      'images/PayPal.png', // Replace with your PayPal logo image path
      width: screenWidth * .08, // Adjust the width as needed
    );

    return Container(
      padding: EdgeInsets.all(screenWidth > 1200 ? 12.0 : 6.0),
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              if (screenWidth > 325)
                Image.asset(
                  'images/GeddesWorksCutout.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              SizedBox(
                  width: screenWidth > 1200
                      ? 16.0
                      : screenWidth > 600
                          ? 8.0
                          : 1.0),
              Image.asset(
                'images/authorizedsellerbadge.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Photo Spot",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    'Oklahoma City, OK',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Info:',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Email: geddesworx@gmail.com',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                'Phone: (405) 757-1880',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          if (screenWidth > 600)
            ElevatedButton(
              onPressed: () => {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: const Text('Contact Us'),
            ),
        ],
      ),
    );
  }
}

AppBar appBar(HomeScreenState state) {
  final logoCutout =
      Image.asset('images/GeddesWorksCutout.png', width: 50, height: 50);
  final logoFull = Image.asset('images/GeddesWorks.png');

  var screenWidth = MediaQuery.of(state.context).size.width;

  return AppBar(
    title: Row(
      children: [
        logoCutout,
        // SizedBox(
        //     width: model.screenWidth > 1200
        //         ? 16.0
        //         : model.screenWidth > 600
        //             ? 8.0
        //             : 4.0),
        // const Text(printShopName),
      ],
    ),
    actions: [
      // if (model.screenWidth < 1200 && model.screenWidth > 400)
      const Text("Large View"),
      // if (model.screenWidth < 1200 && model.screenWidth > 400)
      // Switch(
      // value: model.displaySingle,
      // onChanged: (value) {
      // con.setDisplaySingle(value);
      // },
      // ),
    ],
    backgroundColor: Colors.grey,
  );
}

AppBar genericAppBar(BuildContext context) {
  final logoCutout =
      Image.asset('images/GeddesWorksCutout.png', width: 50, height: 50);
  final logoFull = Image.asset('images/GeddesWorks.png');

  var screenWidth = MediaQuery.of(context).size.width;

  return AppBar(
    title: Row(
      children: [
        logoCutout,
        SizedBox(
            width: screenWidth > 1200
                ? 16.0
                : screenWidth > 600
                    ? 8.0
                    : 4.0),
        const Text('GeddesWorks Shop'),
      ],
    ),
    backgroundColor: Colors.grey,
  );
}
