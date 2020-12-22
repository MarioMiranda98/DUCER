import 'package:get/get.dart';

class CalendarPickerController extends GetxController {
  int _day;
  String _month;
  int _monthIndex;
  int _year;
  int _dayLimit;

  List<String> _monthsList = [
    'january',
    'febraury',
    'march',
    'april',
    'may',
    'june',
    'july',
    'august',
    'september',
    'october',
    'november',
    'december',
  ];

  Map<String, int> _monthsLimitDay = {
    'january': 31,
    'febraury': 29,
    'march': 31,
    'april': 30,
    'may': 31,
    'june': 30,
    'july': 31,
    'august': 31,
    'september': 30,
    'october': 31,
    'november': 30,
    'december': 31,
  };

  Map<String, String> _monthsToSpanish = {
    'january': 'Ene',
    'febraury': 'Feb',
    'march': 'Mar',
    'april': 'Abr',
    'may': 'May',
    'june': 'Jun',
    'july': 'Jul',
    'august': 'Ago',
    'september': 'Sep',
    'october': 'Oct',
    'november': 'Nov',
    'december': 'Dic',
  };

  @override
  void onInit() {
    super.onInit();
    _day = 1;
    _month = _monthsToSpanish['january'];
    _dayLimit = _monthsLimitDay['january']; 
    _monthIndex = 0;
    _year = 2000;
  }

  int get day => this._day;
  String get month => this._month;
  int get monthIndex => this._monthIndex;
  int get year => this._year; 

  void addDay() {
    if(_day == _dayLimit) 
      _day = 1;
    else 
      _day += 1;

    update(['days']);
  }

  void subDay() {
    if(_day == 1) 
      _day = _dayLimit;
    else 
      _day -= 1;

    update(['days']);
  }

  void nextMonth() {
    if(_monthIndex == 11) {
      _month = _monthsToSpanish[_monthsList[0]];
      _dayLimit = _monthsLimitDay[_monthsList[0]];
      _monthIndex = 0;
    }else {
      _month = _monthsToSpanish[_monthsList[++_monthIndex]];
      _dayLimit = _monthsLimitDay[_monthsList[_monthIndex]]; 
    }

    update(['months']);
  }

  void prevMonth() {
    if(_monthIndex == 0) {
      _month = _monthsToSpanish[_monthsList[11]];
      _dayLimit = _monthsLimitDay[_monthsList[11]];
      _monthIndex = 11;
    }else {
      _month = _monthsToSpanish[_monthsList[--_monthIndex]];
      _dayLimit = _monthsLimitDay[_monthsList[_monthIndex]]; 
    }

    update(['months']);
  }

  void addYear() {
    if(_year == 4000) 
      _year = 2000;
    else 
      _year += 1;

    update(['year']);
  }

  void subYear() {
    if(_year == 0) 
      _year = 2000;
    else 
      _year -= 1;

    update(['year']);
  }
}