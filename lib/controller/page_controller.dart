// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/providers/storage_provider.dart';

import '../extensions.dart';
import '../classes/dto/response/jwt_response/jwt_response.dart';
import '../classes/exceptions/app_exceptions.dart';
import '../classes/user/user.dart';
import '../shared/confirm_pass_sheet.dart';
import '../shared/error_dialog.dart';
import '../shared/loading_dialog.dart';

Logger logger = Logger();

class LogicController {
  void signup(BuildContext context, User user) async {
    showLoadingDialog(context);
    try {
      JwtResponse response = await mealService.signup(user);
      context.pop();
      context.read<StorageProvider>().setJwt(response.jwt);
    } on UsernameTakenException {
      context.pop();
      showErrorDialog(context, "That username is already in use");
    } on EmailTakenException {
      context.pop();
      showErrorDialog(context, "That email is already is use");
    } catch (e) {
      context.pop();
      showErrorDialog(context, "Something went wrong");
      logger.d(e.toString());
      logger.d(e.runtimeType.toString);
    }
  }
}
