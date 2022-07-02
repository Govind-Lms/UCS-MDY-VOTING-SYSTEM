import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:vote_app/constants/style.dart';

class CustomAppBar extends StatelessWidget {
  final Brightness brightness;
  final VoidCallback? onTapBack;
  final String title;
  final String image;
  CustomAppBar({
    this.brightness = Brightness.dark,
    this.onTapBack,
    required this.title, 
    required this.image,
  });
 

  @override
  Widget build(BuildContext context) {
    final _isDarkBrightness = (brightness == Brightness.dark);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: ClayContainer(
          width: MediaQuery.of(context).size.width - 20,
          height: 60.0,
          color: UIColor.clayColor,
          borderRadius: 10.0,
          curveType: CurveType.concave,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    color: _isDarkBrightness ? Colors.black : Colors.white,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: onTapBack ??
                        () {
                          if (Navigator.canPop(context)) Navigator.pop(context);
                        },
                  ),
                ),
                Text(title.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 20.0,fontFamily: 'DIN Condensed'),),
                Hero(
                  tag: '$image+image',
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    child: image == '' ? Container() : Image(
                      image: AssetImage(image),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackAppBar extends StatelessWidget {
  final Brightness brightness;
  final VoidCallback? onTapBack;
  final String title;
  final String image;
  BackAppBar({
    this.brightness = Brightness.dark,
    this.onTapBack,
    required this.title, 
    required this.image,
  });
 

  @override
  Widget build(BuildContext context) {
    final _isDarkBrightness = (brightness == Brightness.dark);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: ClayContainer(
          width: 50.0,
          height: 50.0,
          // depth: -100,
          // spread: 5.0,
          // emboss: true,
          color: UIColor.clayColor,
          borderRadius: 10.0,
          curveType: CurveType.concave,
          child: IconButton(
                color: _isDarkBrightness ? Colors.black : Colors.white,
                icon: Icon(Icons.arrow_back_ios),
                onPressed: onTapBack ??
                    () {
                      if (Navigator.canPop(context)) Navigator.pop(context);
                    },
              ),
        ),
      ),
    );
  }
}
