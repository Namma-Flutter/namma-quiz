import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:namma_kahoot_client/namma_kahoot_client.dart';
import '../providers/client_provider.dart';
import '../providers/game_provider.dart';
import 'countdown_timer.dart';

class HostDashboard extends StatefulComponent {
  const HostDashboard({super.key});

  @override
  State<HostDashboard> createState() => _HostDashboardState();
}

class _HostDashboardState extends State<HostDashboard> {
  List<Quiz> quizzes = [];
  bool loadingQuizzes = true;

  @override
  void initState() {
    super.initState();
    _loadQuizzes();
  }

  Future<void> _loadQuizzes() async {
    try {
      final fetched = await context.read(clientProvider).admin.getQuizzes();
      setState(() {
        quizzes = fetched;
        loadingQuizzes = false;
      });
    } catch (e) {
      setState(() => loadingQuizzes = false);
    }
  }

  @override
  Component build(BuildContext context) {
    final gameState = context.watch(gameProvider);

    if (gameState.session == null) {
      return _buildSelector(context);
    }

    final status = gameState.session?.status;
    final lastEvent = gameState.lastEvent;

    if (status == 'lobby') {
      return _buildLobby(context, gameState);
    } else if (lastEvent?.eventType == 'GAME_FINISHED') {
      return _buildPodium(context, gameState);
    } else if (lastEvent?.eventType == 'SHOW_LEADERBOARD') {
      return _buildLeaderboard(context, gameState);
    } else {
      final currentQuestionIndex = gameState.session?.currentQuestionIndex ?? 0;
      if (currentQuestionIndex < gameState.questions.length) {
        final currentQuestion = gameState.questions[currentQuestionIndex];
        if (gameState.correctOptionIndex != null) {
          return _buildQuestionResult(context, gameState, currentQuestion);
        } else {
          return _buildActiveQuestion(context, gameState, currentQuestion);
        }
      } else {
        return _buildPodium(context, gameState);
      }
    }
  }

