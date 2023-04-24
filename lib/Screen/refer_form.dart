import 'dart:convert';
import 'package:aimbiz360/Helper/Color.dart';
import 'package:aimbiz360/Helper/Session.dart';
import 'package:aimbiz360/Helper/String.dart';
import 'package:aimbiz360/Model/Section_Model.dart';

import 'package:aimbiz360/Model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReferForm extends StatefulWidget {
   Product? data;
   ReferForm({Key? key, this.data}) : super(key: key);

  @override
  State<ReferForm> createState() => _ReferFormState();
}

class _ReferFormState extends State<ReferForm> {

  int? _value = 1;
  String shareInfo = "1";
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController symptomsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getAnimalList();
  }
  List options = ['Yes' , 'No'];

  String? categoryValue;
  String? selectedOption;
  // List<AnimalList> animalList = [];

  submitLead() async{
    var headers = {
      // 'Token': jwtToken.toString(),
      // 'Authorisedkey': authKey.toString(),
      'Cookie': 'ci_session=aa83f4f9d3335df625437992bb79565d0973f564'
    };
    var request = http.MultipartRequest('POST', Uri.parse(referFormApi.toString()));
    request.fields.addAll({
      USER_ID: '$CUR_USERID',
    'name': nameController.text.toString(),
    'mobile': mobileController.text.toString(),
    'share_info': shareInfo,
      'category_id': widget.data!.subList != null ? categoryValue.toString() : widget.data!.id.toString()
    });

    print("this is refer request ${request.fields.toString()}");
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String str = await response.stream.bytesToString();
      var result = json.decode(str);
      setSnackbar("${result['message'].toString()}", context);
      Navigator.pop(context);
      // final finalResponse = AnimalTypeModel.fromJson(result);
      // setState(() {
        // animalList = finalResponse.data!;
      // });
      // print("this is operator list ----->>>> ${operatorList[0].name}");
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: colors.primary,)),
        backgroundColor: colors.whiteTemp,
        centerTitle: true,
        title: Text("Refer Form", style: TextStyle(
          color: colors.primary
        ),),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
            child: Column(
              children: [
                widget.data!.subList != null ?
                Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                      ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text('Select type'), // Not necessary for Option 1
                      value: categoryValue,
                      onChanged: (String? newValue) {
                       setState(() {
                         categoryValue = newValue;
                       });
                       print("this is category value $categoryValue");
                      },
                      items: widget.data!.subList!.map((item) {
                        return DropdownMenuItem(
                          child:  Text(item.name!, style:TextStyle(color: Theme.of(context).colorScheme.fontColor),),
                          value: item.id,
                        );
                      }).toList(),
                    ),
                  ),
                )
                )
                : SizedBox.shrink(),

                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
                      controller: nameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name"
                      ),
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       padding: EdgeInsets.all(8),
                //       height: 50,
                //       width: MediaQuery.of(context).size.width/2 -30,
                //       decoration: BoxDecoration(
                //           color: Theme.of(context).colorScheme.white,
                //           borderRadius: BorderRadius.circular(12),
                //           border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                //       ),
                //       child: TextFormField(
                //         controller: ageController,
                //         keyboardType: TextInputType.number,
                //         decoration: InputDecoration(
                //             border: InputBorder.none,
                //             suffix: Text("yrs."),
                //             hintText: "Age"
                //         ),
                //       ),
                //     ),
                //     Container(
                //       padding: EdgeInsets.all(8),
                //       height: 50,
                //       decoration: BoxDecoration(
                //           color: Theme.of(context).colorScheme.white,
                //           borderRadius: BorderRadius.circular(12),
                //           border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                //       ),
                //       width: MediaQuery.of(context).size.width/2 -30,
                //       child: TextFormField(
                //         controller: weightController,
                //         keyboardType: TextInputType.number,
                //         decoration: InputDecoration(
                //             border: InputBorder.none,
                //             suffix: Text("kgs"),
                //             hintText: "Weight"
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      controller: mobileController,
                      decoration: InputDecoration(
                        counterText: '',
                          border: InputBorder.none,
                          hintText: "Mobile"
                      ),
                    ),
                  ),
                ),
                Text("Can our sales team describe your name to the client?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                ),),
                Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Text('Select option'), // Not necessary for Option 1
                          value: selectedOption,
                          onChanged: (newValue) {
                            setState(() {
                              selectedOption = newValue.toString();
                            });
                            print("this is selected option $selectedOption");
                          },
                          items: options.map((item) {
                            return DropdownMenuItem(
                              child:  Text(item, style:TextStyle(color: Theme.of(context).colorScheme.fontColor),),
                              value: item,
                            );
                          }).toList(),
                        ),
                      ),
                    )
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Radio(
                //             value: 1,
                //             fillColor: MaterialStateColor.resolveWith(
                //                     (states) =>  colors.primary),
                //             groupValue: _value,
                //             onChanged: (int? value) {
                //               setState(() {
                //                 _value = value!;
                //                 shareInfo = "1";
                //                 // gender = 'male';
                //                 // isUpi = false;
                //               });
                //             }),
                //         Text(
                //           "YES",
                //           // style: TextStyle(color:  colors.primary),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Radio(
                //             value: 2,
                //             fillColor: MaterialStateColor.resolveWith(
                //                     (states) => colors.primary),
                //             groupValue: _value,
                //             onChanged: (int? value) {
                //               setState(() {
                //                 _value = value!;
                //                 shareInfo = "0";
                //               });
                //             }),
                //         Text(
                //           "NO",
                //           // style: TextStyle(color:  colors.primary),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 12, bottom: 12),
                //   child: Container(
                //     padding: EdgeInsets.all(8),
                //     height: 50,
                //     decoration: BoxDecoration(
                //         color: Theme.of(context).colorScheme.white,
                //         borderRadius: BorderRadius.circular(12),
                //         border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                //     ),
                //     width: MediaQuery.of(context).size.width,
                //     child: DropdownButtonHideUnderline(
                //       child: DropdownButton(
                //         // Initial Value
                //         value: categoryValue,
                //         // underline: Container(),
                //         isExpanded: true,
                //         // Down Arrow Icon
                //         icon: Icon(Icons.keyboard_arrow_down, color: colors.primary,),
                //         hint: Text("Select Species", style: TextStyle(
                //             color: colors.blackTemp
                //         ),),
                //         // Array list of items
                //         items: animalList.map((items) {
                //           return DropdownMenuItem(
                //             value: items.id,
                //             child: Container(
                //                 child: Text(items.name.toString())),
                //           );
                //         }).toList(),
                //         // After selecting the desired option,it will
                //         // change button value to selected value
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             categoryValue = newValue!;
                //             print("selected category ${categoryValue}");
                //           });
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 12, bottom: 12),
                //   child: Container(
                //     padding: EdgeInsets.all(8),
                //     height: 50,
                //     decoration: BoxDecoration(
                //         color: Theme.of(context).colorScheme.white,
                //         borderRadius: BorderRadius.circular(12),
                //         border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                //     ),
                //     width: MediaQuery.of(context).size.width,
                //     child: TextFormField(
                //       controller: breedController,
                //       decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: "Breed"
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 12, bottom: 12),
                //   child: Container(
                //     padding: EdgeInsets.all(8),
                //     height: 50,
                //     decoration: BoxDecoration(
                //         color: Theme.of(context).colorScheme.white,
                //         borderRadius: BorderRadius.circular(12),
                //         border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                //     ),
                //     width: MediaQuery.of(context).size.width,
                //     child: TextFormField(
                //       controller: symptomsController,
                //       decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: "Symptoms/Disease"
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 12, bottom: 12),
                //   child: Container(
                //     padding: EdgeInsets.all(8),
                //     height: 50,
                //     decoration: BoxDecoration(
                //         color: Theme.of(context).colorScheme.white,
                //         borderRadius: BorderRadius.circular(12),
                //         border: Border.all(color: Theme.of(context).colorScheme.fontColor)
                //     ),
                //     width: MediaQuery.of(context).size.width,
                //     child: TextFormField(
                //       controller: descriptionController,
                //       decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: "Symptoms/Disease Description"
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 30),
                  child: ElevatedButton(onPressed: (){
                    if(nameController.text.isNotEmpty || mobileController.text.isNotEmpty) {
                      submitLead();
                    }else{
                      setSnackbar("Please fill above details", context);
                    }
                  },
                      style: ElevatedButton.styleFrom(
                          primary: colors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fixedSize: Size(MediaQuery.of(context).size.width - 40, 50)
                      ),
                      child: Text("Submit")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
