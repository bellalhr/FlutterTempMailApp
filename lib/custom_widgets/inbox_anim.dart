import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class InboxShimmer extends StatelessWidget {
  const InboxShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.white,
      enabled: true,
      child: Column(
        children: [
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (BuildContext context,int index){
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 10,),
                          Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          Container(
                            width: double.infinity,
                            height: 15.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),

                          ),
                        ],
                      ),
                    )
                  ],
                );
              })
        ],
      ),
    );
  }

}
