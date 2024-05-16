import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelkit_app/bottom_bar.dart';
import 'package:travelkit_app/model/baggage_item.dart';
import 'package:travelkit_app/model/thing_item.dart';
import 'package:travelkit_app/pages/add_thing_page.dart';
import 'package:uuid/uuid.dart';

BaggageItem currentBaggage = BaggageItem();
ThingItem currentThing = ThingItem();
List<BaggageItem> baggages = [];
List<ThingItem> things = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int addKg = 0;
  bool createItem = false;
  bool editItem = false;
  BaggageItem editBaggage = BaggageItem();
  TextEditingController nameController = TextEditingController();
  double _value = 24;
  @override
  void initState() {
    super.initState();
    getShared(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5A89A5),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 65, 16, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Packed suitcases',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Your baggage',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: const Color(0xFFF5F5F5).withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: baggages.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          if (!createItem)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9),
                              child: Container(
                                height: 162,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: const Color(0xFFF5F5F5)
                                            .withOpacity(0.14))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 12, 10, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Add Baggage to start collecting your belongings.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Image.asset('assets/no_baggage.png')
                                  ],
                                ),
                              ),
                            ),
                          if (createItem)
                            Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 12, 8, 12),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF3E7795),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/create.png'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Create Baggage',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 12, 8, 12),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5)
                                          .withOpacity(0.08),
                                      border: Border.all(
                                          color: const Color(0xFFF5F5F5)
                                              .withOpacity(0.14)),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12))),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'Baggage name',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        const Color(0xFFF5F5F5)
                                                            .withOpacity(0.4),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: SizedBox(
                                          height: 44,
                                          child: TextField(
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  15),
                                            ],
                                            cursorColor: Colors.white,
                                            controller: nameController,
                                            style: const TextStyle(
                                                fontFamily: 'SF Pro Text',
                                                color: Color(0xFFEBF5ED),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                            decoration: InputDecoration(
                                              hintText: 'Write baggage name',
                                              hintStyle: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  color: const Color(0xFFF5F5F5)
                                                      .withOpacity(0.4),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                              filled: true,
                                              fillColor: const Color(0xFFF5F5F5)
                                                  .withOpacity(0.08),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: BorderSide.none,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                            onChanged: (text) {
                                              nameController.text = text;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'Laggage size (kg)',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        const Color(0xFFF5F5F5)
                                                            .withOpacity(0.4),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _value.toStringAsFixed(0),
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                fontFamily: 'SF Pro Text',
                                                color: Color(0xFFF5F5F5),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '32',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Text',
                                                color: const Color(0xFFF5F5F5)
                                                    .withOpacity(0.4),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SliderTheme(
                                        data: const SliderThemeData(
                                          overlayColor: Colors
                                              .transparent, // <- disable "glow effect"
                                        ),
                                        child: Slider(
                                          activeColor: Colors.white,
                                          inactiveColor:
                                              Colors.white.withOpacity(0.08),
                                          min: 24,
                                          max: 32,
                                          value: _value,
                                          onChanged: (v) =>
                                              setState(() => _value = v),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (nameController.text.isNotEmpty) {
                                            BaggageItem baggage = BaggageItem();
                                            baggage.id = const Uuid().v1();
                                            baggage.name = nameController.text;
                                            baggage.size = _value;
                                            baggages.add(baggage);
                                            createItem = false;
                                            addShared();
                                            setState(() {});
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Divider(
                                              color: const Color(0xFFF5F5F5)
                                                  .withOpacity(0.08),
                                            ),
                                            const Text(
                                              'Done',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  color: Color(0xFFF5F5F5),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          if (baggages.isEmpty && !createItem)
                            InkWell(
                              onTap: () {
                                nameController.text = '';
                                createItem = true;
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: const Color(0xFFF5F5F5)
                                            .withOpacity(0.14))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/add_baggage.png'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Add Baggage',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          if (createItem)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 12, 8, 12),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF3E7795),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12))),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/create.png'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Create Baggage',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 12, 8, 12),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF5F5F5)
                                            .withOpacity(0.08),
                                        border: Border.all(
                                            color: const Color(0xFFF5F5F5)
                                                .withOpacity(0.14)),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12))),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  'Baggage name',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: 'SF Pro Text',
                                                      color: const Color(
                                                              0xFFF5F5F5)
                                                          .withOpacity(0.4),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: SizedBox(
                                            height: 44,
                                            child: TextField(
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    15),
                                              ],
                                              cursorColor: Colors.white,
                                              controller: nameController,
                                              style: const TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  color: Color(0xFFEBF5ED),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                              decoration: InputDecoration(
                                                hintText: 'Write baggage name',
                                                hintStyle: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    color:
                                                        const Color(0xFFF5F5F5)
                                                            .withOpacity(0.4),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16),
                                                filled: true,
                                                fillColor:
                                                    const Color(0xFFF5F5F5)
                                                        .withOpacity(0.08),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              onChanged: (text) {
                                                nameController.text = text;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  'Laggage size (kg)',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: 'SF Pro Text',
                                                      color: const Color(
                                                              0xFFF5F5F5)
                                                          .withOpacity(0.4),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _value.toStringAsFixed(0),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  color: Color(0xFFF5F5F5),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              '32',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  color: const Color(0xFFF5F5F5)
                                                      .withOpacity(0.4),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SliderTheme(
                                          data: const SliderThemeData(
                                            overlayColor: Colors
                                                .transparent, // <- disable "glow effect"
                                          ),
                                          child: Slider(
                                            activeColor: Colors.white,
                                            inactiveColor:
                                                Colors.white.withOpacity(0.08),
                                            min: 24,
                                            max: 32,
                                            value: _value,
                                            onChanged: (v) =>
                                                setState(() => _value = v),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (nameController
                                                .text.isNotEmpty) {
                                              BaggageItem baggage =
                                                  BaggageItem();
                                              baggage.id = const Uuid().v1();
                                              baggage.name =
                                                  nameController.text;
                                              baggage.size = _value;
                                              baggages.add(baggage);
                                              createItem = false;
                                              addShared();
                                              setState(() {});
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Divider(
                                                color: const Color(0xFFF5F5F5)
                                                    .withOpacity(0.08),
                                              ),
                                              const Text(
                                                'Done',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    color: Color(0xFFF5F5F5),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          getBaggages()
                        ],
                      ),
                    ),
            ),
          ),
          if (baggages.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 23, left: 16, right: 16),
              child: InkWell(
                onTap: () {
                  nameController.text = '';
                  createItem = true;
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(0xFFF5F5F5).withOpacity(0.14))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/add_baggage.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Add Baggage',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const BottomBar()
        ],
      ),
    );
  }

  Widget getBaggages() {
    List<Widget> list = [];

    for (var baggage in baggages) {
      getCounts(baggage);
      if (!editItem || editBaggage != baggage) {
        list.add(Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              decoration: const BoxDecoration(
                  color: Color(0xFF3E7795),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/create.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        baggage.name!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      editBaggage = baggage;
                      nameController.text = editBaggage.name!;
                      _value = editBaggage.size!;
                      editItem = true;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5).withOpacity(0.08),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Image.asset('assets/edit.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Edit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5).withOpacity(0.08),
                  border: Border.all(
                      color: const Color(0xFFF5F5F5).withOpacity(0.14)),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: things
                      .where((element) => element.baggageId == baggage.id)
                      .isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Your baggage empty',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: Text(
                            'Add things to fill your baggage.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Image.asset('assets/baggage.png'),
                        InkWell(
                          onTap: () {
                            currentBaggage = baggage;
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const AddThingPage(
                                        isEdit: false,
                                      )),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                              color: const Color(0xFFF5F5F5).withOpacity(0.08),
                            ))),
                            padding: const EdgeInsets.only(bottom: 12, top: 8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/add_thing.png'),
                                    const Text(
                                      'Add things',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          color: Color(0xFFF5F5F5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        getThings(baggage),
                        InkWell(
                          onTap: () {
                            currentBaggage = baggage;
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const AddThingPage(
                                        isEdit: false,
                                      )),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                              color: const Color(0xFFF5F5F5).withOpacity(0.08),
                            ))),
                            padding: const EdgeInsets.only(bottom: 12, top: 8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/add_thing.png'),
                                    const Text(
                                      'Add things',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          color: Color(0xFFF5F5F5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Baggage fill',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: const Color(0xFFF5F5F5).withOpacity(0.4),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/weight.png'),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${baggage.currentKg}/${baggage.size!.toStringAsFixed(0)} kg',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Color(0xFFF5F5F5),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset('assets/weight.png'),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${baggage.currentGram} grams',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Color(0xFFF5F5F5),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
      }
      if (editItem && editBaggage == baggage) {
        list.add(
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                decoration: const BoxDecoration(
                    color: Color(0xFF3E7795),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: Row(
                  children: [
                    Image.asset('assets/create.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Edit Baggage',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5).withOpacity(0.08),
                    border: Border.all(
                        color: const Color(0xFFF5F5F5).withOpacity(0.14)),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Baggage name',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  color:
                                      const Color(0xFFF5F5F5).withOpacity(0.4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 44,
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(15),
                          ],
                          cursorColor: Colors.white,
                          controller: nameController,
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Color(0xFFEBF5ED),
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Write baggage name',
                            hintStyle: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: const Color(0xFFF5F5F5).withOpacity(0.4),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            filled: true,
                            fillColor:
                                const Color(0xFFF5F5F5).withOpacity(0.08),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (text) {
                            nameController.text = text;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Laggage size (kg)',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  color:
                                      const Color(0xFFF5F5F5).withOpacity(0.4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _value.toStringAsFixed(0),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Color(0xFFF5F5F5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '32',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: const Color(0xFFF5F5F5).withOpacity(0.4),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        overlayColor:
                            Colors.transparent, // <- disable "glow effect"
                      ),
                      child: Slider(
                        activeColor: Colors.white,
                        inactiveColor: Colors.white.withOpacity(0.08),
                        min: 24,
                        max: 32,
                        value: _value,
                        onChanged: (v) => setState(() => _value = v),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (nameController.text.isNotEmpty) {
                          editBaggage.name = nameController.text;
                          editBaggage.size = _value;
                          baggages.removeWhere(
                            (element) => element.id == editBaggage.id,
                          );
                          baggages.add(editBaggage);
                          editItem = false;
                          addShared();
                          setState(() {});
                        }
                      },
                      child: Column(
                        children: [
                          Divider(
                            color: const Color(0xFFF5F5F5).withOpacity(0.08),
                          ),
                          const Text(
                            'Done',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Color(0xFFF5F5F5),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getThings(BaggageItem baggage) {
    List<Widget> list = [];
    for (var thing in things.where(
      (element) => element.baggageId == baggage.id,
    )) {
      if ((thing != things.first || thing != things.last)) {
        list.add(Divider(
          color: const Color(0xFFF5F5F5).withOpacity(0.14),
        ));
      }
      list.add(Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Description',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: const Color(0xFFF5F5F5).withOpacity(0.4),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    '${thing.description}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFFF5F5F5),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(thing.type == EThingType.clothes
                        ? 'assets/clothes.png'
                        : thing.type == EThingType.cosmetics
                            ? 'assets/cosmetics.png'
                            : thing.type == EThingType.documents
                                ? 'assets/documents.png'
                                : thing.type == EThingType.electronics
                                    ? 'assets/electronics.png'
                                    : thing.type == EThingType.hygiene
                                        ? 'assets/hygiene.png'
                                        : thing.type == EThingType.jewelry
                                            ? 'assets/jewelry.png'
                                            : 'assets/medication.png'),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      thing.type!.text,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Color(0xFFF5F5F5),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    currentBaggage = baggage;
                    currentThing = thing;
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const AddThingPage(
                                isEdit: true,
                              )),
                    );
                  },
                  child: Row(
                    children: [
                      const Text(
                        'Edit',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Color(0xFFF5F5F5),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: const Color(0xFFF5F5F5).withOpacity(0.4),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ));
    }
    if (things.length > 1) {
      list.remove(list.first);
    }
    return Column(
      children: list,
    );
  }

  void getCounts(BaggageItem baggage) {
    int numberInKg = 0;
    int numberInGrams = 0;
    for (var thing in things.where(
      (element) =>
          element.baggageId == baggage.id &&
          element.countType == EThingCount.kg,
    )) {
      numberInKg = numberInKg + thing.size!;
    }
    for (var thing in things.where(
      (element) =>
          element.baggageId == baggage.id &&
          element.countType == EThingCount.gram,
    )) {
      numberInGrams = numberInGrams + thing.size!;
    }
    if (numberInGrams >= 1000) {
      numberInKg = numberInKg + 1;
      numberInGrams = numberInGrams - 1000;
      setState(() {});
    }
    baggage.currentKg = numberInKg;
    baggage.currentGram = numberInGrams;
  }
}

Future<void> addShared() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('baggages', jsonEncode(baggages));
  prefs.setString('things', jsonEncode(things));
}

void getShared(Function() callBack) async {
  final prefs = await SharedPreferences.getInstance();

  final List<dynamic> jsonData1 =
      jsonDecode(prefs.getString('baggages') ?? '[]');
  final List<dynamic> jsonData2 = jsonDecode(prefs.getString('things') ?? '[]');

  baggages = jsonData1.map<BaggageItem>((jsonList) {
    {
      return BaggageItem.fromJson(jsonList);
    }
  }).toList();
  things = jsonData2.map<ThingItem>((jsonList) {
    {
      return ThingItem.fromJson(jsonList);
    }
  }).toList();

  callBack();
}
