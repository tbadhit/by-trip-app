import 'dart:convert';

import 'package:by_trip/database/bookmarks_database.dart';
import 'package:http/http.dart' as http;
import 'package:by_trip/models/models.dart';

part 'wisata_services.dart';
part 'user_services.dart';
part 'bookmark_services.dart';

String baseURL = "https://ict-juara.herokuapp.com/api/";
