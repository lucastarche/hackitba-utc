import 'package:hackitba_utc/redux/store_content.dart';

import 'actions.dart';

StoreContent mainReducer(StoreContent state, dynamic action) {
  if (action is Action) {
    return action.executeAction(state);
  } else return state;
}
