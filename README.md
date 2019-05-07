# SahandDatePickerFlutter
A jalali date picker for flutter


## Usage
````dart
SahandDatePicker.pickDate(context , year: 1380,month: 1,fontSize: 12,extraHeight: 0).then((picked) {
              setState(() {
                pickedDate = picked;
              });
            });
````