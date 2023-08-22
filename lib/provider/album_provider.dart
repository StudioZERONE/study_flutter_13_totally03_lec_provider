import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:study_flutter_13_totally03_lec_provider/model/album.dart';

class AlbumProvider with ChangeNotifier {
  final List<Album> _albumList = List.empty(growable: true);

  List<Album> getAlbumList() {
    _fetchAlbums();
    return _albumList;
  }

  void _fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final List<Album> result = jsonDecode(response.body)
        .map<Album>((json) => Album.fromJson(json))
        .toList();
    _albumList.clear();
    _albumList.addAll(result);
    notifyListeners(); //등록된 모든 Listener에게 상태가 변경되었다고 알려줌
  }
}
