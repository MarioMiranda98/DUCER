class RegisteredIncidencesModel {
  String name;
  String firstLastName;
  String secondLastName;
  int feelingWatched;
  int communiactionTrouble;
  int anxious;
  int sad;
  int anormalPhysycSignal;
  int isolate;
  int lackAttention;
  int tantrums;
  int aggressions;
  int problematicEnviroment;

  RegisteredIncidencesModel({
    this.name = '',
    this.firstLastName = '',
    this.secondLastName = '',
    this.feelingWatched = 0,
    this.communiactionTrouble = 0,
    this.anxious = 0,
    this.sad = 0,
    this.anormalPhysycSignal = 0,
    this.isolate = 0,
    this.lackAttention = 0,
    this.tantrums = 0,
    this.aggressions = 0,
    this.problematicEnviroment = 0,
  });

  RegisteredIncidencesModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    firstLastName = map['first_last_name'];
    secondLastName = map['second_last_name'];
    feelingWatched = map['feeling_watched'];
    communiactionTrouble = map['communiaction_trouble'];
    anxious = map['anxious'];
    sad = map['sad'];
    anormalPhysycSignal = map['anormal_physyc_signal'];
    isolate = map['isolate'];
    lackAttention = map['lack_attention'];
    tantrums = map['tantrums'];
    aggressions = map['aggressions'];
    problematicEnviroment = map['problematic_enviroment'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'first_last_name': firstLastName,
    'second_last_name': secondLastName,
    'feeling_watched': feelingWatched,
    'communiaction_trouble': communiactionTrouble,
    'anxious': anxious,
    'sad': sad,
    'anormal_physyc_signal': anormalPhysycSignal,
    'isolate': isolate,
    'lack_attention': lackAttention,
    'tantrums': tantrums,
    'aggressions': aggressions,
    'problematic_enviroment': problematicEnviroment,
  };

  int getAllQuantityOfIncidences() {
    return (
      feelingWatched +
      communiactionTrouble +
      anxious +
      sad +
      anormalPhysycSignal +
      isolate +
      lackAttention +
      tantrums +
      aggressions +
      problematicEnviroment 
    );
  }
}