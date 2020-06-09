import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/details_state.dart';
import 'package:ecommerce/models/product.dart';

enum DetailsEventType { selectOption, incrementQuantity, decrementQuantity }

class DetailsEvent {
  DetailsEventType type;
  String option;
  DetailsEvent({this.type, this.option});
}

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  @override
  DetailsState get initialState => DetailsState(quantity: 0);

  @override
  Stream<DetailsState> mapEventToState(DetailsEvent event) async* {
    switch (event.type) {
      case DetailsEventType.selectOption:
        yield DetailsState(
            selectedOption: event.option, quantity: state.quantity);
        break;
      case DetailsEventType.incrementQuantity:
        yield DetailsState(quantity: state.quantity + 1);
        break;
      case DetailsEventType.decrementQuantity:
        if (state.quantity == 0) {
          yield DetailsState(quantity: state.quantity);
        } else {
          yield DetailsState(quantity: state.quantity - 1);
        }
        break;
    }
    yield DetailsState(
        quantity: state.quantity, selectedOption: state.selectedOption);
  }
}