  Component _buildSelector(BuildContext context) {
    return div(classes: 'scr on', [
      div(classes: 'topbar', [
        button(
          classes: 'btn btn-icon btn-white btn-sm',
          events: {'click': (e) => Router.of(context).push('/')},
          [i([], classes: 'ti ti-arrow-left', attributes: {'style': 'font-size: 16px;'}),],
        ),
        div(attributes: {'style': 'flex: 1; margin-left: 8px;'}, [
          span(classes: 'topbar-title', [Component.text('Host a Live Quiz')]),
        ]),
        button(
          classes: 'btn btn-white btn-sm',
          events: {'click': (e) => Router.of(context).push('/admin')},
          [
            i([], classes: 'ti ti-plus', attributes: {'style': 'font-size: 15px;'}),
            Component.text('Create Quiz'),
          ],
        ),
      ]),
      div(classes: 'content-narrow p24', [
        div(attributes: {'style': 'margin-bottom: 24px;'}, [
          div(classes: 'chip chip-p mb8', [Component.text('HOST CONTROLS')]),
          h1(classes: 't-section mb8', [Component.text('Select a Quiz Deck')]),
          p(classes: 't-body', [
            Component.text('Choose a quiz to launch its live arena and project the Game PIN for participants.'),
          ]),
        ]),
        if (loadingQuizzes)
          div(classes: 'flex-center card p24', attributes: {'style': 'padding: 48px;'}, [
            div(attributes: {'style': 'display: flex; align-items: center; gap: 10px; font-weight: 700; color: var(--color-text-secondary);'}, [
              i([], classes: 'ti ti-loader spin-slow', attributes: {'style': 'font-size: 20px;'}),
              Component.text('Loading available quizzes...'),
            ]),
          ])
        else if (quizzes.isEmpty)
          div(classes: 'card card-body flex-col flex-center', attributes: {'style': 'padding: 48px 20px; text-align: center;'}, [
            div(classes: 'bento-icon-box mb16', attributes: {'style': 'background: var(--brand-purple-light); color: var(--brand-purple); width: 64px; height: 64px; font-size: 32px; margin: 0 auto 16px;'}, [
              i([], classes: 'ti ti-clipboard-list', []),
            ]),
            h3(classes: 't-title mb8', [Component.text('No quizzes created yet')]),
            p(classes: 't-body mb20', attributes: {'style': 'max-width: 400px; margin: 0 auto 20px;'}, [
              Component.text('Build your first custom trivia deck with questions and timers in the Quiz Studio.'),
            ]),
            button(
              classes: 'btn btn-brand',
              events: {'click': (e) => Router.of(context).push('/admin')},
              [
                i([], classes: 'ti ti-plus', []),
                Component.text('Open Quiz Studio'),
              ],
            ),
          ])
        else
          div(classes: 'gap12', [
            for (final quiz in quizzes)
              div(
                classes: 'card card-hover',
                attributes: {'style': 'padding: 20px 24px; cursor: pointer; display: flex; align-items: center; justify-content: space-between; gap: 16px;'},
                events: {
                  'click': (e) => context.read(gameProvider.notifier).hostGame(quiz.id!)
                },
                [
                  div(attributes: {'style': 'display: flex; align-items: center; gap: 16px; flex: 1;'}, [
                    div(classes: 'bento-icon-box', attributes: {
                      'style': 'background: var(--brand-purple-light); color: var(--brand-purple); margin-bottom: 0; flex-shrink: 0;',
                    }, [
                      i([], classes: 'ti ti-bolt', []),
                    ]),
                    div(attributes: {'style': 'flex: 1;'}, [
                      h3(classes: 't-title', [Component.text(quiz.title)]),
                      p(classes: 't-sub mt4', [
                        Component.text(quiz.description?.isNotEmpty == true ? quiz.description! : 'Interactive multiplayer quiz deck'),
                      ]),
                    ]),
                  ]),
                  button(
                    classes: 'btn btn-brand btn-sm',
                    [
                      i([], classes: 'ti ti-player-play-filled', attributes: {'style': 'font-size: 13px;'}),
                      Component.text('Launch Room'),
                    ],
                  ),
                ],
              ),
          ]),
      ]),
    ]);
  }

