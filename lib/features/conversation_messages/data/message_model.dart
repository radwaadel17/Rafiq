import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';

class MessageModel {
  int? id;
  String? message;
  String? type;
  String? senderType;
  List<String>? photos;
  String? video;
  String? document;
  String? voiceNote;
  String? date;
  String? time;
  int? consultationId;
  List<File>? selectedPhotos;
  File? selectedDocument;
  File? selectedVoiceNote;
  File? selectedVideo;
  String? videoThumbnail;
  bool? isDowloaded = false;
  //// AudioPlayer? player = AudioPlayer();
  MessageModel({
    this.id,
    this.message,
    this.type,
    this.senderType,
    this.photos,
    this.video,
    this.document,
    this.voiceNote,
    this.date,
    this.time,
    this.consultationId,
    this.selectedDocument,
    this.selectedPhotos,
    this.selectedVideo,
    this.selectedVoiceNote,
    this.videoThumbnail,
    this.isDowloaded,
    // this.player,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    type = json['type'];
    senderType = json['sender_type'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : null;
    video = json['video'];
    document = json['document'];
    voiceNote = json['voice_note'];
    date = json['date'];
    time = json['time'];
    videoThumbnail = json['video_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.selectedPhotos != null) {
      for (int i = 0; i < selectedPhotos!.length; i++) {
        data['photos[$i]'] = MultipartFile.fromFileSync(selectedPhotos![i].path);
      }
    }
    if (this.selectedDocument != null) {
      data['document'] = MultipartFile.fromFileSync(selectedDocument!.path);
    }
    if (this.selectedVoiceNote != null) {
      data['voice_note'] = MultipartFile.fromFileSync(selectedVoiceNote!.path);
    }
    if (this.selectedVideo != null) {
      data['video'] = MultipartFile.fromFileSync(selectedVideo!.path);
    }
    if (message != null) data['message'] = this.message;
    if (consultationId != null) data['consultation_id'] = this.consultationId;

    return data;
  }
}
