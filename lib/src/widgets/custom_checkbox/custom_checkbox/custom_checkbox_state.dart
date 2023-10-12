// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomCheckboxState {
  bool isSelected;
  bool isDisabled;

  CustomCheckboxState({
    this.isSelected = false,
    this.isDisabled = false,
  });

  CustomCheckboxState copyWith({
    bool? isSelected,
    bool? isDisabled,
  }) {
    return CustomCheckboxState(
      isSelected: isSelected ?? this.isSelected,
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }
}
