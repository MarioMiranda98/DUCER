import 'dart:io';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';

import 'package:ducer/src/models/registered_incidences_model.dart';
import 'package:ducer/src/data/services/user_service.dart';
import 'package:ducer/src/models/user_model.dart';
import 'package:ducer/src/data/services/secure_storage_service.dart';
import 'package:ducer/src/pages/pdf_viewer_page.dart';
import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/data/services/incidences_service.dart';
import 'package:ducer/src/data/services/test_service.dart';
import 'package:ducer/src/models/children_model.dart';

void generatePdf(context, ChildrenModel child) async {
  final user = await _getParentName();
  final tests = await _getChildSolvedTests(child);
  final childIncidences = await _getChildIncidences(child);
  final suggestion = await _getSuggestion(child);
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
          'Nombre del padre: ${user.name} ${user.firstLastName} ${user.secondLastName}'
      ),
      Paragraph(
        text:
          'Nombre del niño: ${child.name} ${child.firstLastName} ${child.secondLastName}'
      ),
      Paragraph(
        text:
          'Fecha de nacimiento: ${child.birthDate}'
      ),
      Paragraph(
        text:
          'Problema diagnosticado: ${child.diagnosis}'
      ),
      Header(level: 1, text: 'Test Realizados'),
      tests != null ? 
        Paragraph(
          text: tests
        )
      :
        Paragraph(
          text:  'Sin test realizados'
        ),
      Header(level: 1, text: 'Cantidad de Incidencias Registradas'),
      Paragraph(
        text: childIncidences
      ),
      Header(level: 1, text: 'Recomendaciones'),
      Paragraph(
        text: suggestion
      ),
      Header(level: 1, text: 'Ducer agradece su preferencia!!'),
      Padding(padding: const EdgeInsets.all(10)),
    ]),
  );

  final String dir = (await getExternalStorageDirectory()).path;
  final String path = '$dir/${child.name}-${child.firstLastName}-${child.secondLastName}.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());
  Get.to(PdfViewerPage(path: path));
}

Future<UserModel> _getParentName() async {
  final userEmail = await SecureStorageService.instance.getUserEmail();
  final userService = UserService.instance;
  final res = await userService.getUserInfo(email: userEmail);
  
  return res;
}

Future _getChildSolvedTests(ChildrenModel child) async {
  final userEmail = await SecureStorageService.instance.getUserEmail();
  final Map<String, dynamic> values = {
    'email': userEmail,
    'name': child.name,
    'firstLastName': child.firstLastName,
    'secondLastName': child.secondLastName
  };

  final testService = TestService.instance;
  final res = await testService.getChildTest(body: values);

  if(res == null) return null;

  String aux = '';
  res.forEach((item) => {
    aux += item['test_name'],
    aux += ' Realizado: ' + item['make_date'] + '\n',
    aux += 'Resultado:\n ' + item['result'] + '\n'
  });

  return aux;
}

Future _getChildIncidences(ChildrenModel child) async {
  final incidencesService = IncidencesService.instance;
  final resp = await incidencesService.getAllIncidences(
    args: [child.name, child.firstLastName, child.secondLastName]
  );

  final res = resp[0];

  String aux = '';

  aux += 'Se siente Observado: ${res['feeling_watched']}\n';  
  aux += 'Le cuesta comunicarse: ${res['communiaction_trouble']}\n';  
  aux += 'Se nota ansioso: ${res['anxious']}\n';  
  aux += 'Se nota triste: ${res['sad']}\n';  
  aux += 'Señal física anormal: ${res['anormal_physyc_signal']}\n';  
  aux += 'Se aísla: ${res['isolate']}\n';  
  aux += 'Poca atención: ${res['lack_attention']}\n';  
  aux += 'Rabietas: ${res['tantrums']}\n';  
  aux += 'Agresión: ${res['aggressions']}\n';  
  aux += 'Problematico en su entorno: ${res['problematic_enviroment']}\n'; 

  return aux; 
}

Future _getSuggestion(ChildrenModel child) async {
  final incidencesService = IncidencesService.instance;
  final resp = await incidencesService.getAllIncidences(
    args: [child.name, child.firstLastName, child.secondLastName]
  );

  final res = resp[0];

  final rim = RegisteredIncidencesModel.fromJson(res);
  final qoi = rim.getAllQuantityOfIncidences();

  return Helpers.getSuggestion(qoi);
} 