  Component _buildLobby(BuildContext context, GameState gameState) {
    return div(classes: 'scr on bg-pattern flex-col', attributes: {'style': 'min-height: 100vh;'}, [
      div(classes: 'topbar', attributes: {'style': 'background: rgba(255,255,255,0.92); backdrop-filter: blur(12px);'}, [
        button(
          classes: 'btn btn-icon btn-white btn-sm',
          events: {
            'click': (e) {
              context.read(gameProvider.notifier).reset();
              Router.of(context).push('/host');
            }
          },
          [i([], classes: 'ti ti-arrow-left', attributes: {'style': 'font-size: 16px;'}),],
        ),
        div(attributes: {'style': 'flex: 1; margin-left: 8px;'}, [
          span(classes: 'topbar-title', [Component.text('Host Lobby')]),
          span(classes: 't-sub', attributes: {'style': 'margin-left: 8px;'}, [Component.text('• Waiting for participants')]),
        ]),
        div(classes: 'chip chip-live', [
          span(classes: 'live-dot', attributes: {'style': 'margin-right: 6px;'}),
          Component.text('Room Active'),
        ]),
      ]),

      div(classes: 'content-wrap p24 flex-col', attributes: {'style': 'flex: 1;'}, [
        // 1. Prominent PIN Block
        div(classes: 'pin-block mb24', attributes: {'style': 'margin: 20px auto 32px; width: 100%;'}, [
          div(classes: 'pin-label-t', [Component.text('Join with Game PIN')]),
          div(classes: 'pin-digits', [Component.text(gameState.session?.pin ?? '...')]),
          div(attributes: {
            'style': 'margin-top: 10px; font-size: 16px; font-weight: 700; color: var(--color-text-secondary); display: flex; align-items: center; justify-content: center; gap: 6px;',
          }, [
            i([], classes: 'ti ti-world', attributes: {'style': 'color: var(--brand-purple);'}),
            Component.text('Go to nammaquiz.com/play'),
          ]),
        ]),

        // 2. Action Bar
        div(classes: 'frow mb24', attributes: {'style': 'padding: 0 4px;'}, [
          div(attributes: {
            'style': 'background: rgba(0,0,0,0.35); color: #FFFFFF; padding: 12px 24px; border-radius: 12px; font-weight: 800; font-size: 20px; display: flex; align-items: center; gap: 10px; border: 1px solid rgba(255,255,255,0.15);',
          }, [
            i([], classes: 'ti ti-users', attributes: {'style': 'font-size: 24px; color: #FFA602;'}),
            Component.text('${gameState.players.length} Player${gameState.players.length == 1 ? "" : "s"} Joined'),
          ]),
          button(
            classes: 'btn btn-brand btn-lg ${gameState.players.isEmpty ? "disabled" : ""}',
            attributes: {'style': 'font-size: 18px; padding: 16px 36px; cursor: pointer;'},
            events: {
              'click': (e) {
                if (gameState.players.isNotEmpty) context.read(gameProvider.notifier).startQuestion();
              }
            },
            [
              i([], classes: 'ti ti-player-play-filled', attributes: {'style': 'font-size: 20px;'}),
              Component.text('Start Game'),
            ],
          ),
        ]),

        // 3. Player Grid
        if (gameState.players.isEmpty)
          div(classes: 'card card-body flex-center', attributes: {
            'style': 'padding: 48px 20px; background: rgba(255,255,255,0.12); backdrop-filter: blur(12px); border: 1px solid rgba(255,255,255,0.2); border-radius: 20px; color: #FFFFFF;',
          }, [
            div(attributes: {'style': 'text-align: center;'}, [
              i([], classes: 'ti ti-loader spin-slow mb16', attributes: {'style': 'font-size: 36px; color: rgba(255,255,255,0.8);'}),
              div(attributes: {'style': 'font-size: 20px; font-weight: 800; margin-bottom: 6px;'}, [
                Component.text('Waiting for players to enter PIN...'),
              ]),
              div(attributes: {'style': 'font-size: 14px; color: rgba(255,255,255,0.7);'}, [
                Component.text('Player avatars will appear here live when they join.'),
              ]),
            ]),
          ])
        else
          div(classes: 'pgrid flex-1', attributes: {'style': 'align-content: flex-start; gap: 20px;'}, [
            for (final pl in gameState.players)
              div(classes: 'jump-anim new', attributes: {'style': 'display: flex; flex-direction: column; align-items: center; position: relative;'}, [
                div(attributes: {'style': 'position: relative; display: inline-block;'}, [
                  div(classes: 'av av-lg', attributes: {
                    'style': 'background: #FFFFFF; color: var(--brand-purple); margin-bottom: 8px; box-shadow: 0 6px 18px rgba(0,0,0,0.22); font-weight: 900; font-size: 24px;',
                  }, [
                    Component.text(pl.name.isNotEmpty ? pl.name[0].toUpperCase() : '?'),
                  ]),
                  button(
                    type: ButtonType.button,
                    attributes: {
                      'style':
                          'position: absolute; top: -4px; right: -4px; width: 22px; height: 22px; border-radius: 50%; background: #D85A30; color: #FFFFFF; border: 2px solid #FFFFFF; display: flex; align-items: center; justify-content: center; cursor: pointer; padding: 0; box-shadow: 0 2px 6px rgba(0,0,0,0.3);',
                      'title': 'Kick player',
                    },
                    onClick: () => context.read(gameProvider.notifier).removePlayer(pl.id!),
                    [i([], classes: 'ti ti-x', attributes: {'style': 'font-size: 12px; line-height: 1;'}),],
                  ),
                ]),
                div(attributes: {
                  'style': 'text-align: center; font-size: 17px; font-weight: 800; color: #FFFFFF; text-shadow: 0 2px 6px rgba(0,0,0,0.35); word-break: break-word;',
                }, [
                  Component.text(pl.name),
                ]),
              ]),
          ]),
      ]),
    ]);
  }

