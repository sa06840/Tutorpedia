import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavWidget extends StatelessWidget {
  const NavWidget
({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child:  Padding(
        padding: EdgeInsets.fromLTRB(12,17,12,0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                child: IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.logout_rounded, size: 30,)
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 110, 8),
              child: Theme(
                  data: Theme.of(context).copyWith(
                    elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 225, 92, 152),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      ),
                    ),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.assignment_rounded, size: 20,),
                    label: Text(
                      'Assignments', 
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                      ),
                  ),
                ),
            )
            ],
          ),
        ),
      ),
    );
  }
}