import 'dart:typed_data'  ;
import 'dart:ui' as ui;
import 'package:flutter/material.dart' ;
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice_generated/modal%20class.dart';

class Billgenret extends StatefulWidget {
  const Billgenret({Key? key}) : super(key: key);

  @override
  State<Billgenret> createState() => _BillgenretState();
}

class _BillgenretState extends State<Billgenret> {
  final GlobalKey globalKey= GlobalKey();
  @override
  Widget build(BuildContext context) {
    List<Data> Alldata = ModalRoute.of(context)!.settings.arguments as List<Data>;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bill Genret"),
          centerTitle: true,
        ),
        body:RepaintBoundary(
          key: globalKey,
          child:  ListView.builder(itemBuilder: (context, index) {
            return uii(Alldata[index].name,Alldata[index].addproduct,Alldata[index].price);
          },itemCount: Alldata.length),
        ),


      ),
    );
  }
  Widget uii(String? name,addprodcut,price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height:80,
        width: double.infinity,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("$name"),
            SizedBox(height: 10,),
            Text("$addprodcut"),
            SizedBox(height: 10,),
            Text("$price"),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
void captureImage()async{
    RenderRepaintBoundary? boundary=
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format:ui.ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(pngBytes,name: "Bill Genret.png",quality: 50);
    print(result);
}
}