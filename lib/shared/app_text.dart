import 'package:flutter/material.dart';

import 'app_theme.dart';

extension TextExt on Text {
  //To use this, call Text('...').ext

  Text get label => Text(this.data!, style: AppTheme.textStyles.label);
  Text get title => Text(this.data!, style: AppTheme.textStyles.title);
  Text get subtitle => Text(this.data!, style: AppTheme.textStyles.subtitle);
}
