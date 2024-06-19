part of 'single_selection_chip.dart';

class SingleSelectionModel<T> {
  final int id;
  final String title;
  final String? subTitle;
  final T object;
  Widget? leadingIcon;

  SingleSelectionModel({
    required this.title,
    required this.id,
    required this.object,
    this.subTitle,
    this.leadingIcon,
  });
}

// extension ColorMapper on SaveraColor {
//   SingleSelectionModel<SaveraColor> toSingleSelectionModel(Widget icon) {
//     return SingleSelectionModel<SaveraColor>(
//       id: id,
//       title: alias,
//       subTitle: "",
//       object: this,
//       leadingIcon: icon,
//     );
//   }
// }
