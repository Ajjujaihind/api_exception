part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class SearchWallpaperEvent extends WallpaperEvent {
  String mqueary;
  String? colorcode;
  SearchWallpaperEvent(this.mqueary, this.colorcode);
}

class TrandingWallaperEvent extends WallpaperEvent {
  TrandingWallaperEvent();
}
