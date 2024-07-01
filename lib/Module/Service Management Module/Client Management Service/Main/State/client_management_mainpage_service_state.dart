class ClientManagementServiceMainpageState {
  final int selectedIndex;

  ClientManagementServiceMainpageState({this.selectedIndex = 0});

  ClientManagementServiceMainpageState copyWith({int? selectedIndex}) {
    return ClientManagementServiceMainpageState(
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
