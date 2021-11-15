import 'dart:async';
import 'package:by_trip/cubit/cubit.dart';
import 'package:by_trip/models/models.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:by_trip/ui/pages/home/main_page.dart';
import 'package:by_trip/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, this.wisata}) : super(key: key);

  final Wisata? wisata;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    var user = (context.read<UserCubit>().state as UserLoaded).user;
    Marker _marker = Marker(
        markerId: MarkerId(widget.wisata!.name!),
        position: LatLng(double.parse(widget.wisata!.latitude!),
            double.parse(widget.wisata!.longitude!)),
        infoWindow: InfoWindow(title: widget.wisata!.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 330,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                widget.wisata!.image!,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: kGreyColor,
                blurRadius: 70.0,
                spreadRadius: -80.0,
              )
            ]),
      );
    }

    Widget topButton() {
      return SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 33,
                              height: 33,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/icon_back.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<BookmarkCubit, BookmarkState>(
                          builder: (context, state) {
                            if (state is BookmarkLoaded) {
                              bool isBookmark = state.bookmarkItems.any(
                                  (element) => element.id == widget.wisata!.id);
                              return GestureDetector(
                                onTap: () async {
                                  if (isBookmark) {
                                    bool result = await context
                                        .read<BookmarkCubit>()
                                        .removeCartItem(widget.wisata!.id!);
                                    setState(() {
                                      if (result) {
                                        context
                                            .read<BookmarkCubit>()
                                            .getBookmarks(user);
                                        displayToastMessage(
                                            "Menghapus bookmark", context);
                                      }
                                    });
                                  } else {
                                    setState(() {
                                      context
                                          .read<BookmarkCubit>()
                                          .addWisataToBookmark(widget.wisata!);
                                      displayToastMessage(
                                          "Berhasil di tambah ke bookmark", context);
                                    });
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  width: 33,
                                  height: 33,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        isBookmark
                                            ? 'assets/icon_bookmark_fill.png'
                                            : 'assets/icon_bookmark_top.png',
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Center();
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget submitButton() {
      return CustomButton(
            textStyle: GoogleFonts.poppins(color: kWhiteColor),
            margin: const EdgeInsets.only(top: 20, bottom: 30),
            width: MediaQuery.of(context).size.width,
            title: 'Gas!',
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainPage(initialPage: 1)));
            },
          );
    }

    Widget maps() {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 170,
        child: GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
              target: LatLng(double.parse(widget.wisata!.latitude!),
                  double.parse(widget.wisata!.longitude!)),
              zoom: 17),
          onMapCreated: (GoogleMapController controller) {
            if (!_controller.isCompleted) {
              _controller.complete(controller);
            }
          },
          markers: {_marker},
        ),
      );
    }

    Widget namePlace() {
      return Padding(
        padding:  EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 350,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.wisata!.name!,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.wisata!.city!,
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Rp ${widget.wisata!.price}',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_line.png',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only( top: 20, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 33,
                              height: 33,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icon_place.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 269,
                              child: Text(
                                widget.wisata!.address!,
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: regular,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 33,
                              height: 33,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icon_open.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Buka ${widget.wisata!.open}',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: regular,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            maps(),
            submitButton()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            topButton(),
            namePlace(),
          ],
        ),
      ),
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
