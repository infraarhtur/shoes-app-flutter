import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    cambiarStatusLight();
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: [
            Hero(
               tag: 'Zaparo-1',
              child: ZapatoSizePreview(fullScreen: true)),
            Positioned(
              top:100,
              child: FloatingActionButton(
                child: Icon(Icons.chevron_left,color:Colors.white,size:60),
                onPressed: (){
                  cambiarStatusDark();
                  Navigator.pop(context);
                },
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                )
              )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ZapatoDescripcion(
                    titulo: 'Segunda Descripcion Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                _MontoBuyNow(),
                _ColoresYmas(),
                _BotonesLikeCartSettings()
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(
            Icons.star,
            size: 25,
            color: Colors.red,
          )),
          _BotonSombreado(Icon(Icons.add_shopping_cart,
              size: 25, color: Colors.grey.withOpacity(0.4))),
          _BotonSombreado(Icon(Icons.settings,
              size: 25, color: Colors.grey.withOpacity(0.4))),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado(this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 25, bottom: 20),
        child: Row(
          children: [
            Text('\$180.0',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              // delay: Duration(seconds: 1),
              from: 50,
                          child: BotonNaranja(
                texto: 'Buy Now',
                ancho: 120,
                alto: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: 90, child: _BotonColor(color: Color(0xffCD6D642), index: 4,url:'assets/imgs/verde.png')),
              Positioned(
                  left: 60, child: _BotonColor(color: Color(0xffFFAD29), index: 3,url:'assets/imgs/amarillo.png')),
              Positioned(
                  left: 30, child: _BotonColor(color: Color(0xff2099F1), index: 2,url:'assets/imgs/azul.png')),
              _BotonColor(color: Color(0xff364D56), index: 1,url:'assets/imgs/negro.png'),
            ],
          )),
          BotonNaranja(
              texto: "More related items",
              alto: 30,
              ancho: 170,
              color: Color(0xffFFC675))
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String url;

  const _BotonColor({this.color, this.index, this.url});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index *100),
      duration: Duration(milliseconds: 300),
          child: GestureDetector(
            onTap: (){
              final zapatoModel = Provider.of<ZapatoModel>(context,listen: false);
              zapatoModel.assetImage = this.url;
            },
                      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
      ),
          ),
    );
  }
}
