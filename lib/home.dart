import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomePage extends StatefulWidget {
 
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<String> todos=[];
   final controller=TextEditingController();
   String text="";
   
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 20, 10, 46),
          centerTitle: true,
          title:const Text("My To Do"),
          leading: IconButton(onPressed: (){},
           icon: const Icon(Icons.menu)),
           actions: [
            IconButton(onPressed: (){
              setState(() {
                SystemNavigator.pop();
              });
            },
             icon: const Icon(Icons.close))
           ],
        ),
        backgroundColor: const Color.fromARGB(255, 6, 4, 7),
        floatingActionButton: FloatingActionButton(onPressed: (){
          showDialog(context: context,
           builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text("To Do",textAlign: TextAlign.center ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),),
            actions: [
              TextField(
                decoration: const InputDecoration(
                  hintText: "Add New",
                ),
                controller: controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){
                  setState(() {
                    todos.add(controller.text);
                  });
                  
                  Navigator.of(context).pop();
                  controller.clear();
                },
                 child: const Text("ADD"),),
                ]
              ),
            ],
            
           ));
           
        }, 
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black,),
        ),
        
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
            
                decoration: const BoxDecoration(
                  border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.white))),
                child: ListTile(
                  title: Text(todos[index],style:const TextStyle(color: Colors.white),),
                 
                  trailing:SizedBox(
                    width: 80,
                    child:  Row(
                    children: [
                       Expanded(
                        child: IconButton(onPressed: (){
                    showDialog(context: context,
                     builder: (context) => AlertDialog(
                     
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                     
                      actions: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Edit Here"
                            
                          ),
                         onChanged: (value) {
                           setState(() {
                             text=value;
                           });
                         },
                         
                        ),
                      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                            onPressed: (){
                            setState(() {
                              todos[index]=text;
                            });
                            Navigator.pop(context);
                          },
                           child: const Text("EDIT")),
                          ]
                        ),
                         

                      ],
                     ),);
                   },
                   icon: const Icon(Icons.edit,color: Colors.grey,)),),
                   Expanded(
                    child:IconButton(onPressed: (){
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                       icon: const Icon(Icons.delete,color: Colors.red,)), ),  
                    ],
                  ),
                  )
                
                   
              ),
            )
            );
          },),
       
      ),
    );
  }
}