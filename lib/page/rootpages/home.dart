import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  Widget profilePic(BuildContext context) {
    // print(Colors.primaries[0].value.toRadixString(16));
    return Container(
      child: ClipRRect(child: Image.network(
        'https://rycont.github.io/assets/image/logo.png',
        width: 32,
      ), borderRadius: BorderRadius.circular(18)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.red, width: 3, style: BorderStyle.solid),
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SvgPicture.asset(
          'asset/image/dimigoBackground.svg',
          width: screenWidth,
          height: 150,
          fit: BoxFit.fitHeight,
        ),
        Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('asset/image/brandlogo.svg',
                  color: Theme.of(context).primaryColor),
              profilePic(context)
            ],
          ),
          bottom: 30,
          left: 20,
          width: screenWidth - 40,
        ),
      ],
    );
  }
}
