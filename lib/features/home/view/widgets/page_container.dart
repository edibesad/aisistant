import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon,
      required this.backgroundColor,
      this.contentColor,
      this.fontSize});

  final Color backgroundColor;
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final double? fontSize;
  final Color? contentColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * .15
            : MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.width * .9
            : MediaQuery.of(context).size.width * .4,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(-4, 12),
              blurStyle: BlurStyle.solid,
            )
          ],
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: contentColor ?? Colors.white,
            width: 4,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: LayoutBuilder(
            builder: (context, constraints) => Row(
              children: [
                Icon(
                  icon,
                  size: constraints.maxWidth * .2,
                  color: contentColor ?? Colors.white,
                ),
                SizedBox(
                  width: constraints.maxWidth * .07,
                ),
                Expanded(
                  child: Text(title,
                          softWrap: true,
                          style: TextStyle(
                              color: contentColor ?? Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: fontSize ?? constraints.maxWidth * .2))
                      .tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
