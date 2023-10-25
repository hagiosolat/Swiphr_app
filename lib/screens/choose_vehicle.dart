import 'package:flutter/material.dart';
import 'package:swiphr_app/screens/constants/colors.dart';
import 'package:swiphr_app/screens/constants/data.dart';
import 'package:swiphr_app/screens/rate_your_trip.dart';

class ChooseVehicle extends StatelessWidget {
  const ChooseVehicle({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (contex) {
          return CarList();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.grey.shade100.withOpacity(0.2), BlendMode.dstOut),
            fit: BoxFit.cover,
            image: const AssetImage('asset/image/mapImage.png')),
        color: Colors.grey,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  child: const CircleAvatar(
                      backgroundColor: AppColors.primaryElements,
                      child: Icon(
                        Icons.menu_outlined,
                        color: AppColors.primaryBackground,
                      ))),
              const CircleAvatar(
                backgroundImage: AssetImage('asset/image/avatar.png'),
                // backgroundColor: Colors.purpleAccent,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                height: 85,
                decoration: BoxDecoration(
                    color: AppColors.secondaryBackground,
                    borderRadius: BorderRadius.circular(15)),
                child: const Column(children: [
                  Row(
                    children: [
                      Icon(
                        Icons.radio_button_on,
                        color: AppColors.primaryElements,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Skate Park'),
                    ],
                  ),
                  Divider(
                    color: AppColors.addButtonColor,
                    thickness: 2,
                    indent: 6,
                    endIndent: 6,
                  ),
                  Row(
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
                ]),
              ),
              Positioned(
                  top: 25,
                  left: 220,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 35,
                    width: 65,
                    decoration: const BoxDecoration(
                        color: AppColors.addButtonColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: GestureDetector(
                      onTap: () {
                        print('clicking');
                        _showBottomSheet(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.thirdBackground,
                            radius: 8,
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: AppColors.primaryBackground,
                            ),
                          ),
                          Text('Add'),
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}

class CarList extends StatefulWidget {
  CarList({super.key});

  @override
  State<CarList> createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  int selectedItem = 0;
  int selectedListIndex = -1;
  int discountVoucher = 1;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: AppColors.secondaryBackground,
      ),
      height: 350,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Choose your ride',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.20),
                            spreadRadius: 4,
                            blurRadius: 4,
                            offset: const Offset(0, 3))
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  child: const Icon(Icons.arrow_back_ios_new),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: carRideList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('pressing');
                    setState(() {
                      selectedItem = carRideList[index].price;
                      selectedListIndex = index;
                      total = carRideList[index].price - discountVoucher;
                    });
                    _showSecondBottomSheet(
                        context, selectedItem, discountVoucher, total);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    height: 60,
                    decoration: BoxDecoration(
                        color: selectedListIndex == index
                            ? AppColors.primaryElements
                            : AppColors.addButtonColor,
                        border: const Border(
                            top: BorderSide(color: AppColors.thirdBackground))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              carRideList[index].name,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: selectedListIndex == index
                                    ? AppColors.thirdBackground
                                    : Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              '2-3 person',
                              style: TextStyle(
                                color: selectedListIndex == index
                                    ? AppColors.thirdBackground
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$${carRideList[index].price.toString()},00",
                          style: TextStyle(
                            fontSize: 17,
                            color: selectedListIndex == index
                                ? AppColors.thirdBackground
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSecondBottomSheet(
      BuildContext context, int selectedItem, int discountVoucher, int total) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            decoration:
                const BoxDecoration(color: AppColors.secondaryBackground),
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [Text('Cash'), Icon(Icons.arrow_drop_down)],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 6),
                      width: 90,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryBackground,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.thirdBackground)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.thirdBackground,
                            radius: 8,
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: AppColors.primaryBackground,
                            ),
                          ),
                          Text(
                            'Promo code',
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RateTrip(
                              price: selectedItem,
                              discountVoucher: discountVoucher,
                              total: total,
                            )));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 30, right: 2),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(35)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'Book this car',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: AppColors.primaryBackground),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '\$${selectedItem.toString()},00',
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: AppColors.primaryBackground),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: CircleAvatar(
                                backgroundColor: AppColors.secondaryBackground,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                )),
                          )
                        ]),
                  ),
                )
                // Text('Price the king'),
                // Text('$selectedItem')
              ],
            ),
          );
        });
  }
}