  Component _buildActiveQuestion(BuildContext context, GameState gameState, Question question) {
    final totalAnswers = gameState.answerCounts.values.fold(0, (prev, count) => prev + count);
    return div(classes: 'scr on bg-pattern', attributes: {'style': 'display: flex; flex-direction: column; min-height: 100vh;'}, [
      div(classes: 'content-wrap p24', attributes: {'style': 'flex: 1; display: flex; flex-direction: column;'}, [
        // Question Card
        div(classes: 'card', attributes: {
          'style': 'padding: 28px 24px; text-align: center; background: #FFFFFF; border-radius: 18px; box-shadow: 0 12px 36px rgba(0,0,0,0.22); flex-shrink: 0;',
        }, [
          div(classes: 'chip chip-p mb12', [
            Component.text('Question ${question.orderIndex + 1} of ${gameState.questions.length}'),
          ]),
          h2(attributes: {
            'style': 'font-size: clamp(24px, 4vw, 36px); font-weight: 900; color: #11142D; line-height: 1.3; word-break: break-word;',
          }, [
            Component.text(question.text),
          ]),
        ]),

        // Timer and Answers Row
        div(classes: 'frow', attributes: {'style': 'flex: 1; align-items: center; min-height: 120px; margin: 20px 0;'}, [
          div(attributes: {
            'style':
                'width: 90px; height: 90px; background: #FFFFFF; border: 4px solid var(--brand-purple-vibrant); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--brand-purple); font-size: 38px; font-weight: 900; font-family: var(--font-mono); box-shadow: 0 8px 24px rgba(0,0,0,0.2); flex-shrink: 0;',
          }, [
            CountdownTimer(
              key: Key('timer_${question.orderIndex}'),
              seconds: question.timeLimitSeconds,
              onFinished: () => context.read(gameProvider.notifier).endQuestion(),
            ),
          ]),
          div(attributes: {
            'style': 'text-align: center; background: #FFFFFF; padding: 16px 28px; border-radius: 16px; box-shadow: 0 8px 24px rgba(0,0,0,0.18); min-width: 130px; flex-shrink: 0;',
          }, [
            div(classes: 't-label mb4', [Component.text('Answers In')]),
            div(attributes: {'style': 'font-size: 40px; font-weight: 900; color: #11142D; line-height: 1; font-family: var(--font-mono);'}, [
              Component.text('$totalAnswers'),
            ]),
          ]),
        ]),

        // Answers Grid
        div(classes: 'tiles-grid', attributes: {'style': 'flex-shrink: 0;'}, [
          if (question.options.isNotEmpty)
            div(classes: 'tile ta', [
              div(classes: 'tile-icon', [i([], classes: 'ti ti-triangle-filled', [])]),
              span(classes: 'tile-text', [Component.text(question.options[0])]),
            ]),
          if (question.options.length > 1)
            div(classes: 'tile tb', [
              div(classes: 'tile-icon', [i([], classes: 'ti ti-diamond-filled', [])]),
              span(classes: 'tile-text', [Component.text(question.options[1])]),
            ]),
          if (question.options.length > 2)
            div(classes: 'tile tc', [
              div(classes: 'tile-icon', [i([], classes: 'ti ti-circle-filled', [])]),
              span(classes: 'tile-text', [Component.text(question.options[2])]),
            ]),
          if (question.options.length > 3)
            div(classes: 'tile td', [
              div(classes: 'tile-icon', [i([], classes: 'ti ti-square-filled', [])]),
              span(classes: 'tile-text', [Component.text(question.options[3])]),
            ]),
        ]),

        // Skip Button
        div(attributes: {'style': 'margin-top: 24px; text-align: center; flex-shrink: 0;'}, [
          button(
            classes: 'btn btn-ghost',
            attributes: {'style': 'font-size: 15px; font-weight: 700; padding: 12px 28px; border-radius: 10px;'},
            events: {'click': (e) => context.read(gameProvider.notifier).endQuestion()},
            [
              i([], classes: 'ti ti-player-skip-forward', attributes: {'style': 'font-size: 16px;'}),
              Component.text('Skip Timer'),
            ],
          ),
        ]),
      ]),
    ]);
  }

