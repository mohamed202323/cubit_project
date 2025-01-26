import 'package:bloc_project/business_logic/cubit/charactars_cubit.dart';
import 'package:bloc_project/business_logic/cubit/charactars_state.dart';
import 'package:bloc_project/data/models/character.dart';
import 'package:bloc_project/presentation/widgets/build_brogress_Indcator.dart';
import 'package:bloc_project/presentation/widgets/custom_app_bar.dart';
import 'package:bloc_project/presentation/widgets/view_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/colors.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CharactarsCubit>(context);
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.grey,
          body: BlocBuilder<CharactarsCubit, CharactarsState>(
            builder: (context, state) {
              if(state is CharactarsLoading) {
                return BuildBrogressIndcator();
              } else if (state is CharactarsLoaded) {
                return ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    CustomAppBar(isSearch: state.isSearch),
                    ViewCharacters(listData: state.characters)
                  ],
                );
              } else if (state is CharactarsError) {
                return Center(child: Text("Error: ${state.message}"));
              }
              return const Center(child: Text("No characters found"));
            },
          ),
        )
    );
  }
}
