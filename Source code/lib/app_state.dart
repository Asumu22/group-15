import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _latlnglist = prefs
              .getStringList('ff_latlnglist')
              ?.map(latLngFromString)
              .withoutNulls ??
          _latlnglist;
    });
    _safeInit(() {
      _markerlist = prefs.getStringList('ff_markerlist') ?? _markerlist;
    });
    _safeInit(() {
      _jsonMapsStyle = prefs.getString('ff_jsonMapsStyle') ?? _jsonMapsStyle;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<LatLng> _latlnglist = [
    LatLng(4.15374, 9.24397),
    LatLng(4.132122, 9.223429),
    LatLng(4.171843, 9.278397)
  ];
  List<LatLng> get latlnglist => _latlnglist;
  set latlnglist(List<LatLng> value) {
    _latlnglist = value;
    prefs.setStringList(
        'ff_latlnglist', value.map((x) => x.serialize()).toList());
  }

  void addToLatlnglist(LatLng value) {
    latlnglist.add(value);
    prefs.setStringList(
        'ff_latlnglist', _latlnglist.map((x) => x.serialize()).toList());
  }

  void removeFromLatlnglist(LatLng value) {
    latlnglist.remove(value);
    prefs.setStringList(
        'ff_latlnglist', _latlnglist.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLatlnglist(int index) {
    latlnglist.removeAt(index);
    prefs.setStringList(
        'ff_latlnglist', _latlnglist.map((x) => x.serialize()).toList());
  }

  void updateLatlnglistAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    latlnglist[index] = updateFn(_latlnglist[index]);
    prefs.setStringList(
        'ff_latlnglist', _latlnglist.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLatlnglist(int index, LatLng value) {
    latlnglist.insert(index, value);
    prefs.setStringList(
        'ff_latlnglist', _latlnglist.map((x) => x.serialize()).toList());
  }

  List<String> _markerlist = [
    'ic_current.png',
    'ic_current.png',
    'ic_current.png'
  ];
  List<String> get markerlist => _markerlist;
  set markerlist(List<String> value) {
    _markerlist = value;
    prefs.setStringList('ff_markerlist', value);
  }

  void addToMarkerlist(String value) {
    markerlist.add(value);
    prefs.setStringList('ff_markerlist', _markerlist);
  }

  void removeFromMarkerlist(String value) {
    markerlist.remove(value);
    prefs.setStringList('ff_markerlist', _markerlist);
  }

  void removeAtIndexFromMarkerlist(int index) {
    markerlist.removeAt(index);
    prefs.setStringList('ff_markerlist', _markerlist);
  }

  void updateMarkerlistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    markerlist[index] = updateFn(_markerlist[index]);
    prefs.setStringList('ff_markerlist', _markerlist);
  }

  void insertAtIndexInMarkerlist(int index, String value) {
    markerlist.insert(index, value);
    prefs.setStringList('ff_markerlist', _markerlist);
  }

  String _jsonMapsStyle =
      '[{\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#f5f5f5\"}]},{\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#616161\"}]},{\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"color\":\"#f5f5f5\"}]},{\"featureType\":\"administrative.land_parcel\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#bdbdbd\"}]},{\"featureType\":\"poi\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#eeeeee\"}]},{\"featureType\":\"poi\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#757575\"}]},{\"featureType\":\"poi.park\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#e5e5e5\"}]},{\"featureType\":\"poi.park\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#9e9e9e\"}]},{\"featureType\":\"road\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#757575\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#dadada\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#616161\"}]},{\"featureType\":\"road.local\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#9e9e9e\"}]},{\"featureType\":\"transit.line\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#e5e5e5\"}]},{\"featureType\":\"transit.station\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#eeeeee\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#c9c9c9\"}]},{\"featureType\":\"water\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#9e9e9e\"}]}]';
  String get jsonMapsStyle => _jsonMapsStyle;
  set jsonMapsStyle(String value) {
    _jsonMapsStyle = value;
    prefs.setString('ff_jsonMapsStyle', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
