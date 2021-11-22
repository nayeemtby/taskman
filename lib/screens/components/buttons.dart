import 'package:flutter/material.dart';

class BtnPrimary extends StatelessWidget {
  final String txt;
  final double height;
  final double? width;
  final double fontsize;
  const BtnPrimary(
      {Key? key,
      required this.txt,
      this.height = 56,
      this.width,
      this.fontsize = 17})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          txt,
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: fontsize,
              fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
            primary: const Color(0xff246BFD),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height / 2))),
      ),
    );
  }
}

class BtnSecondary extends StatelessWidget {
  final String txt;
  final double height;
  final double? width;
  final double fontsize;
  const BtnSecondary(
      {Key? key,
      required this.txt,
      this.height = 56,
      this.width,
      this.fontsize = 17})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          txt,
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: fontsize,
              fontWeight: FontWeight.w600),
        ),
        style: OutlinedButton.styleFrom(
            primary: Colors.white,
            side: const BorderSide(width: 1, color: Colors.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height / 2))),
      ),
    );
  }
}

class BtnPrimaryAlt extends StatelessWidget {
  final String txt;
  final double height;
  final double? width;
  final double fontsize;
  const BtnPrimaryAlt(
      {Key? key,
      required this.txt,
      this.height = 56,
      this.width,
      this.fontsize = 17})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2)),
      color: Color(0xff246BFD),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height / 2)),
        splashFactory: InkRipple.splashFactory,
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: height,
          width: width ?? double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              txt,
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: fontsize,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            )
          ]),
        ),
      ),
    );
  }
}

class BtnFlat extends StatelessWidget {
  final Widget child;
  const BtnFlat({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashFactory: InkRipple.splashFactory, onTap: () {}, child: child);
  }
}
