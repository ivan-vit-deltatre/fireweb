import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Size screenSize;

  const HomeScreenAppBar(this.screenSize, {Key? key}) : super(key: key);

  @override
  HomeScreenAppBarState createState() => HomeScreenAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class HomeScreenAppBarState extends State<HomeScreenAppBar> {
  final List _isHovering = [
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(widget.screenSize.width, 1000),
      child: Container(
        color: Colors.blueGrey.shade900.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('YouTube search',
                    style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Football teams news 2021/2022',
                    style: GoogleFonts.ubuntu(
                        fontSize: 18,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                    )
                  )
                ]
              ),
              Expanded(child: Container()),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[0] = true : _isHovering[0] = false;
                  });
                },
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: _isHovering[0] ? Colors.white : Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[0],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: widget.screenSize.width / 50,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[1] = true : _isHovering[1] = false;
                  });
                },
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: _isHovering[1] ? Colors.white : Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[1],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
