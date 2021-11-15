import 'dart:async';

import 'package:by_trip/cubit/cubit.dart';
import 'package:by_trip/models/models.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:by_trip/ui/widgets/explore_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../detail_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with AutomaticKeepAliveClientMixin {
  List<Marker> markers = [];

  late double latitude;

  late double longitude;

  final Completer<GoogleMapController> _controller = Completer();

  List list = [];

  FloatingSearchBarController? searchBarController;
  _placeCardClicked(double lat, double lng) async {
    setState(() {
      latitude = lat;
      longitude = lng;
    });

    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 17,
        tilt: 55,
        bearing: 192)));
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    searchBarController = FloatingSearchBarController();
    switch ((context.read<UserCubit>().state as UserLoaded).user.city) {
      case "Makassar":
        latitude = -5.1507279;
        longitude = 119.4305632;
        break;
      case "Tulungagung":
        latitude = -8.1483087;
        longitude = 111.8187391;
        break;
      case "Banyumas":
        latitude = -7.4542324;
        longitude = 108.8883719;
        break;
      default:
    }
  }

  @override
  void dispose() {
    searchBarController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Wisata> searchList =
        (context.read<WisataCubit>().state as WisataLoaded).item;
    super.build(context);
    Widget exploreCard() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 180,
          margin: const EdgeInsets.only(
            bottom: 100,
          ),
          child: BlocBuilder<WisataCubit, WisataState>(builder: (_, state) {
            if (state is WisataLoaded) {
              List<Wisata> listWisata = state.item;
              return ListView.builder(
                itemCount: listWisata.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var wisata = listWisata[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        left: (wisata == listWisata.first) ? 25 : 0, right: 25),
                    child: GestureDetector(
                      onTap: () {
                        _placeCardClicked(double.parse(wisata.latitude!),
                            double.parse(wisata.longitude!));
                      },
                      child: ExploreCard(
                        wisata: wisata,
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: loadingIndicator,
              );
            }
          }),
        ),
      );
    }

    Widget googleMaps() {
      return BlocBuilder<WisataCubit, WisataState>(builder: (_, state) {
        if (state is WisataLoaded) {
          List<Wisata> listWisata = state.item;

          markers = listWisata.map((wisata) {
            return Marker(
                markerId: MarkerId(wisata.name!),
                position: LatLng(double.parse(wisata.latitude!),
                    double.parse(wisata.longitude!)),
                infoWindow: InfoWindow(
                    title: wisata.slug,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailPage(
                                wisata: wisata,
                              )));
                    }),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed));
          }).toList();
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              initialCameraPosition:
                  CameraPosition(target: LatLng(latitude, longitude), zoom: 12),
              onMapCreated: (GoogleMapController controller) {
                if (!_controller.isCompleted) {
                  _controller.complete(controller);
                }
              },
              markers: markers.toSet(),
            ),
          );
        } else {
          return Center(
            child: loadingIndicator,
          );
        }
      });
    }

    Widget buildFloatingSearchBar() {
      final isPortrait =
          MediaQuery.of(context).orientation == Orientation.portrait;

      return FloatingSearchBar(
        controller: searchBarController,
        margins: const EdgeInsets.only(left: 25, right: 25, top: 30),
        hint: 'Search...',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 500),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          if (query.isNotEmpty) {
            setState(() {
              list.clear();
              for (var search in searchList) {
                if (search.name!.toLowerCase().contains(query.toLowerCase())) {
                  list.add(search);
                }
              }
            });
          } else {
            setState(() {
              list.clear();
              list.addAll(searchList);
            });
          }
        },
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction.searchToClear(
            showIfClosed: true,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: list.map((wisata) {
                    return ListTile(
                      leading: const Icon(Icons.place),
                      title: Text(wisata.name!),
                      subtitle: Text("${wisata.city!}, ${wisata.province}"),
                      onTap: () {
                        _placeCardClicked(double.parse(wisata.latitude!),
                            double.parse(wisata.longitude!));
                        searchBarController!.close();
                      },
                    );
                  }).toList(),
                )),
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [googleMaps(), exploreCard(), buildFloatingSearchBar()],
      ),
    );
  }
}
