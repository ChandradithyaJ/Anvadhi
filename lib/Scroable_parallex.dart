import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:anvadhi/services/routes.dart';
import 'package:geocoding/geocoding.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:anvadhi/Full_image.dart';
//need to add navigation on image tap

class ExampleParallax extends StatelessWidget {
  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }
 
  const ExampleParallax({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 20),
      
          const SizedBox(height: 20),

          Text("Lets Explore the Art World", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          for (final art in arts)
            artListItem(
              imageUrl: art.imageUrl,
              name: art.name,
              country: art.place,
              Description :art.Description,
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
    required this.Description,


  });

  final String imageUrl;
  final String name;
  final String country;
  final String Description;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
         int imageIndex = arts.indexWhere((art) => art.imageUrl == imageUrl);
        
        // Navigate to FullScreenImagePage with the imageUrls and initialPageIndex.
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FullScreenImagePage(
              imageUrls: arts.map((art) => art.imageUrl).toList(),
              initialPageIndex: imageIndex,
            
            ),
          ),
        );
      },
    
    
    
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
     
      child: Column(
        children: [
          
           AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  _buildParallaxBackground(context),
                  _buildGradient(),
                  _buildTitleAndSubtitle(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.network(
          imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
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

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
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
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Parallax extends SingleChildRenderObjectWidget {
  const Parallax({
    super.key,
    required Widget background,
  }) : super(child: background);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderParallax(scrollable: Scrollable.of(context));
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderParallax renderObject) {
    renderObject.scrollable = Scrollable.of(context);
  }
}

class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderParallax extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderParallax({
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
    if (child.parentData is! ParallaxParentData) {
      child.parentData = ParallaxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    // Force the background to take up all available width
    // and then scale its height based on the image's aspect ratio.
    final background = child!;
    final backgroundImageConstraints =
        BoxConstraints.tightFor(width: size.width);
    background.layout(backgroundImageConstraints, parentUsesSize: true);

    // Set the background's local offset, which is zero.
    (background.parentData as ParallaxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Get the size of the scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;

    // Calculate the global position of this list item.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final backgroundOffset =
        localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final scrollFraction =
        (backgroundOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
        background,
        (background.parentData as ParallaxParentData).offset +
            offset +
            Offset(0.0, childRect.top));
  }
}

class art {
  const art({
    required this.name,
    required this.place,
    required this.imageUrl,
    required this.Description,
  });

  final String name;
  final String place;
  final String imageUrl;
  final String Description;
}
const arts = [
  art(
    name: 'kalankari',
    place: 'Andhra Pradesh',
    imageUrl: 'lib/assets/images/kalamkari1.jpg',
    Description: "aaaa",
  ),
  art(
    name: 'Gatka art',
    place: 'Punjab',
    imageUrl: 'lib/assets/images/sankrintan3.jpg',
    Description: "aaaa",

  ),
    art(
    name: 'Thang - Lo',
    place: 'Manipur',
    imageUrl: 'lib/assets/images/image.jpg',
    Description: "aaaa",

  ),
  art(
    name: 'Thang - Lo',
    place: 'Manipur',
    imageUrl: 'lib/assets/images/image.jpg',
    Description: "aaaa",

  ),
  art(
    name: 'Thang - Lo',
    place: 'Manipur',
    imageUrl: 'lib/assets/images/image.jpg',
    Description: "aaaa",
  ),
  art(
    name: 'Thang - Lo',
    place: 'Manipur',
    imageUrl: 'lib/assets/images/Thang-Ta1.jpg',
    Description: "aaaa",

  ),
  art(
    name: 'Thang - Lo',
    place: 'Manipur',
    imageUrl: 'lib/assets/images/Thang-Ta2.jpg',
    Description: "aaaa",
  ),
  
];