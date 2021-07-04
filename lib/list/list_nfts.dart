import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../TodoListModel.dart';
import 'nft_item.dart';

class ListNFTs extends StatelessWidget {

  List<Task> nftsList;

  ListNFTs(this.nftsList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:showLoaderOrList()
    );
  }

  Widget showLoaderOrList() {
    return buildListWithData(
        nftsList
    );
  }

  ListView buildListWithData(List<Task> terapuetas) {
    log("longitud: ${terapuetas.length}");
    return getTerapuetasList(terapuetas);
  }

  ListView getTerapuetasList(List<Task> terapeutas) {
    List<Widget> list = [];
    log("longitud: ${terapeutas.length}");
    for(Task terapeuta in terapeutas){
      list.add(
          NFTItem(
              terapeuta
          )
      );
    }
    log("widgets: ${list.length}");
    return ListView(
        children: list
    );
  }

}