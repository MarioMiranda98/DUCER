import 'dart:io';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';

import 'package:ducer/src/pages/pdf_viewer_page.dart';

void generatePdf(context) async {
  final Document pdf = Document();
  pdf.addPage(
    MultiPage(
      pageFormat: 
        PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      footer: (Context context) {
        return Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
          child: Text('Ingeniería de Software - IPN - 2020',
            style: Theme.of(context)
              .defaultTextStyle
              .copyWith(color: PdfColors.grey)
          )
        );
    },
    build: (Context context) => <Widget>[
      Header(
        level: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Ducer - Reporte', textScaleFactor: 2),
          ]
        )
      ),
      Paragraph(
        text:
          'Nombre: Pedrito Lopex Lopex'
      ),
      Paragraph(
        text:
          'Fecha de nacimiento: 2020-01-20'
      ),
      Paragraph(
        text:
          'Problema diagnosticado: Ninguno'
      ),
      Header(level: 1, text: 'Test Realizados'),
      Paragraph(
        text:
          'Test 1 - Resultado:\nProbablemente es Emocionalmente Reactivo, Hay leves probabilidades de que tenga comportamiento agresivo'
      ),
      Paragraph(
        text:
          'Test 1 - Resultado:\nProbablemente es Emocionalmente Reactivo, Hay leves probabilidades de que tenga comportamiento agresivo'
      ),
      Paragraph(
        text:
          'Test 1 - Resultado:\nProbablemente es Emocionalmente Reactivo, Hay leves probabilidades de que tenga comportamiento agresivo'
      ),
      Paragraph(
        text:
          'Test 1 - Resultado:\nProbablemente es Emocionalmente Reactivo, Hay leves probabilidades de que tenga comportamiento agresivo'
      ),
      Header(level: 1, text: 'Cantidad de Incidencias Registradas'),
      Paragraph(
        text:
          'Se Siente Observado: 1\nSe Siente Observado: 1\nSe Siente Observado: 1\nSe Siente Observado: 1\nSe Siente Observado: 1\nSe Siente Observado: 1\n'
      ),
      Paragraph(
        text:
          'Se Siente Observado: 1\nSe Siente Observado: 1\nSe Siente Observado: 1\nSe Siente Observado: 1\nSe Siente Observado: 1\nSe Siente Observado: 1\n'
      ),
      Header(level: 1, text: 'Recomendaciones'),
      Paragraph(
        text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
      ),
      Padding(padding: const EdgeInsets.all(10)),
    ]),
  );

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());
  Get.to(PdfViewerPage(path: path));
}