part of 'device_register_bloc.dart';

@freezed
abstract class DeviceRegisterEvent with _$DeviceRegisterEvent {
  const factory DeviceRegisterEvent.deviceRegister(DeviceRegisterModel deviceRegisterModel) = _DeviceRegister;
}