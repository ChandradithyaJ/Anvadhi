import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:firebase_storage/firebase_storage.dart';
import './customWidgets/art_details.dart';

class ArtsDisplay extends StatelessWidget {

  Map<String, dynamic> selectedArtForm;
  List<Map<String, dynamic>> ArtForms;

  ArtsDisplay({ required this.ArtForms, required this.selectedArtForm }) : super();

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> convertGsToHttps() async {
    for (var artItem in ArtForms) {
      if (artItem['image'].startsWith('gs://')) {
        var gsReference = FirebaseStorage.instance.refFromURL(artItem['image']);
        var downloadUrl = await gsReference.getDownloadURL();
        artItem['image'] = downloadUrl;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    convertGsToHttps();
    return Scaffold(
        body: LiquidPullToRefresh( onRefresh: _refresh,
        springAnimationDurationInMilliseconds: 1000,
         color: Colors.deepPurple,
          backgroundColor: Colors.deepPurple[100],
          height: 100.0,
          animSpeedFactor: 2,
          showChildOpacityTransition: true,
  
       child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text("Lets Explore the Art World", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          for (final art in ArtForms)
            artListItem(
              imageUrl: art['image'],
              name: art['artName'],
              country: art['location'],
              selectedArtForm: art,
            ),
        ],
      ),
    ),
        ),
    );
  }
}

class artListItem extends StatelessWidget {

  artListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.country,
    required this.selectedArtForm,
  });

  Map<String, dynamic> selectedArtForm;
  final String imageUrl;
  final String name;
  final String country;
  final GlobalKey _backgroundImageKey = GlobalKey();
   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtDetails(artForm: selectedArtForm),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
     
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 5 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    _buildPlxBackground(context),
                    _buildGradient(),
                    _buildTitleAndSubtitle(),
                  ],
                ),
              ),
            ),
          // ),
        ],
      ),
    ),
    );
  }

  Widget _buildPlxBackground(BuildContext context) {
    final storage = FirebaseStorage.instance;

    Future<Widget> _getImage(BuildContext context, String image) async {
      final ref = storage.ref().child(imageUrl);
      final downloadUrl = await ref.getDownloadURL();
      return Image.network(
        downloadUrl,
        key: _backgroundImageKey,
        fit: BoxFit.fill,
      );
    }

    return Flow(
      delegate: PlxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        FutureBuilder(
          future: _getImage(context, imageUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
            ConnectionState.done) {
            // if (snapshot.hasError) {
            //   return SomethingWentWrong();
            // }
              return Container(
                height: MediaQuery.of(context)
                    .size
                    .height,
                width: MediaQuery.of(context)
                    .size
                    .width,
                child: snapshot.data,
                );
              } else if (snapshot.connectionState ==
                ConnectionState.waiting) {
                return Container(
                  height: MediaQuery.of(context)
                      .size
                      .height,
                  width: MediaQuery.of(context)
                      .size
                      .width,
                  child: const CircularProgressIndicator(),
                );
              } else {
              // CircularProgressIndicator();
                return Container();
              }
            },
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class PlxFlowDelegate extends FlowDelegate {
  PlxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);


  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(PlxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Plx extends SingleChildRenderObjectWidget {
  const Plx({
    super.key,
    required Widget background,
  }) : super(child: background);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderPlx(scrollable: Scrollable.of(context));
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderPlx renderObject) {
    renderObject.scrollable = Scrollable.of(context);
  }
}

class PlxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderPlx extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderPlx({
    required ScrollableState scrollable,
  }) : _scrollable = scrollable;

  ScrollableState _scrollable;

  ScrollableState get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    if (value != _scrollable) {
      if (attached) {
        _scrollable.position.removeListener(markNeedsLayout);
      }
      _scrollable = value;
      if (attached) {
        _scrollable.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! PlxParentData) {
      child.parentData = PlxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;


    final background = child!;
    final backgroundImageConstraints =
        BoxConstraints.tightFor(width: size.width);
    background.layout(backgroundImageConstraints, parentUsesSize: true);

    (background.parentData as PlxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {

    final viewportDimension = scrollable.position.viewportDimension;


    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final backgroundOffset =
        localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

   
    final scrollFraction =
        (backgroundOffset.dy / viewportDimension).clamp(0.0, 1.0);


    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

  
    context.paintChild(
        background,
        (background.parentData as PlxParentData).offset +
            offset +
            Offset(0.0, childRect.top));
  }
}
