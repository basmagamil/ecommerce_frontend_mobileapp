import 'package:ecommerce/models/details_state.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/pages/details/details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionCard extends StatelessWidget {
  Function optionClicked;
  final String option;
  OptionCard({this.option, this.optionClicked});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 3.0),
        child: SizedBox(
          // width: 60,
          height: 50,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: (state.selectedOption == this.option)
                        ? Colors.grey[800]
                        : Colors.grey[400],
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(5)),
            color: Colors.white,
            onPressed: () {
              if (this.optionClicked != null) {
                return optionClicked(this.option);
              }
            },
            child: new Text(
              this.option,
              style: TextStyle(
                  color: (state.selectedOption == this.option)
                      ? Colors.grey[800]
                      : Colors.grey[400]),
            ),
          ),
        ),
      );
    });
  }
}
