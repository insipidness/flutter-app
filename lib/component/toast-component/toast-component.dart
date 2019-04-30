  import 'package:flutter/material.dart';

  class ToastComponent {

    static final int LENGTH_SHORT = 1;
    static final int LENGTH_LONG = 2;
    static final int BOTTOM = 0;
    static final int CENTER = 1;
    static final int TOP = 2;

    static void show(
      String msg,
      BuildContext cxt,
      {
        int duration = 1,
        int gravity = 0,
        Color background = const Color(0xAA000000),
        Color textcolor = Colors.white,
        double backgroundRadius = 20
      }
    ){
      ToastView.remove();
      ToastView.create(msg, cxt, duration, gravity, background, textcolor, backgroundRadius);
    }
  }



  class ToastView {

    static bool _isVisible = false;
    static OverlayState overlayState;
    static OverlayEntry _overlayEntry;

    static void create(
      String msg,
      BuildContext cxt,
      int duration,
      int gravity,
      Color background,
      Color textcolor,
      double backgroundRadius
    ) async {
      _overlayEntry = new OverlayEntry(
        builder: (BuildContext ctx) => ToastWidget(
          widget: Container(
            width: MediaQuery.of(ctx).size.width,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(ctx).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(backgroundRadius),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Text(
                  msg,
                  softWrap: true,
                  style: TextStyle(fontSize: 15, color: textcolor)
                ),
              ),
            ),
          ),
          gravity: gravity,
        )
      );
      overlayState.insert(_overlayEntry);
      await new Future.delayed(Duration(seconds: duration == null ? ToastComponent.LENGTH_SHORT : duration));
      remove();
    }


    /*
     * 移除ToastView
     */
    static remove() async {
      if(!_isVisible) return false;
      _isVisible = false;
      _overlayEntry?.remove();
    }
  }


  class ToastWidget extends StatelessWidget {
    final Widget widget;
    final int gravity;
    
    ToastWidget({
      Key key,
      @required this.widget,
      @required this.gravity,
    }) : super(key:key);

    @override
    Widget build(BuildContext cxt){
      return new Positioned(
        top: gravity == 2 ? 50 :null,
        bottom: gravity == 0 ? 50 : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ),
      );
    }
  }