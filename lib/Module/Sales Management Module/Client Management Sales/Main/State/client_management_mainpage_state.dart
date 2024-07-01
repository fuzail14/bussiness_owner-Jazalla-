class ClientManagementMainpageState {
  final int selectedIndex;

  ClientManagementMainpageState({this.selectedIndex = 0});

  ClientManagementMainpageState copyWith({int? selectedIndex}) {
    return ClientManagementMainpageState(
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
