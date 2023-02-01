import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ui_templates/albums/albums_detail_ui.dart';
import 'package:ui_templates/albums/photos_model.dart';
import 'package:ui_templates/albums/photos_service.dart';

class AlbumsUI extends StatefulWidget {
  const AlbumsUI({Key? key}) : super(key: key);

  @override
  State<AlbumsUI> createState() => _AlbumsUIState();
}

class _AlbumsUIState extends State<AlbumsUI> {
  List<PhotosModel>? _items;
  late final IPhotosService _photosService;
  bool _isLoading = false;
  late final Dio _dio;

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _photosService = PhotosService();
    _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    changeLoading();
    _items = await _photosService.fetchPhotos();
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PHOTO ALBUMS',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.blueGrey),
        ),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              itemBuilder: (context, index) {
                return _CardAlbum(model: _items![index]);
              },
              itemCount: _items?.length ?? 0,
            ),
    );
  }
}

class _CardAlbum extends StatelessWidget {
  const _CardAlbum({
    super.key,
    required PhotosModel? model,
  }) : _model = model;

  final PhotosModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 25),
        leading: Image.network(
          '${_model?.thumbnailUrl}',
        ),
        trailing: const Icon(Icons.keyboard_arrow_right),
        title: Text('Album ${_model?.albumId} Id :${_model?.id} '),
        subtitle: Text('${_model?.title}'),
        style: ListTileStyle.drawer,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AlbumDetails(
                albumId: _model?.albumId,
              ),
            ),
          );
        },
      ),
    );
  }
}
