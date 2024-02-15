import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Providers/AppProvider.dart';


class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDown();
}

class _CustomDropDown extends State<CustomDropDown> {
  Map<String, int> numbers = {
    'oral medications':1,
    'pharmaceuticals':2,
    'elphant':3,
    'the vaccines':4,
    'external use medicines':5,
  };

  final List<String> items = [
   'oral medications',
    'pharmaceuticals',
    'elphant',
    'the vaccines',
    'external use medicines',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: const Row(
              children: [
                Icon(
                  Icons.list,
                  size: 20,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    'List',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            items: items.map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
                Provider.of<AppStoreProvider>(context,listen: false).setCategory=value;
                Provider.of<AppStoreProvider>(context,listen: false).setCategoryId=numbers[value]!;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.blue,
                ),
                color: Colors.cyan,
              ),
              elevation: 10,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.white,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 100,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.cyan,
              ),
              offset: const Offset(1, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ));
  }
}