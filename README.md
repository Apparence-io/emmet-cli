Emmet is a command-line application to generate a recap documentation from flutter/dart test projects. 
## Emmet CLI
![test image size](/doc/assets/logo_small.png)

Developed with 💙 by Apparence.io

Generate reports from all test files in a dart/flutter projects

[![pub package][pub_badge]][pub_link]

### Index 
All your tests files with numbers of tests
![generated index](https://i.postimg.cc/zfNR7rbz/Capture-d-e-cran-2021-03-12-a-08-50-37.png) 

### Test file 
Widgets test and Dart test descriptions 
![generated scenario](https://i.postimg.cc/4dNHCQQj/Capture-d-e-cran-2021-03-12-a-08-51-09.png)

## Installing 
```
dart pub global activate emmetcli
```

#### Extract tests as html
```
dart pub global run emmetcli -w
```

#### Show help 
Creates only html version
```
dart pub global run emmetcli -h
```

## Run Emmet (uncompiled version)
Creates only html version
```
dart run bin/emmetcli.dart --help
```

## Compile Emmet 
```
dart compile exe bin/emmetcli.dart
```

