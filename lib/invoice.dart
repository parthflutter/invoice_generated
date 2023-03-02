
import 'package:flutter/material.dart';
import 'package:invoice_generated/modal%20class.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtAddProduct = TextEditingController();
  TextEditingController txtprice = TextEditingController();

  List<Data> Alldata = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text("Billing"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: txtname,
                decoration: InputDecoration(
                  label: Text("Add Name"),
                  border: OutlineInputBorder(
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: txtAddProduct,
                decoration: InputDecoration(
                  label: Text("Add Product"),
                  border: OutlineInputBorder(
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: txtprice,
                decoration: InputDecoration(
                  label: Text("Add Price"),
                  border: OutlineInputBorder(
                  ),
                ),
              ),
           SizedBox(height: 15),
           ElevatedButton(onPressed: (){
             setState(() {
               Data m1 = Data(name: txtname.text,price: txtprice.text,addproduct: txtAddProduct.text);
               Alldata.add(m1);
             });
           },
               child: Text("Add")),
              SizedBox(height: 15),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, "second",arguments: Alldata);

              },
                  child: Text("submit")),


              Expanded(child: ListView.builder(
                itemCount: Alldata.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${Alldata[index].name}"),
                    subtitle: Text("${Alldata[index].addproduct}"),
                    leading: Text("${Alldata[index].price}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                Alldata.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                        IconButton(onPressed: (){
                          showDialog(context: context, builder: (context) =>
                              AlertDialog(
                                content: (Column(
                                  children: [
                                      TextField(
                                        controller: txtname,
                                        decoration: InputDecoration(
                                          label: Text("Add Name"),
                                          border: OutlineInputBorder(
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      TextField(
                                        controller: txtAddProduct,
                                        decoration: InputDecoration(
                                          label: Text("Add Product"),
                                          border: OutlineInputBorder(
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      TextField(
                                        controller: txtprice,
                                        decoration: InputDecoration(
                                          label: Text("Add Price"),
                                          border: OutlineInputBorder(
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),

                                    ElevatedButton(onPressed: (){
                                      setState(() {
                                        String name= txtname.text;
                                        String product= txtAddProduct.text;
                                        String price= txtprice.text;
                                        Data m1 = Data(name:name,addproduct:product,price:price);
                                        Alldata [index]=m1;
                                        Navigator.pop(context);
                                      });
                                    }, child: Text("Edit"),
                                    ),
                                  ],
                                )

                                )
                              ),
                          );
                        }, icon: Icon(Icons.edit)),
                      ],
                    ),
                  );
                }
              ),
              ),
            ],
          ),
        ),
    ),
    );
  }
}

