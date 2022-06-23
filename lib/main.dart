import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _index = 0;

  @override
  Widget build(BuildContext context) {

    return _pageview();
  }

// 声明文本样式
  var textStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontWeight: FontWeight.bold,
    color: Colors.black54,
    fontSize: 28,
  );

  final GlobalKey globalKey1 = GlobalKey();

  Widget _pageview(){

    //Widget w1 = stack1();
    // w1.key.

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print('screen width is $width; height is $height');


    // final containerWidth = globalKey1.currentContext?.size?.width;// size.width;
    // final containerHeight = globalKey1.currentContext?.size?.height;
    // print('stack1 widht is $containerWidth, height is $containerHeight');





    return Scaffold(
      body:
      Stack(
        alignment: Alignment.bottomCenter,
        children: [

          //背景图片
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover)),
          ),

          //标题
          Positioned(
              top: 80,
              child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,width: 200,)),

          //前景图片
          PageView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            onPageChanged: (index) {
              setState(() {
                _index = index;
              });
            },
            controller: PageController(
                initialPage: 0, keepPage: false, viewportFraction: 1),
            pageSnapping: true,
            physics: BouncingScrollPhysics(), //有回弹效果的滑动
            children: [


              ///1
              Stack(

                  alignment: Alignment.center,
                  //fit: StackFit.loose,
                  children:[
                    Positioned(
                      top: height/2 - (350+100)/2, //屏幕高度中心 - 控件高度中心 = 控件Y轴居中
                      child: Column(
                        children: [
                          Image.asset("assets/images/a11.png",fit: BoxFit.fitWidth,width: 350,height: 350),

                          Padding(
                            // 分别指定四个方向的补白
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child:  Container(
                              width: 320,
                              height: 100,
                              child: Text("抓地稳固 畅通无阻 尽享自在户外生活",
                                  maxLines:2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyle),
                              //color: Colors.red,
                            ),
                          ),



                        ],
                      ),
                    ),
                  ]
              ),


              ///2
              ///
              Stack(
                  alignment: Alignment.center,
                  //fit: StackFit.loose,
                  children:[
                    Positioned(
                      top: height/2 - (350+100)/2,
                      child: Column(
                        children: [
                          Image.asset("assets/images/a22.png",fit: BoxFit.fitWidth,width: 350,height: 350),

                          Padding(
                            // 分别指定四个方向的补白
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child:  Container(
                              width: 320,
                              height: 100,
                              child: Text("畅享轻松的户外生活，缔造舒适穿着体验",
                                maxLines:2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle),
                              //color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ]
              ),


              ///3
              Stack(
                  alignment: Alignment.center,
                  //fit: StackFit.loose,
                  children:[
                    Positioned(
                      top: height/2 - (350+100)/2,
                      child: Column(
                        children: [
                          Image.asset("assets/images/a33.png",fit: BoxFit.fitWidth,width: 350,height: 350),

                          Padding(
                            // 分别指定四个方向的补白
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child:  Container(
                              width: 320,
                              height: 100,
                              child: Text("深纹理大底抓地力强，不惧地形",
                                maxLines:2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle),
                              //color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ]
              ),

            ],
          ),



          //按钮
          Positioned(
            bottom: 70,
            child:
            SizedBox(
                width: 340,
                height: 50,
                child:ElevatedButton(

                    onPressed: () {

                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),//阴影
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all( RoundedRectangleBorder( borderRadius: BorderRadius.circular(5))),//圆角
                        //side: MaterialStateProperty.all( BorderSide(color: Colors.blue))//外边框颜色
                    ),
                    child: Text("Flutter GuidePage Demo",style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "MiSans"),))),
          ),


          //指示点
          Positioned(
              bottom: 30,
              child: DotsIndicator(
                  mainAxisAlignment: MainAxisAlignment.center,
                  reversed: false,
                  dotsCount: 3,
                  position: _index.toDouble(),
                  decorator:
                  DotsDecorator(
                    color: Colors.white30, // Inactive color
                    activeColor: Colors.blueAccent,
                  )
              ))
        ],
      ),
    );
  }


}
