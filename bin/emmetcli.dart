import 'dart:io';
import 'package:args/args.dart';
import 'package:emmetcli/emmetcli.dart' as emmetcli;
// import 'librar:emmet';

const exportHtml = 'html';
const exportMarkdown = 'markdown';
const help = 'help';
const path = 'path';

ArgResults argResults;

void main(List<String> arguments) async {
  exitCode = 0;
  final argParser = ArgParser()
    ..addOption(path, abbr: 'p', callback: (r) => r, help: 'path of a test folder')
    ..addFlag(help, negatable: false, abbr: 'h', help: 'show help')
    ..addFlag(exportHtml, negatable: false, abbr: 'w', help: 'export tests as html files')
    ..addFlag(exportMarkdown, negatable: false, abbr: 'm', help: 'export tests as markdown files');
  argResults = argParser.parse(arguments);
  stdout.writeln('-------------------------');
  stdout.writeln('## EMMET DOC             ');
  stdout.writeln('-------------------------');
  var pathOption;
  if(argResults.wasParsed(path)) {
    pathOption = argResults[path];
    stdout.writeln('pathOption: $pathOption');
  }
  if (argResults.wasParsed(help)) {
    stdout.writeln('Help for Emmet cli');
    stdout.writeln(argParser.usage);
    return;
  }
  if (argResults.wasParsed(exportHtml)) {
    stdout.writeln('...generate html doc');
    await emmetcli.generateHtmlTests(path: pathOption);
  }
  if (argResults.wasParsed(exportMarkdown)) {
    stdout.writeln('...generate markdown doc');
  }
}
