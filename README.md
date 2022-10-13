Simple configurable circular progress bar built out of the lines.

<p>
  <img src="https://github.com/G33kFreak/circular_progress_bar_with_lines/blob/main/doc/example.gif?raw=true"
    alt="An animated image of the iOS in-app purchase UI" height="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
</p>

## Configuration

| Param                 | Description                                                          | Type                           | Default value  |
|-----------------------|----------------------------------------------------------------------|--------------------------------|----------------|
| `linesLength`         | Defines how long will lines in loader be                             | double                         | 50             |
| `radius`              | Defines radius between center of circle and start point of each line | double                         | 100            |
| `percent`             | Defines progress, min value is 0, max value is 100                   | double                         | required field |
| `linesAmount`         | Defines how many lines progress bar contains                         | int                            | 60             |
| `linesWidth`          | Defines width for each line                                          | double                         | 2              |
| `linesColor`          | Defines lines' color                                                 | Color                          | Colors.black   |
| `centerWidgetBuilder` | Builder for widget that will be placed in center of progress bar     | Widget Function(BuildContext)? | optional field |
|                       |                                                                      |                                |                |

## Getting started

## Installing

```yaml
dependencies:
  circular_progress_bar_with_lines: ^0.0.5
```

### Import

```dart
import 'package:circular_progress_bar_with_lines/circular_progress_bar_with_lines.dart';
```

## Example

```dart
class _HomePageState extends State<HomePage> {
  double _percent = 0;

  void _updateValue(double newValue) {
    setState(() {
      _percent = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: CircularProgressBarWithLines(
                percent: _percent,
                centerWidgetBuilder: (context) => Text(
                  '${_percent.round()}',
                ),
              ),
            ),
            Slider(
              value: _percent.toDouble(),
              min: 0,
              max: 100,
              onChanged: _updateValue,
            )
          ],
        ),
      ),
    );
  }
}

```
