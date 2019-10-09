import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:tabulation/store/actions/check_messages_actions.dart';
import 'package:tabulation/store/app/app_state.dart';
import 'package:tabulation/store/models/area_model.dart';

class CheckMessagesViewModel{
  final int countingCenterId;
  final int electoralDistrictId;
  final int pollingDivisionId;
  final int pollingStationId;
  final List<Area> areas;
  final TimeOfDay time;
  final String remarks;
  final String nameARO;

  final Function (int countingCenterId) updateCountingCenterId;
  final Function (int electoralDistricId) updateElectoralDistrictId;
  final Function (int pollingDivisionId) updatePollingDivisionId;
  final Function (int pollingStationId) updatePollingStationId;
  final Function (String remarks) updateRemarks;
  final Function (String nameARO) updateNameARO;
  final Function (TimeOfDay time) updateTime;

  final Function () navigateToStepTwo;
  final Function () navigateToStepThree;

  CheckMessagesViewModel(
   { this.countingCenterId,
    this.electoralDistrictId,
    this.pollingDivisionId,
    this.pollingStationId,
    this.updateCountingCenterId,
    this.updateElectoralDistrictId,
    this.updatePollingDivisionId,
    this.updatePollingStationId,
    this.areas,
    this.navigateToStepThree,
    this.navigateToStepTwo,
    this.time,
    this.remarks,
    this.nameARO,
    this.updateNameARO,
    this.updateRemarks,
    this.updateTime}
  );

  factory CheckMessagesViewModel.create(Store<AppState> store){
    return new CheckMessagesViewModel(
      countingCenterId:store.state.checkMessagesState.countingCenterId,
      electoralDistrictId:store.state.checkMessagesState.electoralDistrictId, 
      pollingDivisionId:store.state.checkMessagesState.pollingDivisionId, 
      pollingStationId:store.state.checkMessagesState.pollingStationId, 
      areas: store.state.officeState.areas,
      time:store.state.checkMessagesState.time,
      nameARO:store.state.checkMessagesState.nameARO,
      remarks: store.state.checkMessagesState.remarks,
      updateCountingCenterId:(int id){
        store.dispatch(new UpdateCountingCenterId(id));
      }, 
      updateElectoralDistrictId:(id){
        store.dispatch(new UpdateElectoralDistrictId(id));
      }, 
      updatePollingDivisionId:(id){
        store.dispatch(new UpdatePollingDivisionId(id));
      }, 
      updatePollingStationId:(id){
        store.dispatch(new UpdatePollingStationId(id));
      },
      navigateToStepTwo:(){
        store.dispatch(new NavigateToCheckMessagesPageTwo());
      },
      navigateToStepThree:(){
        store.dispatch(new NavigateToCheckMessagesPageThree());
      },
      updateNameARO: (String name){
        store.dispatch(UpdateNameARO(name));
      },
      updateTime:(TimeOfDay time){
        store.dispatch(UpdateTime(time));
      },
      updateRemarks:(String remarks){
        store.dispatch(UpdateRemarks(remarks));
      }

    );
  }
}