  Component _buildQuestionResult(BuildContext context, GameState gameState, Question question) {
    final totalAnswers = gameState.answerCounts.values.fold(0, (prev, c) => prev + c);
    final maxAnswers = gameState.answerCounts.values.fold(0, (max, c) => c > max ? c : max);

    return div(classes: 'scr on bg-pattern flex-col', attributes: {'style': 'min-height: 100vh;'}, [
      div(classes: 'content-wrap', attributes: {'style': 'padding: 24px 20px 0; width: 100%; box-sizing: border-box;'}, [
        // Top Navigation Header
        div(attributes: {'style': 'display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;'}, [
          div(classes: 'chip chip-glass', [
            Component.text('Question ${question.orderIndex + 1} of ${gameState.questions.length} • Results'),
          ]),
          button(
            classes: 'btn btn-white btn-sm',
            events: {'click': (e) => context.read(gameProvider.notifier).showLeaderboard()},
            [
              Component.text('Leaderboard'),
              i([], classes: 'ti ti-arrow-right', attributes: {'style': 'margin-left: 4px;'}),
            ],
          ),
        ]),

        // Question Card
        div(classes: 'card mb16', attributes: {
          'style': 'padding: 24px 20px; text-align: center; background: #FFFFFF; border-radius: 18px; box-shadow: 0 10px 30px rgba(0,0,0,0.22); border: none;',
        }, [
          div(classes: 't-label mb8', attributes: {'style': 'color: var(--brand-purple);'}, [
            Component.text('Question ${question.orderIndex + 1} of ${gameState.questions.length}'),
          ]),
          h2(attributes: {'style': 'font-size: clamp(22px, 3.5vw, 30px); font-weight: 900; color: #11142D; line-height: 1.35; word-break: break-word;'}, [
            Component.text(question.text),
          ]),
        ]),

        // Correct Answer Banner
        div(classes: 'banner banner-ok mb20', attributes: {'style': 'box-shadow: 0 4px 14px rgba(29, 158, 117, 0.18);'}, [
          div(attributes: {
            'style': 'width: 40px; height: 40px; border-radius: 50%; background: #1D9E75; color: #FFFFFF; display: flex; align-items: center; justify-content: center; font-size: 22px; flex-shrink: 0;',
          }, [
            i([], classes: 'ti ti-check', attributes: {'style': 'font-size: 22px;'}),
          ]),
          div(attributes: {'style': 'flex: 1;'}, [
            div(attributes: {'style': 'font-size: 17px; font-weight: 800; color: #085041;'}, [
              Component.text('Correct Answer: ${question.options[gameState.correctOptionIndex!]}'),
            ]),
            div(attributes: {'style': 'font-size: 13px; font-weight: 600; color: #0F6E56; margin-top: 2px;'}, [
              Component.text('${gameState.answerCounts[gameState.correctOptionIndex] ?? 0} player${(gameState.answerCounts[gameState.correctOptionIndex] ?? 0) == 1 ? "" : "s"} answered correctly'),
            ]),
          ]),
        ]),

        // Vertical Pillar Stage (Authentic Kahoot Chart)
        div(classes: 'pillar-stage', [
          div(classes: 'pillar-grid', [
            for (var i = 0; i < 4; i++)
              if (i < question.options.length)
                _buildPillarCol(
                  i,
                  gameState.answerCounts[i] ?? 0,
                  maxAnswers,
                  totalAnswers,
                  gameState.correctOptionIndex == i,
                  question.options[i],
                ),
          ]),
        ]),

        // Big Action Button
        div(attributes: {'style': 'margin-bottom: 40px;'}, [
          button(
            classes: 'btn btn-dark btn-full btn-lg',
            events: {'click': (e) => context.read(gameProvider.notifier).showLeaderboard()},
            [
              Component.text('Show Leaderboard'),
              i([], classes: 'ti ti-arrow-right', attributes: {'style': 'margin-left: 6px;'}),
            ],
          ),
        ]),
      ]),
    ]);
  }

