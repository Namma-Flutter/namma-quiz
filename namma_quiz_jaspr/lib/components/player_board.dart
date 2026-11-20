import 'dart:async';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import '../providers/game_provider.dart';

class PlayerBoard extends StatefulComponent {
  final String? initialPin;
  const PlayerBoard({this.initialPin, super.key});

  @override
  State<PlayerBoard> createState() => _PlayerBoardState();
}

class _PlayerBoardState extends State<PlayerBoard> {
  late String pin;
  String username = '';
  bool isJoining = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    pin = component.initialPin ?? '';
    // Restore session across browser refreshes
    scheduleMicrotask(() {
      context.read(gameProvider.notifier).tryRestoreSession();
    });
  }

  Future<void> _handleJoin() async {
    final cleanPin = pin.trim();
    final cleanUsername = username.trim();

    if (isJoining) return;

    if (cleanPin.isEmpty && cleanUsername.isEmpty) {
      setState(() => errorMessage = 'Please enter both Game PIN and Nickname.');
      return;
    }
    if (cleanPin.isEmpty) {
      setState(() => errorMessage = 'Please enter the 6-digit Game PIN.');
      return;
    }
    if (cleanUsername.isEmpty) {
      setState(() => errorMessage = 'Please enter your Nickname.');
      return;
    }

    setState(() {
      isJoining = true;
      errorMessage = null;
    });

    final error = await context.read(gameProvider.notifier).joinGame(cleanPin, cleanUsername);
    if (error != null) {
      setState(() {
        isJoining = false;
        errorMessage = error;
      });
    }
  }

  @override
  Component build(BuildContext context) {
    final gameState = context.watch(gameProvider);

    if (!gameState.isConnected) {
      return _buildJoinForm(context);
    }

    final lastEvent = gameState.lastEvent;

    // Game finished - show podium and player rank
    if (lastEvent?.eventType == 'GAME_FINISHED' || gameState.session?.status == 'finished') {
      return _buildFinishScreen(context, gameState);
    }

    // Question ended - show result
    if (gameState.correctOptionIndex != null) {
      return _buildResultScreen(context, gameState);
    }

    // Answer submitted - waiting
    if (gameState.submittedAnswerIndex != null) {
      return _buildWaitingScreen(context, gameState);
    }

    // Active question
    if (gameState.session?.status == 'active') {
      return _buildQuestionScreen(context, gameState);
    }

    // Lobby - waiting for game to start
    return _buildLobbyScreen(context, gameState);
  }

  Component _buildJoinForm(BuildContext context) {
    return div(classes: 'scr on', [
      // Compact top navigation back to home
      div(classes: 'topbar', [
        button(
          classes: 'btn btn-icon btn-white btn-sm',
          events: {'click': (e) => Router.of(context).push('/')},
          [i([], classes: 'ti ti-arrow-left', attributes: {'style': 'font-size: 16px;'}),],
        ),
        div(attributes: {'style': 'flex: 1; margin-left: 8px;'}, [
          span(classes: 'topbar-title', [Component.text('Join Game Session')]),
        ]),
      ]),

      div(classes: 'bg-pattern', attributes: {'style': 'padding: 48px 20px 60px; text-align: center;'}, [
        div(classes: 'brand-spark pop-in', attributes: {
          'style': 'width: 64px; height: 64px; margin: 0 auto 16px; border-radius: 18px; box-shadow: 0 8px 24px rgba(0,0,0,0.3); font-size: 32px;',
        }, [
          i([], classes: 'ti ti-bolt', attributes: {'style': 'font-size: 36px;'}),
        ]),
        h1(attributes: {
          'style': 'font-size: clamp(28px, 4vw, 38px); font-weight: 900; color: #FFFFFF; letter-spacing: -0.02em; margin-bottom: 6px;',
        }, [
          Component.text('Enter Game Arena'),
        ]),
        p(attributes: {'style': 'color: rgba(255, 255, 255, 0.85); font-size: 15px; font-weight: 500;'}, [
          Component.text('Grab your PIN and choose a nickname to play.'),
        ]),
      ]),

      div(classes: 'content-focus', attributes: {'style': 'margin-top: -28px; position: relative; padding: 0 16px 40px;'}, [
        div(classes: 'card', attributes: {
          'style': 'padding: 28px 24px; border-radius: 20px; box-shadow: 0 12px 36px rgba(18, 22, 54, 0.12);',
        }, [
          if (errorMessage != null)
            div(classes: 'banner banner-err mb16', [
              i([], classes: 'ti ti-alert-circle', attributes: {'style': 'font-size: 20px; color: #D85A30;'}),
              div(attributes: {'style': 'font-size: 13px; color: #D85A30; font-weight: 600;'}, [
                Component.text(errorMessage!),
              ]),
            ]),
          form(
            events: {
              'submit': (e) {
                e.preventDefault();
                _handleJoin();
              }
            },
            [
              div(classes: 'fgroup', [
                label(classes: 'flabel', [Component.text('Game PIN')]),
                input(
                  classes: 'finput',
                  type: InputType.text,
                  value: pin,
                  attributes: {
                    'placeholder': '000 000',
                    'style':
                        'text-align: center; font-size: 24px; font-weight: 800; letter-spacing: 8px; font-family: var(--font-mono); height: 56px;',
                    'maxlength': '6',
                    'autofocus': pin.isEmpty ? 'true' : 'false',
                  },
                  onInput: (String val) => setState(() => pin = val),
                ),
              ]),
              div(classes: 'fgroup mt16', [
                label(classes: 'flabel', [Component.text('Your Nickname')]),
                input(
                  classes: 'finput',
                  type: InputType.text,
                  value: username,
                  attributes: {
                    'placeholder': 'e.g. CaptainQuiz',
                    'style': 'text-align: center; font-size: 18px; font-weight: 700; height: 56px;',
                    'maxlength': '15',
                    'autofocus': pin.isNotEmpty ? 'true' : 'false',
                  },
                  onInput: (String val) => setState(() => username = val),
                ),
              ]),
              button(
                type: ButtonType.submit,
                classes: 'btn btn-dark btn-full btn-lg mt20 ${isJoining ? "disabled" : ""}',
                attributes: {'style': 'font-size: 17px; cursor: pointer;'},
                onClick: isJoining ? null : _handleJoin,
                [
                  i([], classes: isJoining ? 'ti ti-loader' : 'ti ti-login', attributes: {'style': 'font-size: 19px;'}),
                  Component.text(isJoining ? ' Connecting to Arena...' : ' Join Game Now'),
                ],
              ),
            ],
          ),
          div(attributes: {
            'style': 'text-align: center; margin-top: 18px; font-size: 12px; color: var(--color-text-subtle); display: flex; align-items: center; justify-content: center; gap: 6px;',
          }, [
            i([], classes: 'ti ti-device-mobile', attributes: {'style': 'font-size: 15px;'}),
            Component.text('Works seamlessly on mobile & desktop'),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildLobbyScreen(BuildContext context, GameState gameState) {
    return div(classes: 'scr on fullscreen-center bg-pattern', [
      div(classes: 'feedback-card feedback-card-glass', [
        div(classes: 'result-badge pop-in', [
          i([], classes: 'ti ti-sparkles', attributes: {'style': 'font-size: 44px; color: var(--brand-purple);'}),
        ]),
        h2(attributes: {
          'style': 'font-size: clamp(28px, 4vw, 36px); font-weight: 900; color: #FFFFFF; margin-bottom: 12px; text-shadow: 0 3px 12px rgba(0,0,0,0.3);',
        }, [
          Component.text("You're in the Arena!"),
        ]),
        div(attributes: {
          'style': 'font-size: 22px; font-weight: 800; color: #FFFFFF; background: rgba(0,0,0,0.3); padding: 10px 24px; border-radius: 999px; display: inline-flex; align-items: center; gap: 8px; margin-bottom: 16px; border: 1px solid rgba(255,255,255,0.15);',
        }, [
          i([], classes: 'ti ti-user', attributes: {'style': 'font-size: 18px; color: #FFA602;'}),
          Component.text(gameState.currentPlayer?.name ?? username),
        ]),
        p(attributes: {
          'style': 'font-size: 15px; color: rgba(255,255,255,0.9); font-weight: 600; margin-bottom: 32px;',
        }, [
          Component.text('See your avatar on the presenter screen. Waiting for host to start...'),
        ]),
        button(
          type: ButtonType.button,
          classes: 'btn btn-white btn-sm',
          events: {
            'click': (e) {
              context.read(gameProvider.notifier).leaveGame();
              Router.of(context).push('/');
            }
          },
          [
            i([], classes: 'ti ti-logout', attributes: {'style': 'font-size: 15px;'}),
            Component.text('Leave Game'),
          ],
        ),
      ]),
    ]);
  }

  Component _buildQuestionScreen(BuildContext context, GameState gameState) {
    final currentQuestionIndex = gameState.session?.currentQuestionIndex ?? 0;
    if (currentQuestionIndex >= gameState.questions.length) {
      return div(classes: 'scr on bg-pattern flex-center', attributes: {'style': 'color: #FFFFFF; font-size: 24px; font-weight: 800;'}, [
        Component.text('Get Ready!'),
      ]);
    }
    final question = gameState.questions[currentQuestionIndex];
    final isAnswerSubmitted = gameState.submittedAnswerIndex != null;

    return div(classes: 'scr on bg-pattern flex-col', attributes: {'style': 'min-height: 100vh;'}, [
      // 1. Top Question Index Badge & Player Status
      div(attributes: {'style': 'padding: 16px 20px 8px; display: flex; align-items: center; justify-content: space-between; max-width: 900px; margin: 0 auto; width: 100%; box-sizing: border-box;'}, [
        div(classes: 'chip chip-glass', [
          Component.text('Question ${currentQuestionIndex + 1} of ${gameState.questions.length}'),
        ]),
        div(attributes: {'style': 'color: rgba(255, 255, 255, 0.9); font-size: 14px; font-weight: 700;'}, [
          Component.text('${gameState.currentPlayer?.score ?? 0} pts'),
        ]),
      ]),

      // 2. Question Text Card
      div(classes: 'content-wrap', attributes: {'style': 'padding: 0 16px 16px;'}, [
        div(classes: 'card', attributes: {
          'style': 'padding: 22px 20px; text-align: center; background: #FFFFFF; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.22); border: none;',
        }, [
          div(attributes: {
            'style': 'font-size: clamp(18px, 3.2vw, 24px); font-weight: 800; color: #11142D; line-height: 1.35; word-break: break-word;',
          }, [
            Component.text(question.text),
          ]),
        ]),
      ]),

      // 3. Option Buttons Grid (Using canonical .tiles-grid and .tile classes)
      div(classes: 'content-wrap', attributes: {'style': 'flex: 1; padding: 0 16px 24px; display: flex; flex-direction: column; justify-content: center;'}, [
        div(classes: 'tiles-grid', [
          if (question.options.isNotEmpty)
            button(
              type: ButtonType.button,
              classes: 'tile ta ${isAnswerSubmitted ? "disabled" : ""}',
              onClick: isAnswerSubmitted ? null : () => context.read(gameProvider.notifier).submitAnswer(0),
              [
                div(classes: 'tile-icon', [i([], classes: 'ti ti-triangle-filled', [])]),
                div(classes: 'tile-text', [Component.text(question.options[0])]),
              ],
            ),
          if (question.options.length > 1)
            button(
              type: ButtonType.button,
              classes: 'tile tb ${isAnswerSubmitted ? "disabled" : ""}',
              onClick: isAnswerSubmitted ? null : () => context.read(gameProvider.notifier).submitAnswer(1),
              [
                div(classes: 'tile-icon', [i([], classes: 'ti ti-diamond-filled', [])]),
                div(classes: 'tile-text', [Component.text(question.options[1])]),
              ],
            ),
          if (question.options.length > 2)
            button(
              type: ButtonType.button,
              classes: 'tile tc ${isAnswerSubmitted ? "disabled" : ""}',
              onClick: isAnswerSubmitted ? null : () => context.read(gameProvider.notifier).submitAnswer(2),
              [
                div(classes: 'tile-icon', [i([], classes: 'ti ti-circle-filled', [])]),
                div(classes: 'tile-text', [Component.text(question.options[2])]),
              ],
            ),
          if (question.options.length > 3)
            button(
              type: ButtonType.button,
              classes: 'tile td ${isAnswerSubmitted ? "disabled" : ""}',
              onClick: isAnswerSubmitted ? null : () => context.read(gameProvider.notifier).submitAnswer(3),
              [
                div(classes: 'tile-icon', [i([], classes: 'ti ti-square-filled', [])]),
                div(classes: 'tile-text', [Component.text(question.options[3])]),
              ],
            ),
        ]),
      ]),
    ]);
  }

  static const _optionColors = [
    '#E21B3C', // Red
    '#1368CE', // Blue
    '#D89E00', // Yellow
    '#26890C', // Green
  ];

  static const _optionIcons = [
    'ti ti-triangle-filled',
    'ti ti-diamond-filled',
    'ti ti-circle-filled',
    'ti ti-square-filled',
  ];

  static const _optionNames = [
    'Red Triangle',
    'Blue Diamond',
    'Yellow Circle',
    'Green Square',
  ];

  Component _buildWaitingScreen(BuildContext context, GameState gameState) {
    final currentQuestionIndex = gameState.session?.currentQuestionIndex ?? 0;
    final question = (currentQuestionIndex < gameState.questions.length)
        ? gameState.questions[currentQuestionIndex]
        : null;

    final subIdx = gameState.submittedAnswerIndex;
    final hasValidChoice = subIdx != null && subIdx >= 0 && subIdx < 4;
    final choiceColor = hasValidChoice ? _optionColors[subIdx] : '#46178F';
    final choiceIcon = hasValidChoice ? _optionIcons[subIdx] : 'ti ti-check';
    final choiceText = (hasValidChoice && question != null && subIdx < question.options.length)
        ? question.options[subIdx]
        : (hasValidChoice ? _optionNames[subIdx] : 'Answer Submitted');

    return div(classes: 'scr on fullscreen-center bg-pattern', [
      div(classes: 'feedback-card feedback-card-glass', [
        // 1. Radar Pulse Badge
        div(classes: 'result-badge pulse-radar pop-in', [
          i([], classes: 'ti ti-send', attributes: {
            'style': 'font-size: 42px; color: var(--brand-purple);',
          }),
        ]),

        // 2. Bold Headline
        h2(attributes: {
          'style': 'font-size: clamp(26px, 4vw, 36px); font-weight: 900; color: #FFFFFF; letter-spacing: -0.02em; text-shadow: 0 3px 12px rgba(0,0,0,0.3); margin-bottom: 8px;',
        }, [
          Component.text('Answer Locked In!'),
        ]),

        // 3. Subtitle
        p(attributes: {
          'style': 'font-size: 15px; font-weight: 600; color: rgba(255,255,255,0.9); margin-bottom: 24px; line-height: 1.4;',
        }, [
          Component.text('Speed matters! Waiting for timer or other players to finish...'),
        ]),

        // 4. Selected Option Preview Card
        if (hasValidChoice)
          div(attributes: {
            'style': 'background: $choiceColor; width: 100%; border-radius: 14px; padding: 16px 20px; display: flex; align-items: center; gap: 14px; box-shadow: 0 8px 24px rgba(0,0,0,0.25); margin-bottom: 24px; box-sizing: border-box;',
          }, [
            i([], classes: choiceIcon, attributes: {
              'style': 'font-size: 30px; color: #FFFFFF; flex-shrink: 0;',
            }),
            div(attributes: {'style': 'text-align: left; flex: 1; overflow: hidden;'}, [
              div(attributes: {
                'style': 'font-size: 11px; text-transform: uppercase; letter-spacing: 0.08em; font-weight: 800; color: rgba(255,255,255,0.85); margin-bottom: 2px;',
              }, [
                Component.text('Your Pick'),
              ]),
              div(attributes: {
                'style': 'font-size: 17px; font-weight: 800; color: #FFFFFF; word-break: break-word; line-height: 1.25;',
              }, [
                Component.text(choiceText),
              ]),
            ]),
          ]),

        // 5. Pulsing Status Indicator
        div(attributes: {
          'style': 'display: inline-flex; align-items: center; gap: 10px; background: rgba(0,0,0,0.3); padding: 10px 22px; border-radius: 999px; margin-bottom: 24px; border: 1px solid rgba(255,255,255,0.18);',
        }, [
          i([], classes: 'ti ti-loader spin-slow', attributes: {
            'style': 'font-size: 18px; color: #FFFFFF;',
          }),
          span(attributes: {'style': 'font-size: 14px; font-weight: 700; color: #FFFFFF;'}, [
            Component.text('Results reveal when question closes'),
          ]),
        ]),

        // 6. Player Info Footer
        div(attributes: {
          'style': 'background: rgba(0,0,0,0.25); padding: 12px 20px; border-radius: 14px; width: 100%; display: flex; align-items: center; justify-content: space-between; box-sizing: border-box; border: 1px solid rgba(255,255,255,0.12);',
        }, [
          div(attributes: {'style': 'display: flex; align-items: center; gap: 10px; font-size: 15px; font-weight: 700; color: #FFFFFF;'}, [
            div(attributes: {
              'style': 'background: rgba(255,255,255,0.2); color: #FFFFFF; padding: 3px 10px; border-radius: 999px; font-size: 12px; font-weight: 800;',
            }, [
              Component.text('Player'),
            ]),
            Component.text(gameState.currentPlayer?.name ?? username),
          ]),
          div(attributes: {'style': 'font-size: 16px; font-weight: 800; color: #FFA602;'}, [
            Component.text('${gameState.currentPlayer?.score ?? 0} pts'),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildResultScreen(BuildContext context, GameState gameState) {
    final isCorrect = gameState.submittedAnswerIndex == gameState.correctOptionIndex;
    final points = gameState.earnedPoints ?? 0;
    final correctIdx = gameState.correctOptionIndex;
    final currentQuestionIndex = gameState.session?.currentQuestionIndex ?? 0;
    final question = (currentQuestionIndex < gameState.questions.length)
        ? gameState.questions[currentQuestionIndex]
        : null;

    final myId = gameState.currentPlayer?.id;
    final myName = gameState.currentPlayer?.name ?? username;
    final lb = gameState.leaderboard.isNotEmpty
        ? gameState.leaderboard
        : gameState.allPlayers;
    int? myRank;
    for (var i = 0; i < lb.length; i++) {
      final p = lb[i];
      if ((myId != null && p['id'] == myId) || p['name'] == myName) {
        myRank = i + 1;
        break;
      }
    }

    final bgGradient = isCorrect
        ? 'linear-gradient(145deg, #1fa833 0%, #26890C 50%, #157307 100%)'
        : 'linear-gradient(145deg, #f02d4f 0%, #E21B3C 50%, #990f26 100%)';

    final hasCorrectOption = question != null &&
        correctIdx != null &&
        correctIdx >= 0 &&
        correctIdx < question.options.length;
    final correctOptionText = hasCorrectOption ? question.options[correctIdx] : '';
    final correctIcon = (correctIdx != null && correctIdx >= 0 && correctIdx < 4)
        ? _optionIcons[correctIdx]
        : 'ti ti-check';

    return div(
      classes: 'scr on fullscreen-center',
      attributes: {
        'style': 'background: $bgGradient; min-height: 100vh;',
      },
      [
        div(classes: 'feedback-card feedback-card-dark', [
          // 1. Result Icon Badge
          div(classes: 'result-badge pop-in', attributes: {
            'style': 'background: #FFFFFF; margin: 0 auto 20px; box-shadow: 0 12px 32px rgba(0,0,0,0.3);',
          }, [
            i([], classes: isCorrect ? 'ti ti-check' : 'ti ti-x', attributes: {
              'style': 'font-size: 54px; font-weight: 900; color: ${isCorrect ? "var(--kahoot-green)" : "var(--kahoot-red)"};',
            }),
          ]),

          // 2. Result Title
          h2(attributes: {
            'style': 'font-size: clamp(32px, 5vw, 44px); font-weight: 900; color: #FFFFFF; letter-spacing: -0.02em; text-shadow: 0 4px 14px rgba(0,0,0,0.35); margin-bottom: 12px;',
          }, [
            Component.text(isCorrect ? 'Correct!' : 'Incorrect'),
          ]),

          // 3. Points Badge
          if (isCorrect)
            div(attributes: {
              'style': 'background: #FFFFFF; color: #1e700a; font-size: 24px; font-weight: 900; padding: 10px 32px; border-radius: 999px; display: inline-flex; align-items: center; gap: 8px; box-shadow: 0 8px 24px rgba(0,0,0,0.25); margin-bottom: 18px;',
            }, [
              i([], classes: 'ti ti-flame', attributes: {'style': 'font-size: 26px; color: #D85A30;'}),
              Component.text('+$points pts'),
            ])
          else
            div(attributes: {
              'style': 'background: rgba(0,0,0,0.35); color: #FFFFFF; font-size: 20px; font-weight: 800; padding: 8px 28px; border-radius: 999px; display: inline-flex; align-items: center; gap: 8px; margin-bottom: 18px; border: 1px solid rgba(255,255,255,0.18);',
            }, [
              Component.text('+0 pts'),
            ]),

          // 4. Motivating Subtext
          p(attributes: {
            'style': 'font-size: 15px; font-weight: 700; color: rgba(255,255,255,0.92); margin-bottom: 20px; text-shadow: 0 1px 4px rgba(0,0,0,0.2);',
          }, [
            Component.text(isCorrect
                ? 'Streak building! Fast answers earn bonus points! 🔥'
                : 'Shake it off! Gear up for the next question! 💪'),
          ]),

          // 5. If Incorrect, reveal correct answer
          if (!isCorrect && hasCorrectOption)
            div(attributes: {
              'style': 'background: rgba(0,0,0,0.35); border-radius: 14px; padding: 14px 18px; width: 100%; box-sizing: border-box; margin-bottom: 20px; text-align: left; display: flex; align-items: center; gap: 12px; border: 1px solid rgba(255,255,255,0.18);',
            }, [
              i([], classes: correctIcon, attributes: {'style': 'font-size: 24px; color: #FFFFFF; flex-shrink: 0;'}),
              div(attributes: {'style': 'flex: 1; overflow: hidden;'}, [
                div(attributes: {
                  'style': 'font-size: 11px; text-transform: uppercase; font-weight: 800; color: rgba(255,255,255,0.8); margin-bottom: 2px;',
                }, [
                  Component.text('Correct Answer:'),
                ]),
                div(attributes: {
                  'style': 'font-size: 16px; font-weight: 800; color: #FFFFFF; word-break: break-word; line-height: 1.25;',
                }, [
                  Component.text(correctOptionText),
                ]),
              ]),
            ]),

          // 6. Player Name & Score Status Bar
          div(attributes: {
            'style': 'background: rgba(0,0,0,0.35); padding: 14px 20px; border-radius: 14px; width: 100%; display: flex; align-items: center; justify-content: space-between; box-sizing: border-box; border: 1px solid rgba(255,255,255,0.18);',
          }, [
            div(attributes: {'style': 'display: flex; align-items: center; gap: 10px; font-size: 15px; font-weight: 700; color: #FFFFFF;'}, [
              div(attributes: {
                'style': 'background: ${myRank == 1 ? "#FFA602" : myRank == 2 ? "#A0A0A0" : myRank == 3 ? "#CD7F32" : "rgba(255,255,255,0.22)"}; color: #FFFFFF; padding: 3px 10px; border-radius: 999px; font-size: 12px; font-weight: 800; display: inline-flex; align-items: center; gap: 4px; box-shadow: 0 2px 6px rgba(0,0,0,0.25); flex-shrink: 0;',
              }, [
                if (myRank == 1) i([], classes: 'ti ti-crown', attributes: {'style': 'font-size: 13px; color: #FFFFFF;'})
                else if (myRank == 2 || myRank == 3) i([], classes: 'ti ti-medal', attributes: {'style': 'font-size: 13px; color: #FFFFFF;'}),
                Component.text(myRank != null ? '#$myRank' : 'Rank'),
              ]),
              Component.text(gameState.currentPlayer?.name ?? username),
            ]),
            div(attributes: {'style': 'display: flex; align-items: center; gap: 6px;'}, [
              i([], classes: 'ti ti-trophy', attributes: {'style': 'font-size: 18px; color: #FFA602;'}),
              span(attributes: {'style': 'font-size: 17px; font-weight: 900; color: #FFFFFF;'}, [
                Component.text('${gameState.currentPlayer?.score ?? 0} pts'),
              ]),
            ]),
          ]),
        ]),
      ],
    );
  }

  Component _buildFinishScreen(BuildContext context, GameState gameState) {
    final myId = gameState.currentPlayer?.id;
    final myName = gameState.currentPlayer?.name;
    final allList = gameState.allPlayers;

    int? myRank;
    for (var i = 0; i < allList.length; i++) {
      final p = allList[i];
      if ((myId != null && p['id'] == myId) || p['name'] == myName) {
        myRank = i + 1;
        break;
      }
    }

    String rankTitle;
    String rankSubtitle;
    String rankIcon;
    String rankColor;

    if (myRank == 1) {
      rankTitle = 'Winner!';
      rankSubtitle = 'You took 1st Place!';
      rankIcon = 'ti ti-trophy';
      rankColor = '#FFA602';
    } else if (myRank == 2) {
      rankTitle = '2nd Place!';
      rankSubtitle = 'Awesome performance!';
      rankIcon = 'ti ti-medal';
      rankColor = '#A0A0A0';
    } else if (myRank == 3) {
      rankTitle = '3rd Place!';
      rankSubtitle = 'On the podium!';
      rankIcon = 'ti ti-medal';
      rankColor = '#CD7F32';
    } else if (myRank != null) {
      rankTitle = 'Rank #$myRank';
      rankSubtitle = 'out of ${allList.length} players';
      rankIcon = 'ti ti-award';
      rankColor = 'var(--brand-purple)';
    } else {
      rankTitle = 'Game Over';
      rankSubtitle = 'Thanks for playing!';
      rankIcon = 'ti ti-check';
      rankColor = '#1D9E75';
    }

    return div(classes: 'scr on fullscreen-center bg-pattern', attributes: {'style': 'min-height: 100vh;'}, [
      div(attributes: {'style': 'padding: 20px 20px 10px; text-align: center;'}, [
        h1(attributes: {'style': 'font-size: clamp(32px, 5vw, 44px); font-weight: 900; color: #FFFFFF; text-shadow: 0 4px 12px rgba(0,0,0,0.3);'}, [
          Component.text('Final Results'),
        ]),
      ]),
      div(classes: 'feedback-card feedback-card-glass', [
        // Rank Hero Card
        div(classes: 'card mb24', attributes: {
          'style': 'padding: 32px 20px; text-align: center; background: #FFFFFF; border-radius: 20px; box-shadow: 0 12px 36px rgba(0,0,0,0.25); position: relative; overflow: hidden; width: 100%; box-sizing: border-box;',
        }, [
          div(attributes: {
            'style': 'width: 88px; height: 88px; border-radius: 50%; background: $rankColor; color: #FFFFFF; display: flex; align-items: center; justify-content: center; margin: 0 auto 16px; box-shadow: 0 6px 20px rgba(0,0,0,0.2);',
          }, [
            i([], classes: rankIcon, attributes: {'style': 'font-size: 44px;'}),
          ]),
          h2(attributes: {'style': 'font-size: 32px; font-weight: 900; color: #11142D; margin-bottom: 6px;'}, [
            Component.text(myRank != null ? '#$myRank' : rankTitle),
          ]),
          p(attributes: {'style': 'font-size: 16px; font-weight: 700; color: var(--color-text-secondary); margin-bottom: 18px;'}, [
            Component.text(rankSubtitle),
          ]),
          hr(classes: 'div', attributes: {'style': 'margin: 16px auto; max-width: 220px;'}),
          div(attributes: {'style': 'font-size: 13px; color: var(--color-text-subtle); font-weight: 700; text-transform: uppercase; letter-spacing: 0.06em; margin-bottom: 4px;'}, [
            Component.text('Final Score'),
          ]),
          div(attributes: {'style': 'font-size: 32px; font-weight: 900; color: #11142D; font-family: var(--font-mono);'}, [
            Component.text('${gameState.currentPlayer?.score ?? 0} pts'),
          ]),
        ]),

        button(
          type: ButtonType.button,
          classes: 'btn btn-dark btn-full btn-lg',
          events: {
            'click': (e) {
              context.read(gameProvider.notifier).reset();
              Router.of(context).push('/');
            }
          },
          [
            i([], classes: 'ti ti-home', attributes: {'style': 'font-size: 18px;'}),
            Component.text('Back to Home'),
          ],
        ),
      ]),
    ]);
  }
}
