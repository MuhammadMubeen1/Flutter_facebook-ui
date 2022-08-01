

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class responsive extends StatelessWidget {
  final Widget mobile;

  final Widget desktop;
  const responsive({Key? key, 
 
  required this.desktop, required this.mobile}) : super(key: key);

  static bool isMobile(BuildContext context) =>
   MediaQuery.of(context).size.width<800;
  static bool isTablet(BuildContext context) =>
   MediaQuery.of(context).size.width>=800 &&
    MediaQuery.of(context).size.width<1200 ;
  static bool isDesktop(BuildContext context) =>
   MediaQuery.of(context).size.width>=1200;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) 
      {

if(constraints.maxWidth>=1200)
{
return desktop;

}
else if(constraints.maxWidth>=800)
{
  return  mobile ;

}else{
  return mobile;
}
      }
      
    );
    
  }
}