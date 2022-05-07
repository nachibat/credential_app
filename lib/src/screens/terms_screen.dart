import 'package:flutter/material.dart';

import 'package:facultad_app/src/widgets/widgets.dart';

class TermsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Términos y condiciones'),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            _item('1. ', 'Estos Términos y Condiciones de Uso regulan las reglas a que se sujeta la utilización de la APP "Credencial FRSN" (en adelante, la APP), que puede descargarse desde el dominio "https://www.frsn.utn.edu.ar". La descarga o utilización de la APP atribuye la condición de Usuario a quien lo haga e implica la aceptación de todas las condiciones incluidas en este documento y en la Política de Privacidad y el Aviso Legal de dicha página Web. El Usuario debería leer estas condiciones cada vez que utilicela APP, ya que podrían ser modificadas en lo sucesivo.'),
            SizedBox(height: 5),
            _item('2. ', 'Únicamente los Usuarios expresamente autorizados por la facultad FRSN podrán acceder a la descarga y uso de la APP. Los Usuarios que no dispongan de autorización, no podrán acceder a dicho contenido.'),
            SizedBox(height: 5),
            _item('3. ', 'Cargos: eres responsable del pago de todos los costes o gastos en los que incurras como resultado de descargar y usar la Aplicación de la facultad FRSN, incluido cualquier cargo de red de operador o itinerancia. Consulta con tu proveedor de servicios los detalles al respecto.'),
            SizedBox(height: 5),
            _item('4. ', 'Estadísticas anónimas: la facultad FRSN se reserva el derecho a realizar un seguimiento de tu actividad en la Aplicación y a informar de ello a nuestros proveedores de servicios estadísticos de terceros. Todo ello de forma anónima.'),
            SizedBox(height: 5),
            _item('5. ', 'Protección de tu información personal: queremos ayudarte a llevar a cabo todos los pasos necesarios para proteger tu privacidad e información. Consulta la Política de privacidad de la facultad FRSN y los avisos sobre privacidad de la Aplicación para conocer qué tipo de información recopilamos y las medidas que tomamos para proteger tu información personal.'),
            SizedBox(height: 5),
            _item('6. ', 'Queda prohibido alterar o modificar alguna parte de la APP o de los contenidos de la misma, eludir, desactivar o manipular de cualquier otra forma (o tratar de eludir, desactivar o manipular) las funciones de seguridad u otras funciones del programa y utilizar la APP o sus contenidos para un fin comercial o publicitario. Queda prohibido el uso de la APP con la finalidad de lesionar bienes, derechos o intereses de la facultad FRSN o de terceros. Queda igualmente prohibido realizar cualquier otro uso que altere, dañe o inutilice las redes, servidores, equipos, productos y programas informáticos de la facultad FRSN o de terceros.'),
            SizedBox(height: 5),
            _item('7. ', 'La APP y sus contenidos (textos, fotografías, imágenes, tecnología, software, links, contenidos, diseño gráfico, código fuente, etc.), así como las marcas y demás signos distintivos son propiedad de la facultad FRSN o de terceros, no adquiriendo el Usuario ningún derecho sobre ellos por el mero uso de la APP. El Usuario, deberá abstenerse de:'),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  _item('a) ', 'Reproducir, copiar, distribuir, poner a disposición de terceros, comunicar públicamente, transformar o modificar la APP o sus contenidos, salvo en los casos contemplados en la ley o expresamente autorizados por la facultad FRSN o por el titular de dichos derechos.'),
                  SizedBox(height: 5),
                  _item('b) ', 'Reproducir o copiar para uso privado la APP o sus contenidos, así como comunicarlos públicamente o ponerlos a disposición de terceros cuando ello conlleve su reproducción.'),
                  SizedBox(height: 5),
                  _item('c) ', 'Extraer o reutilizar todo o parte sustancial de los contenidos integrantes de la APP.'),
                  SizedBox(height: 5),
                ],
              )
            ),
            _item('8. ', 'Con sujeción a las condiciones establecidas en el apartado anterior, la facultad FRSN concede al Usuario una licencia de uso de la APP, no exclusiva, gratuita, para uso personal, circunscrita al territorio nacional y con carácter indefinido. Dicha licencia se concede también en los mismos términos con respecto a las actualizaciones y mejoras que se realizasen en la aplicación. Dichas licencias de uso podrán ser revocadas por la facultad FRSN unilateralmente en cualquier momento, mediante la mera notificación al Usuario.'),
            SizedBox(height: 5),
            _item('9. ', 'Corresponde al Usuario, en todo caso, disponer de herramientas adecuadas para la detección y desinfección de programas maliciosos o cualquier otro elemento informático dañino. La facultad FRSN no se responsabiliza de los daños producidos a equipos informáticos durante el uso de la APP. Igualmente, la facultad FRSN no será responsable de los daños producidos a los Usuarios cuando dichos daños tengan su origen en fallos o desconexiones en las redes de telecomunicaciones que interrumpan el servicio.'),
            SizedBox(height: 5),
            _item('10. ', 'IMPORTANTE: Podemos, sin que esto suponga ninguna obligación contigo, modificar estas Condiciones de uso sin avisar en cualquier momento. Si continúas utilizando la aplicación una vez realizada cualquier modificación en estas Condiciones de uso, esa utilización continuada constituirá la aceptación por tu parte de tales modificaciones. Si no aceptas estas condiciones de uso ni aceptas quedar sujeto a ellas, no debes utilizar la aplicación ni descargar o utilizar cualquier software relacionado. El uso que hagas de la aplicación queda bajo tu única responsabilidad. No tenemos responsabilidad alguna por la eliminación o la incapacidad de almacenar o trasmitir cualquier contenido u otra información mantenida o trasmitida por la aplicación. No somos responsables de la precisión o la fiabilidad de cualquier información o consejo trasmitidos a través de la aplicación. Podemos, en cualquier momento, limitar o interrumpir tu uso a nuestra única discreción. Hasta el máximo que permite la ley, en ningún caso seremos responsables por cualquier pérdida o daño relacionados.'),
            SizedBox(height: 5),
            _item('11. ', 'El Usuario se compromete a hacer un uso correcto de la APP, de conformidad con la Ley, con los presentes Términos y Condiciones de Uso y con las demás reglamentos e instrucciones que, en su caso, pudieran ser de aplicación el Usuario responderá frente a la facultad FRSN y frente a terceros de cualesquiera daños o perjuicios que pudieran causarse por incumplimiento de estas obligaciones.'),
            SizedBox(height: 5),
            _item('12. ', 'Estos Términos y Condiciones de Uso se rigen íntegramente por la legislación argentina. Para la resolución de cualquier conflicto relativo a su interpretación o aplicación, el Usuario se somete expresamente a la jurisdicción de los tribunales de San Nicolás - Bs. As. (Argentina).'),
            SizedBox(height: 35),
            MaterialButton(          
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              color: Colors.indigo,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text('Volver', style: TextStyle(color: Colors.white))
              ),
              onPressed: () {
                Navigator.pop(context);
              }
            )
          ],
        ),
      ),
    );
  }

  RichText _item(String item, String text) {
    return RichText(
      text: TextSpan(
        style: TextStyle(          
          fontSize: 16,
          color: Colors.black87
        ),
        children: [
          TextSpan(
            text: item,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            )
          ),
          TextSpan(
            text: text            
          ),
        ]
      ),
    );
  }
}