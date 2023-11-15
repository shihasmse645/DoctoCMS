import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ObservationSuggestions extends SearchDelegate {
  List<String> Observations = ["Pain in Teeth","Cataract removal surgery","Prostate Surgery","Estimation of heamoglobin-Oxygen saturation","Pain Score","Gum issues","Test observations"];
  final Function(String) onResultSelected;
  ObservationSuggestions( this.onResultSelected);

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
    for (var item in Observations) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          var result = matchQuery[index];
          return Padding(
            padding: const EdgeInsets.only(top: 3,left: 4,right: 5,bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: ListTile(
                title: Text(result),
                onTap: () {
                onResultSelected(result); // Call the callback function
                close(context, result);
              },
              ),
            ),
          );
        }
      )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<String> matchQuery = [];
    for (var item in Observations) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          var result = matchQuery[index];
          return Padding(
            padding: const EdgeInsets.only(top: 3,left: 4,right: 5,bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: ListTile(
                title: Text(result),
                onTap: () {
                onResultSelected(result); // Call the callback function
                close(context, result);
              },
              ),
            ),
          );
        }
      )
    );
  }
}
