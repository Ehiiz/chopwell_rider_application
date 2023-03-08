import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileButtons extends StatelessWidget {
  ProfileButtons(this.icon, this.menuName, this.page);

  String icon;
  String menuName;
  Widget page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return page;
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return page;
                  }));
                },
                icon: SvgPicture.asset(icon)),
            SizedBox(
              width: 10,
            ),
            Text(
              menuName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
