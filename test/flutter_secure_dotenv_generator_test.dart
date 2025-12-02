import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:flutter_secure_dotenv_generator/src/helpers.dart';
import 'package:flutter_secure_dotenv_generator/src/environment_field.dart';
import 'package:flutter_secure_dotenv_generator/src/annotation_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  group('FlutterSecureDotEnvAnnotationGenerator', () {
    late FlutterSecureDotEnvAnnotationGenerator generator;
    late BuilderOptions options;

    setUp(() {
      options = BuilderOptions({
        'ENCRYPTION_KEY': 'test_encryption_key',
        'IV': 'test_initialization_vector',
        'OUTPUT_FILE': 'test_output_file',
      });
      generator = FlutterSecureDotEnvAnnotationGenerator(options);
    });

    test('throws if element is not a class', () {
      final element = null; // null simulates non-class element
      final annotation = ConstantReader(null);
      final buildStep = FakeBuildStep();

      expect(
        () => generator.generateForAnnotatedElement(
            element, annotation, buildStep),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('EnvironmentField', () {
    test('should create an instance', () {
      final field = EnvironmentField(
        'name',
        'nameOverride',
        FakeDartType(),
        null, // DartObject? can be null
      );

      expect(field.name, 'name');
      expect(field.nameOverride, 'nameOverride');
      expect(field.type, isA<DartType>());
      expect(field.defaultValue, isNull);
    });
  });

  group('Helpers', () {
    test('should get all accessor names', () {
      // Instead of fake interface element, pass a real interface with no accessors
      final interface = null; // minimal, since getAllAccessorNames checks for nulls internally
      final accessorNames = getAllAccessorNames(interface);

      expect(accessorNames, isEmpty);
    });
  });
}

class FakeBuildStep implements BuildStep {
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class FakeDartType implements DartType {
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
