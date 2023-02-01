import 'package:flutter/material.dart';
import 'package:ui_templates/albums/photos_model.dart';
import 'package:ui_templates/albums/photos_service.dart';

class AlbumDetails extends StatefulWidget {
  const AlbumDetails({Key? key, this.albumId}) : super(key: key);

  final int? albumId;

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  bool _isLoading = false;
  late final IPhotosService photosService;
  List<PhotosModel>? _items;

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    photosService = PhotosService();
    fetchItemsWithId(widget.albumId ?? 0);
  }

  Future<void> fetchItemsWithId(int albumId) async {
    changeLoading();
    _items = await photosService.fetchPhotosWithId(albumId);
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: _CardDetail(model: _items![index]),
          );
        },
      ),
    );
  }
}

class _CardDetail extends StatelessWidget {
  const _CardDetail({
    super.key,
    required PhotosModel? model,
  }) : _model = model;

  final PhotosModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Album ${_model?.albumId} Id :${_model?.id} ' ?? '',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.blueGrey),
          ),
          Text('${_model?.title}' ?? ''),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              '${_model?.url}',
              errorBuilder: (context, error, stackTree) =>
                  const Icon(Icons.hourglass_empty),
            ),
          ),
        ],
      ),
    );
  }
}
