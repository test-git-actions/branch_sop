import 'package:branch_links/core/clients/api_client/dio_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@module
abstract class InjectableModule {
  Logger get logger => Logger('BranchLinks');

  FirebaseAuth get auth {
    final instance = FirebaseAuth.instance;
    return instance;
  }

  FirebaseFirestore get firestore {
    final instance = FirebaseFirestore.instance;
    return instance;
  }

  FirebaseDatabase get database {
    final instance = FirebaseDatabase.instance;
    return instance;
  }

  Dio get dio => DioClient.instance;
}
