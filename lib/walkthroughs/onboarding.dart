import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/onboarding_texts/onboarding_texts_widget.dart';

// Focus widget keys for this walkthrough
final rowHm3zeowq = GlobalKey();
final rowE6h0my7a = GlobalKey();
final containerN74zw2up = GlobalKey();
final container5ho7jjlb = GlobalKey();

/// onboarding
///
/// first wt
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Meu perfil: Veja aqui mais detalhes do seu perfil.
      TargetFocus(
        keyTarget: rowHm3zeowq,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const OnboardingTextsWidget(
              title: 'kapa',
              description:
                  'Este é o seu perfil, aqui você poderá acessar seus dados pessoais, informações de saúde e também gerenciar seu plano ViV.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: rowE6h0my7a,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const OnboardingTextsWidget(
              title: 'Seu menu de ações',
              description:
                  'Aqui você poderá selecionar as ações que você poderá interagir no seu aplicativo, ver sua agenda, remédios, prescrições e até sua evolução de saúde e bem estar.',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerN74zw2up,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const OnboardingTextsWidget(
              title: 'Seu diário de bem estar',
              description:
                  'Responda diariamente o questionário de bem estar, isso nos ajuda a traçar seu perfil médico e também permite que você acompanhe sua evolução.',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: container5ho7jjlb,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const OnboardingTextsWidget(
              title: 'Precisa de ajuda?',
              description:
                  'A ViV, sua assistente virtual está disponível 24 horas por dia, 7 dias por semana para te ajudar e tirar todas as suas dúvidas sobre sua saúde e seus tratamentos.',
            ),
          ),
        ],
      ),
    ];