  Component _buildPillarCol(
    int idx,
    int count,
    int maxCount,
    int totalCount,
    bool isCorrect,
    String optionText,
  ) {
    const colColors = [
      '#E21B3C', // Red
      '#1368CE', // Blue
      '#D89E00', // Yellow
      '#26890C', // Green
    ];

    const colIcons = [
      'ti ti-triangle-filled',
      'ti ti-diamond-filled',
      'ti ti-circle-filled',
      'ti ti-square-filled',
    ];

    final pct = totalCount > 0 ? ((count / totalCount) * 100).round() : 0;
    final double barHeight = maxCount > 0
        ? ((count / maxCount) * 130.0) + 18.0
        : 18.0;

    final color = colColors[idx % 4];
    final icon = colIcons[idx % 4];

    return div(classes: 'pillar-col', [
      div(classes: 'pillar-count', [
        if (isCorrect)
          div(classes: 'pillar-check-badge', [
            i([], classes: 'ti ti-check', attributes: {'style': 'font-size: 18px;'}),
          ]),
        Component.text('$count'),
      ]),
      div(
        classes: 'pillar-bar',
        attributes: {
          'style': 'height: ${barHeight.round()}px; background: $color;',
        },
        [
          if (count > 0) Component.text('$pct%'),
        ],
      ),
      div(
        classes: 'pillar-footer-tile ${isCorrect ? "is-correct" : ""}',
        attributes: {
          'style': 'background: $color;',
        },
        [
          i([], classes: icon, attributes: {'style': 'font-size: 18px; flex-shrink: 0;'}),
          span(attributes: {'style': 'overflow: hidden; text-overflow: ellipsis; white-space: nowrap; flex: 1;'}, [
            Component.text(optionText),
          ]),
        ],
      ),
    ]);
  }

  Component _buildLeaderboard(BuildContext context, GameState gameState) {
    final isLastQuestion = gameState.session?.currentQuestionIndex == gameState.questions.length - 1;
    final qNum = (gameState.session?.currentQuestionIndex ?? 0) + 1;
    final totalQ = gameState.questions.length;

    return div(classes: 'scr on bg-pattern flex-col', attributes: {'style': 'min-height: 100vh;'}, [
      div(classes: 'content-wrap', attributes: {'style': 'padding: 24px 20px 0; width: 100%; box-sizing: border-box;'}, [
        // Topbar
        div(attributes: {'style': 'display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px;'}, [
          div(classes: 'chip chip-glass', [
            Component.text('Question $qNum of $totalQ'),
          ]),
          button(
            classes: 'btn btn-white btn-sm',
            events: {
              'click': (e) {
                if (isLastQuestion) {
                  context.read(gameProvider.notifier).finishGame();
                } else {
                  context.read(gameProvider.notifier).nextQuestion();
                }
              }
            },
            [
              Component.text(isLastQuestion ? 'Podium ' : 'Next Question '),
              i([], classes: isLastQuestion ? 'ti ti-trophy' : 'ti ti-arrow-right', attributes: {'style': 'margin-left: 4px;'}),
            ],
          ),
        ]),

        // Leaderboard Title
        div(attributes: {'style': 'text-align: center; margin-bottom: 28px;'}, [
          h1(attributes: {
            'style': 'font-size: clamp(32px, 5vw, 44px); font-weight: 900; color: #FFFFFF; text-shadow: 0 4px 12px rgba(0,0,0,0.3); letter-spacing: -0.02em;',
          }, [
            Component.text('Leaderboard'),
          ]),
          p(attributes: {
            'style': 'font-size: 16px; font-weight: 700; color: rgba(255,255,255,0.85); margin-top: 4px;',
          }, [
            Component.text('Top Standings'),
          ]),
        ]),

        // Leaderboard Vibrant Cards
        if (gameState.leaderboard.isEmpty)
          div(classes: 'card p24 flex-center', attributes: {'style': 'padding: 48px; border-radius: 18px; color: var(--color-text-secondary);'}, [
            Component.text('No scores recorded yet.'),
          ])
        else
          for (var idx = 0; idx < gameState.leaderboard.length; idx++)
            _buildLeaderboardRow(idx, gameState.leaderboard[idx]),

        // Big Bottom Action Button
        div(attributes: {'style': 'margin: 28px 0 40px;'}, [
          button(
            classes: 'btn btn-dark btn-full btn-lg',
            events: {
              'click': (e) {
                if (isLastQuestion) {
                  context.read(gameProvider.notifier).finishGame();
                } else {
                  context.read(gameProvider.notifier).nextQuestion();
                }
              }
            },
            [
              Component.text(isLastQuestion ? 'Reveal Final Podium 🏆' : 'Next Question →'),
            ],
          ),
        ]),
      ]),
    ]);
  }

