import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelkit_app/bottom_bar.dart';
import 'package:travelkit_app/model/thing_item.dart';
import 'package:travelkit_app/pages/home_page.dart';
import 'package:uuid/uuid.dart';

class AddThingPage extends StatefulWidget {
  const AddThingPage({super.key, required this.isEdit});
  final bool isEdit;

  @override
  State<AddThingPage> createState() => _AddThingPageState();
}

class _AddThingPageState extends State<AddThingPage> {
  TextEditingController descriptionController = TextEditingController();
  List<EThingType> types = [
    EThingType.clothes,
    EThingType.hygiene,
    EThingType.cosmetics,
    EThingType.electronics,
    EThingType.medication,
    EThingType.jewelry,
    EThingType.documents
  ];
  EThingType selected = EThingType.clothes;
  EThingCount selectedCount = EThingCount.kg;
  List<EThingCount> typeCount = [EThingCount.kg, EThingCount.gram];
  int thingCount = 0;
  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      descriptionController.text = currentThing.description!;
      selected = currentThing.type!;
      selectedCount = currentThing.countType!;
      if (selectedCount == EThingCount.kg) {
        typeCount = [EThingCount.kg, EThingCount.gram];
      } else {
        typeCount = [EThingCount.gram, EThingCount.kg];
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5A89A5),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Add things',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (!widget.isEdit) {
                      if (descriptionController.text.isNotEmpty) {
                        ThingItem newItem = ThingItem();
                        newItem.id = const Uuid().v1();
                        newItem.baggageId = currentBaggage.id;
                        newItem.description = descriptionController.text;
                        newItem.type = selected;
                        newItem.countType = selectedCount;
                        newItem.size = thingCount;
                        things.add(newItem);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const HomePage()),
                        );
                      }
                    } else {
                      currentThing.description = descriptionController.text;
                      currentThing.type = selected;
                      currentThing.countType = selectedCount;
                      currentThing.size = thingCount;
                      things.removeWhere(
                        (element) => element.id == currentThing.id,
                      );
                      things.add(currentThing);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomePage()),
                      );
                    }
                    addShared();
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: TextField(
                        maxLines: 3,
                        cursorColor: Colors.white,
                        controller: descriptionController,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Color(0xFFEBF5ED),
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'What do you want to take?',
                          hintStyle: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: const Color(0xFFF5F5F5).withOpacity(0.4),
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5).withOpacity(0.08),
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
                          descriptionController.text = text;
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Category',
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
                      padding: const EdgeInsets.only(bottom: 16),
                      child: getTypes(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Weight (kg/gram)',
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
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        width: 358,
                        height: 216,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5).withOpacity(0.08),
                            border: Border.all(
                              color: const Color(0xFFF5F5F5).withOpacity(0.14),
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/weight.png'),
                            if (selectedCount == EThingCount.kg)
                              SizedBox(
                                width: 50,
                                height: 200,
                                child: CupertinoPicker(
                                  itemExtent: 33,
                                  onSelectedItemChanged: (value) {
                                    thingCount = value;
                                  },
                                  children: List.generate(
                                    34,
                                    (index) => Text(
                                      "$index",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            if (selectedCount == EThingCount.gram)
                              SizedBox(
                                width: 60,
                                height: 200,
                                child: CupertinoPicker(
                                  itemExtent: 33,
                                  onSelectedItemChanged: (value) {
                                    thingCount = value;
                                  },
                                  children: List.generate(
                                    900,
                                    (index) => Text(
                                      "$index",
                                      style: const TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          color: Color(0xFFF5F5F5),
                                          fontSize: 23,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 60,
                              height: 200,
                              child: CupertinoPicker(
                                  itemExtent: 33,
                                  onSelectedItemChanged: (value) {
                                    if (value == 0) {
                                      selectedCount = EThingCount.kg;
                                    } else {
                                      selectedCount = EThingCount.gram;
                                    }
                                    setState(() {});
                                  },
                                  children: getCounts()),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (widget.isEdit)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: InkWell(
                onTap: () {
                  things.removeWhere(
                    (element) => element.id == currentThing.id,
                  );
                  addShared();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/delete.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Delete',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Color(0xFFF5F5F5),
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

  List<Widget> getCounts() {
    List<Widget> list = [];
    for (var count in typeCount) {
      list.add(Text(
        count.text,
        style: const TextStyle(
            fontFamily: 'SF Pro Text',
            color: Color(0xFFF5F5F5),
            fontSize: 23,
            fontWeight: FontWeight.w400),
      ));
    }
    return list;
  }

  Widget getTypes() {
    List<Widget> list = [];
    for (var type in types) {
      list.add(InkWell(
          onTap: () {
            selected = type;
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: selected == type
                    ? const Color(0xFF3E7795).withOpacity(0.64)
                    : const Color(0xFFF5F5F5).withOpacity(0.08)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(type == EThingType.clothes
                    ? 'assets/clothes.png'
                    : type == EThingType.cosmetics
                        ? 'assets/cosmetics.png'
                        : type == EThingType.documents
                            ? 'assets/documents.png'
                            : type == EThingType.electronics
                                ? 'assets/electronics.png'
                                : type == EThingType.hygiene
                                    ? 'assets/hygiene.png'
                                    : type == EThingType.jewelry
                                        ? 'assets/jewelry.png'
                                        : 'assets/medication.png'),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  type.text,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: selected == type
                          ? const Color(0xFFF5F5F5)
                          : const Color(0xFFF5F5F5).withOpacity(0.4),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                if (selected == type)
                  const SizedBox(
                    width: 10,
                  ),
                if (selected == type) Image.asset('assets/check.png')
              ],
            ),
          )));
    }
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: list,
    );
  }
}
