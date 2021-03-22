import 'dart:convert';
import 'dart:io';

import 'package:foodmarket_flutter/models/models.dart';
import 'package:http/http.dart' as http;

part 'transaction_services.dart';
part 'user_services.dart';
part 'food_services.dart';

String baseURL = 'http://foodmarket-backend.buildwithangga.id/api/';
