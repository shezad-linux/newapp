import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

XFile? imagePicker;

final clinetNameProvider = StateProvider<bool>((ref)=> false);

final paymentStatusProvider = StateProvider<bool>((ref)=> false);

final addressProvider = StateProvider<bool>((ref)=> false);

final totalProvider = StateProvider<bool>((ref)=> false);

final remaingProvider = StateProvider<bool>((ref)=> false);
final packageClientImages = StateNotifierProvider<SelectedImage, XFile?>(
    (ref) => SelectedImage(imagePicker));

final projectStartDate = StateNotifierProvider<DateofJoining, DateTime>(
    (ref) => DateofJoining(DateTime.now()));

class SelectedImage extends StateNotifier<XFile?> {
  void pickImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(
      source: imageSource,
    );
    state = pickedImage;
  }

  SelectedImage(super.state);
}

class DateofJoining extends StateNotifier<DateTime> {
  Future<DateTime> pickDate(context) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2090));
    ;
    state = pickedDate ?? DateTime.now();

    return state;
  }

  DateofJoining(super.state);
}
