import 'package:api_example/model/wallpaper_model.dart';
import 'package:api_example/wallpaper_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperBloc() : super(WallpaperInitial()) {
    on<SearchWallpaperEvent>((event, emit) async {
      emit(WallpaperLoading());
      Wallpaer getwallpaper = await WallpaperRepository().getWallpaper(
        event.mqueary,
      );
      emit(WallpaperLoaded(getwallpaper));
    });
    on<TrandingWallaperEvent>((event, emit) async {
      emit(WallpaperLoading());
      Wallpaer getwallpaper =
          await WallpaperRepository().gettrandingwallpaper();
      emit(WallpaperLoaded(getwallpaper));
    });
  }
}
