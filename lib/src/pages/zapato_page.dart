import 'package:flutter/material.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    cambiarStatusDark();
    return Scaffold(

        // body: CustomAppBar(texto: 'para ti <3',)
        body: Column(
      children: <Widget>[
        CustomAppBar(
          texto: 'para ti <3',
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(
                  tag: 'Zaparo-1',
                  child: ZapatoSizePreview()),
                ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          ),
        ),
        AgregarCarritoBoton(monto:180.0)

      ],
    ));
  }
}