  Component _buildLeaderboardRow(int idx, dynamic player) {
    final rank = idx + 1;
    final name = player['name'] ?? 'Player';
    final score = player['score'] ?? 0;
    final initial = (name.toString().isNotEmpty) ? name.toString()[0].toUpperCase() : '?';

    String rankBadgeBg;
    String borderLeftColor;
    String iconClass;
    if (rank == 1) {
      rankBadgeBg = '#FFA602';
      borderLeftColor = '#FFA602';
      iconClass = 'ti ti-crown';
    } else if (rank == 2) {
      rankBadgeBg = '#A0A0A0';
      borderLeftColor = '#A0A0A0';
      iconClass = 'ti ti-medal';
    } else if (rank == 3) {
      rankBadgeBg = '#CD7F32';
      borderLeftColor = '#CD7F32';
      iconClass = 'ti ti-medal';
    } else {
      rankBadgeBg = 'var(--brand-purple)';
      borderLeftColor = '#E0E0E0';
      iconClass = '';
    }

    return div(
      classes: 'lb-vibrant-card',
      attributes: {
        'style': 'border-left: 8px solid $borderLeftColor;',
      },
      [
        // Rank Circle Badge
        div(classes: 'lb-rank-badge', attributes: {'style': 'background: $rankBadgeBg;'}, [
          if (iconClass.isNotEmpty)
            i([], classes: iconClass, attributes: {'style': 'font-size: 20px;'})
          else
            Component.text('$rank'),
        ]),

        // Avatar
        div(attributes: {
          'style': 'width: 44px; height: 44px; border-radius: 50%; background: ${idx % 2 == 0 ? "var(--brand-purple)" : "#1368CE"}; color: #FFFFFF; display: flex; align-items: center; justify-content: center; font-size: 18px; font-weight: 800; flex-shrink: 0;',
        }, [
          Component.text(initial),
        ]),

        // Player Name
        div(attributes: {'style': 'flex: 1; font-size: 19px; font-weight: 800; color: #11142D; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;'}, [
          Component.text('$name'),
        ]),

        // Score with Trophy / Flame
        div(attributes: {
          'style': 'display: flex; align-items: center; gap: 8px; font-size: 22px; font-weight: 900; color: var(--brand-purple); flex-shrink: 0;',
        }, [
          i([], classes: rank == 1 ? 'ti ti-flame' : 'ti ti-star', attributes: {
            'style': 'font-size: 20px; color: ${rank == 1 ? "#D85A30" : "#FFA602"};',
          }),
          Component.text('$score'),
        ]),
      ],
    );
  }

