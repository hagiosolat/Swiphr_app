import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:swiphr_app/screens/choose_vehicle.dart';
import 'package:swiphr_app/screens/constants/colors.dart';

class RateTrip extends StatelessWidget {
  const RateTrip(
      {required this.total,
      required this.discountVoucher,
      required this.price,
      super.key});
  final int? price;
  final int? discountVoucher;
  final int? total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.purple,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryElements,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, left: 30),
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.clear_outlined,
                      color: AppColors.primaryElements,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50, left: 40),
                    child: Text(
                      'Rate Your Trip',
                      style: TextStyle(
                        color: AppColors.primaryBackground,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
              top: 100,
              child: secondContainer(
                  context, price ?? 0, discountVoucher ?? 0, total ?? 0))
        ],
      ),
    );
  }
}

secondContainer(
  BuildContext context,
  int price,
  int discountVoucher,
  int total,
) {
  return Container(
    padding: const EdgeInsets.only(
      top: 30,
    ),
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('asset/image/avatar.png'),
                    // backgroundColor: AppColors.primaryElements,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Taiwo Oladipupo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('⭐' '' + '4.9'),
                    ],
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  GestureDetector(
                      child: const CircleAvatar(
                          backgroundColor: AppColors.primaryElements,
                          child: Icon(
                            Icons.chat_bubble,
                            color: AppColors.primaryBackground,
                          ))),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.only(left: 55),
          child: Column(
            children: [
              const Text(
                'How is your trip?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppin',
                  fontSize: 20,
                ),
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (value) {},
                itemBuilder: (context, _) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            minLines: 3,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: AppColors.thirdBackground)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: AppColors.thirdBackground)),
              filled: true,
              fillColor: AppColors.primaryBackground,
              hintText: 'write your feedback',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 27.0),
          child: Text(
            'Trip Detail',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppin',
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  decoration: const BoxDecoration(
                      color: AppColors.primaryBackground,
                      border: Border(
                        top: BorderSide(color: AppColors.thirdBackground),
                      )),
                  height: 50,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.radio_button_checked,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Skate Park'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  decoration: const BoxDecoration(
                      color: AppColors.primaryBackground,
                      border: Border(
                          top: BorderSide(color: AppColors.thirdBackground),
                          bottom:
                              BorderSide(color: AppColors.thirdBackground))),
                  height: 50,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Home'),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
                top: 34,
                left: 27,
                child: Dash(
                  direction: Axis.vertical,
                  length: 28,
                  dashLength: 3,
                  dashColor: Colors.grey,
                ))
          ],
        ),
        // ),
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Payment Detail',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppin',
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Trip Expense'),
                  Text('\$${price.toString()},00')
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Discount Voucher'),
                  Text('\$${discountVoucher.toString()},00')
                ],
              ),
              const SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'),
                  Text('\$${total.toString()},00')
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const ChooseVehicle()),
                      (route) => false);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 18, color: AppColors.primaryBackground),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
