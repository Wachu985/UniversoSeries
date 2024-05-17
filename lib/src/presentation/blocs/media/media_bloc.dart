import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/repositories.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  final MediaRepository repository;
  final LocalStorageRepository localRepository;
  MediaBloc({required this.repository, required this.localRepository})
      : super(MediaState.initialState()) {
    on<FetchDataEvent>(_fetchDataEvent);
    on<CleanSerie>(_cleanSerie);
    on<SelectSerie>(_selectSerie);
    on<LoadFavorites>(_loadFavorites);
    on<ToogleFavorite>(_toogleFavorite);
    on<FetchPopulateMedia>(_fetchPopulateMedia);
    on<FetchLastMedia>(_fetchLastMedia);
  }

  FutureOr<void> _fetchDataEvent(
    FetchDataEvent event,
    Emitter<MediaState> emit,
  ) async {
    emit(state.copyWith(mediaStatus: MediaStatus.loading));
    try {
      final response = await repository.findAllMedia();
      final populate = await repository.findPopulateMedia(10, 'populate');
      final last = await repository.findLastMedia(10, 'created_at');
      emit(
        state.copyWith(
          mediaStatus: MediaStatus.success,
          series: response,
          lastMedia: last,
          populateMedia: populate,
        ),
      );
    } catch (e) {
      emit(state.copyWith(mediaStatus: MediaStatus.error));
    }
  }

  FutureOr<void> _cleanSerie(CleanSerie event, Emitter<MediaState> emit) {
    emit(state.copyWith(serieSelected: null));
  }

  FutureOr<void> _selectSerie(SelectSerie event, Emitter<MediaState> emit) {
    emit(state.copyWith(serieSelected: event.serie));
  }

  FutureOr<void> _loadFavorites(
      LoadFavorites event, Emitter<MediaState> emit) async {
    emit(state.copyWith(mediaStatus: MediaStatus.initial));

    emit(state.copyWith(mediaStatus: MediaStatus.loading));
    try {
      final response = await localRepository.loadMedias();
      emit(state.copyWith(
          mediaStatus: MediaStatus.success, favorites: response));
    } catch (e) {
      emit(state.copyWith(mediaStatus: MediaStatus.error));
    }
  }

  FutureOr<void> _toogleFavorite(
      ToogleFavorite event, Emitter<MediaState> emit) async {
    await localRepository.toogleFavorite(event.media);
    add(MediaEvent.loadFavorites());
  }

  Future<bool> checkFavorite(int media) async {
    final bool valueOut = await localRepository.isMediaFavorite(media);
    return valueOut;
  }

  FutureOr<void> _fetchPopulateMedia(
      FetchPopulateMedia event, Emitter<MediaState> emit) async {
    emit(state.copyWith(mediaStatus: MediaStatus.loading));
    try {
      final response = await repository.findPopulateMedia(10, 'populate');
      emit(state.copyWith(
          mediaStatus: MediaStatus.success, populateMedia: response));
    } catch (e) {
      emit(state.copyWith(mediaStatus: MediaStatus.error));
    }
  }

  FutureOr<void> _fetchLastMedia(
      FetchLastMedia event, Emitter<MediaState> emit) async {
    emit(state.copyWith(mediaStatus: MediaStatus.loading));
    try {
      final response = await repository.findLastMedia(10, 'created_at');
      emit(state.copyWith(
          mediaStatus: MediaStatus.success, lastMedia: response));
    } catch (e) {
      emit(state.copyWith(mediaStatus: MediaStatus.error));
    }
  }

  Future<bool> checkStatus(String url) async {
    final dio = Dio(BaseOptions(
        sendTimeout: const Duration(seconds: 3),
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3)));
    try {
      final response = await dio.get(url);
      return response.statusCode == 200 &&
          response.realUri.authority != "oops.uclv.edu.cu";
    } catch (e) {
      return false;
    }
  }
}