  Component _buildPodium(BuildContext context, GameState gameState) {
    final podium = gameState.podium;
    return div(classes: 'scr on bg-pattern', [
      div(attributes: {'style': 'padding: 40px 20px 24px;'}, [
        div(classes: 'content-wrap', attributes: {'style': 'text-align: center;'}, [
          h1(attributes: {'style': 'font-size: clamp(36px, 6vw, 54px); font-weight: 900; color: #FFFFFF; text-shadow: 0 4px 14px rgba(0,0,0,0.3);'}, [
            Component.text('Podium Celebration'),
          ]),
        ]),
        div(classes: 'content-wrap podium mt20', [
          if (podium.length > 1)
            div(classes: 'pod-col', [
              div(classes: 'av av-md av-t', [Component.text('${podium[1]['name']}'[0].toUpperCase())]),
              div(classes: 'pod-step pod-step-2', [div(classes: 'pod-num', [Component.text('2')])]),
              div(classes: 'pod-name', [Component.text('${podium[1]['name']}')]),
            ]),
          if (podium.isNotEmpty)
            div(classes: 'pod-col', [
              i([], classes: 'ti ti-crown', attributes: {'style': 'font-size: 28px; color: #FFA602; margin-bottom: 2px;'}),
              div(classes: 'av av-lg av-p', [Component.text('${podium[0]['name']}'[0].toUpperCase())]),
              div(classes: 'pod-step pod-step-1', [div(classes: 'pod-num', [Component.text('1')])]),
              div(classes: 'pod-name', attributes: {'style': 'font-size: 16px; font-weight: 800; color: #FFFFFF;'}, [Component.text('${podium[0]['name']}')]),
            ]),
          if (podium.length > 2)
            div(classes: 'pod-col', [
              div(classes: 'av av-sm av-a', [Component.text('${podium[2]['name']}'[0].toUpperCase())]),
              div(classes: 'pod-step pod-step-3', [div(classes: 'pod-num', [Component.text('3')])]),
              div(classes: 'pod-name', [Component.text('${podium[2]['name']}')]),
            ]),
        ]),
      ]),
      div(classes: 'content-narrow p24 flex-col', attributes: {'style': 'flex: 1;'}, [
        if (podium.isNotEmpty)
          div(classes: 'card mb20', attributes: {
            'style': 'padding: 20px 24px; background: #FFFFFF; border-radius: 18px; box-shadow: 0 8px 24px rgba(0,0,0,0.15);',
          }, [
            div(classes: 'row', attributes: {'style': 'gap: 16px;'}, [
              div(classes: 'av av-lg av-p', [Component.text('${podium[0]['name']}'[0].toUpperCase())]),
              div(attributes: {'style': 'flex: 1;'}, [
                h3(attributes: {'style': 'font-size: 20px; font-weight: 900; color: #11142D; margin-bottom: 4px;'}, [
                  Component.text('${podium[0]['name']} takes the Crown! 👑'),
                ]),
                p(attributes: {'style': 'font-size: 15px; font-weight: 700; color: var(--brand-purple);'}, [
                  Component.text('${podium[0]['score']} pts Total'),
                ]),
              ]),
            ]),
          ]),
        div(attributes: {
          'style': 'display: grid; grid-template-columns: repeat(2, 1fr); gap: 16px; margin-bottom: 24px;',
        }, [
          div(classes: 'card card-body', attributes: {'style': 'text-align: center; padding: 20px 16px;'}, [
            div(classes: 't-num', [Component.text('${gameState.players.length}')]),
            div(classes: 't-label mt4', [Component.text('Total Players')]),
          ]),
          div(classes: 'card card-body', attributes: {'style': 'text-align: center; padding: 20px 16px;'}, [
            div(classes: 't-num', [Component.text('${gameState.questions.length}')]),
            div(classes: 't-label mt4', [Component.text('Questions Played')]),
          ]),
        ]),
        div(classes: 'spacer', []),
        div(attributes: {'style': 'display: flex; gap: 14px;'}, [
          button(classes: 'btn btn-brand btn-lg', attributes: {'style': 'flex: 1;'}, events: {
            'click': (e) {
              context.read(gameProvider.notifier).reset();
              Router.of(context).push('/host');
            }
          }, [i([], classes: 'ti ti-refresh', []), Component.text('Play Again')]),
          button(classes: 'btn btn-white btn-lg', attributes: {'style': 'flex: 1;'}, events: {
            'click': (e) {
              context.read(gameProvider.notifier).reset();
              Router.of(context).push('/');
            }
          }, [i([], classes: 'ti ti-home', []), Component.text('Return Home')]),
        ]),
      ]),
    ]);
  }
}
