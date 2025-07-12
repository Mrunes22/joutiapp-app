
import 'package:flutter/material.dart';
import '../config/constants.dart';

class KycStepper extends StatelessWidget {
  final int currentStep;
  final void Function(int) onStepTapped;

  const KycStepper({
    Key? key,
    required this.currentStep,
    required this.onStepTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) => Stepper(
    currentStep: currentStep,
    onStepTapped: onStepTapped,
    controlsBuilder: (_, details) => const SizedBox.shrink(),
    steps: [
      Step(
        title: const Text('Téléverser ID'),
        content: const Text('Téléchargez une photo de votre pièce d’identité.'),
        isActive: currentStep >= 0,
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: const Text('Vérification'),
        content: const Text('Vos documents sont en cours de vérification.'),
        isActive: currentStep >= 1,
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: const Text('Terminé'),
        content: const Text('Votre identité est validée.'),
        isActive: currentStep >= 2,
        state: currentStep == 2 ? StepState.complete : StepState.indexed,
      ),
    ],
  );
}
