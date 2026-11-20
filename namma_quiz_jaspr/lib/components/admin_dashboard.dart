import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:namma_kahoot_client/namma_kahoot_client.dart';
import '../providers/client_provider.dart';
import '../providers/game_provider.dart';

class AdminDashboard extends StatefulComponent {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String _titleInput = '';
  List<Quiz> quizzes = [];
  Quiz? selectedQuiz;
  bool loadingQuizzes = true;
  String? errorMsg;

  List<Question> questions = [];
  bool loadingQuestions = false;

  String qText = '';
  List<String> qOptions = ['', '', '', ''];
  int correctOptionIndex = 0;
  String qTimeStr = '30';

  @override
  void initState() {
    super.initState();
    _loadQuizzes();
  }

  Future<void> _loadQuizzes() async {
    setState(() => loadingQuizzes = true);
    try {
      final fetched = await context.read(clientProvider).admin.getQuizzes();
      setState(() {
        quizzes = fetched;
        loadingQuizzes = false;
        errorMsg = null;
      });
    } catch (e) {
      setState(() {
        loadingQuizzes = false;
        errorMsg = 'Error loading quizzes: $e';
      });
    }
  }

  Future<void> _createQuiz() async {
    if (_titleInput.trim().isEmpty) return;
    try {
      await context
          .read(clientProvider)
          .admin
          .createQuiz(
            Quiz(
              title: _titleInput.trim(),
              creatorId: 1,
              createdAt: DateTime.now(),
            ),
          );
      _titleInput = '';
      await _loadQuizzes();
    } catch (e) {
      setState(() => errorMsg = 'Failed to create quiz: $e');
    }
  }

  Future<void> _loadQuestions(int quizId) async {
    setState(() => loadingQuestions = true);
    try {
      final fetched = await context.read(clientProvider).admin.getQuestionsForQuiz(quizId);
      setState(() {
        questions = fetched;
        loadingQuestions = false;
      });
    } catch (e) {
      setState(() {
        loadingQuestions = false;
        errorMsg = 'Error loading questions: $e';
      });
    }
  }

  Future<void> _addQuestion() async {
    if (selectedQuiz == null) return;
    if (qText.isEmpty || qOptions.any((c) => c.isEmpty)) {
      setState(() => errorMsg = 'Please fill all question fields and options.');
      return;
    }

    try {
      await context
          .read(clientProvider)
          .admin
          .addQuestion(
            Question(
              quizId: selectedQuiz!.id!,
              text: qText,
              options: qOptions,
              correctOptionIndex: correctOptionIndex,
              timeLimitSeconds: int.tryParse(qTimeStr) ?? 30,
              orderIndex: questions.length,
            ),
          );

      setState(() {
        qText = '';
        qOptions = ['', '', '', ''];
        correctOptionIndex = 0;
        qTimeStr = '30';
        errorMsg = null;
      });

      await _loadQuestions(selectedQuiz!.id!);
    } catch (e) {
      setState(() => errorMsg = 'Failed to add question: $e');
    }
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'scr on', [
      div(classes: 'topbar', [
        button(
          classes: 'btn btn-icon btn-white btn-sm',
          events: {
            'click': (e) {
              if (selectedQuiz != null) {
                setState(() => selectedQuiz = null);
              } else {
                Router.of(context).push('/');
              }
            }
          },
          [i([], classes: 'ti ti-arrow-left', attributes: {'style': 'font-size: 16px;'}),],
        ),
        div(attributes: {'style': 'flex: 1; margin-left: 8px;'}, [
          span(classes: 'topbar-title', [
            Component.text(selectedQuiz == null ? 'Quiz Studio' : 'Quiz Deck: ${selectedQuiz!.title}'),
          ]),
        ]),
        if (selectedQuiz != null)
          button(
            classes: 'btn btn-brand btn-sm',
            events: {'click': (e) => context.read(gameProvider.notifier).hostGame(selectedQuiz!.id!)},
            [
              i([], classes: 'ti ti-player-play-filled', attributes: {'style': 'font-size: 14px;'}),
              Component.text('Host Deck'),
            ],
          ),
      ]),
      div(classes: 'content-narrow p24 flex-col', attributes: {'style': 'flex: 1;'}, [
        if (errorMsg != null)
          div(classes: 'banner banner-err mb16', [
            i([], classes: 'ti ti-alert-circle', attributes: {'style': 'font-size: 20px; color: #D85A30;'}),
            div(attributes: {'style': 'font-size: 13px; color: #D85A30; font-weight: 600;'}, [
              Component.text(errorMsg!),
            ]),
          ]),
        if (selectedQuiz == null) _buildQuizList() else _buildQuestionManager(),
      ]),
    ]);
  }

  Component _buildQuizList() {
    return div(classes: 'flex-col h-full', [
      div(attributes: {'style': 'margin-bottom: 24px;'}, [
        div(classes: 'chip chip-p mb8', [Component.text('STUDIO WORKSPACE')]),
        h1(classes: 't-section mb8', [Component.text('Create & Manage Quizzes')]),
        p(classes: 't-body', [
          Component.text('Create trivia challenges and manage custom decks for your live game sessions.'),
        ]),
      ]),

      // Create Quiz Card
      div(classes: 'card mb24', attributes: {'style': 'padding: 24px; border-radius: 18px;'}, [
        label(classes: 'flabel', [Component.text('New Quiz Deck Title')]),
        div(classes: 'frow', attributes: {'style': 'gap: 12px; margin-top: 8px;'}, [
          div(attributes: {'style': 'flex: 1;'}, [
            input(
              type: InputType.text,
              classes: 'finput',
              value: _titleInput,
              attributes: {
                'placeholder': 'e.g. World History Trivia, Science Bowl, Web Dev 101',
              },
              onInput: (String val) => _titleInput = val,
            ),
          ]),
          button(
            classes: 'btn btn-brand',
            attributes: {'style': 'padding: 12px 24px; cursor: pointer;'},
            events: {'click': (e) => _createQuiz()},
            [
              i([], classes: 'ti ti-plus'),
              Component.text('Create Deck'),
            ],
          ),
        ]),
      ]),

      // Existing Quizzes List
      div(classes: 'frow mb12', [
        span(classes: 't-label', [Component.text('Existing Quiz Decks (${quizzes.length})')]),
      ]),

      if (loadingQuizzes)
        div(classes: 'card p24 flex-center', [
          div(attributes: {'style': 'display: flex; align-items: center; gap: 10px; font-weight: 600; color: var(--color-text-secondary);'}, [
            i([], classes: 'ti ti-loader spin-slow', attributes: {'style': 'font-size: 18px;'}),
            Component.text('Loading decks...'),
          ]),
        ])
      else if (quizzes.isEmpty)
        div(classes: 'card card-body flex-center', attributes: {'style': 'padding: 48px; color: var(--color-text-secondary); text-align: center;'}, [
          div([
            i([], classes: 'ti ti-notes-off mb12', attributes: {'style': 'font-size: 36px; color: var(--color-text-subtle);'}),
            div(attributes: {'style': 'font-size: 16px; font-weight: 700; color: var(--color-text-primary); margin-bottom: 4px;'}, [
              Component.text('No quiz decks yet.'),
            ]),
            div(classes: 't-sub', [Component.text('Type a title above to create your first quiz.')]),
          ]),
        ])
      else
        div(classes: 'gap12', [
          for (final q in quizzes)
            div(
              classes: 'card card-hover',
              attributes: {'style': 'padding: 18px 22px; cursor: pointer; border-radius: 16px;'},
              events: {
                'click': (e) {
                  setState(() => selectedQuiz = q);
                  _loadQuestions(q.id!);
                }
              },
              [
                div(classes: 'frow', [
                  div(attributes: {'style': 'display: flex; align-items: center; gap: 14px;'}, [
                    div(classes: 'bento-icon-box', attributes: {
                      'style': 'background: var(--brand-purple-light); color: var(--brand-purple); width: 42px; height: 42px; font-size: 20px; margin-bottom: 0;',
                    }, [
                      i([], classes: 'ti ti-folder'),
                    ]),
                    div([
                      h3(classes: 't-title', [Component.text(q.title)]),
                      p(classes: 't-sub mt4', [
                        Component.text('Created on ${q.createdAt.toString().split(' ')[0]}'),
                      ]),
                    ]),
                  ]),
                  div(attributes: {'style': 'display: flex; align-items: center; gap: 10px;'}, [
                    span(classes: 'chip chip-p', [Component.text('Edit Deck')]),
                    i([], classes: 'ti ti-chevron-right', attributes: {'style': 'color: var(--color-text-subtle); font-size: 18px;'}),
                  ]),
                ]),
              ],
            ),
        ]),
    ]);
  }

  Component _buildQuestionManager() {
    const quadNames = ['A (Red)', 'B (Blue)', 'C (Yellow)', 'D (Green)'];
    const quadBorderColors = ['#E21B3C', '#1368CE', '#D89E00', '#26890C'];

    return div(classes: 'flex-col h-full', [
      // Deck info card
      div(classes: 'card mb20', attributes: {'style': 'padding: 20px 24px; border-radius: 16px;'}, [
        div(classes: 'frow', [
          div([
            div(classes: 't-label mb4', [Component.text('Currently Editing')]),
            h2(classes: 't-title', [Component.text(selectedQuiz!.title)]),
          ]),
          button(
            classes: 'btn btn-white btn-sm',
            events: {'click': (e) => setState(() => selectedQuiz = null)},
            [
              i([], classes: 'ti ti-arrow-left', attributes: {'style': 'font-size: 14px;'}),
              Component.text('Back to All Decks'),
            ],
          ),
        ]),
      ]),

      // Questions list
      div(classes: 'frow mb12', [
        span(classes: 't-label', [Component.text('Questions in Deck (${questions.length})')]),
      ]),

      if (loadingQuestions)
        div(classes: 'card p20 flex-center mb20', [
          div(attributes: {'style': 'display: flex; align-items: center; gap: 8px; color: var(--color-text-secondary); font-weight: 600;'}, [
            i([], classes: 'ti ti-loader spin-slow'),
            Component.text('Loading questions...'),
          ]),
        ])
      else if (questions.isNotEmpty)
        div(classes: 'card mb24', attributes: {'style': 'border-radius: 16px; overflow: hidden;'}, [
          for (var idx = 0; idx < questions.length; idx++)
            div(classes: 'qrow', attributes: {
              'style': 'padding: 16px 20px; border-bottom: 1px solid var(--color-border-tertiary); display: flex; align-items: center; gap: 14px;',
            }, [
              div(classes: 'qnum', attributes: {
                'style': 'width: 28px; height: 28px; border-radius: 50%; background: var(--brand-purple-light); color: var(--brand-purple); font-weight: 800; display: flex; align-items: center; justify-content: center; font-size: 13px;',
              }, [
                Component.text('${idx + 1}'),
              ]),
              div(classes: 'qtext', attributes: {'style': 'flex: 1; font-weight: 600; color: #11142D; font-size: 15px;'}, [
                Component.text(questions[idx].text),
              ]),
              span(classes: 'chip chip-t', [
                i([], classes: 'ti ti-clock', attributes: {'style': 'font-size: 13px;'}),
                Component.text('${questions[idx].timeLimitSeconds}s'),
              ]),
            ]),
        ])
      else
        div(classes: 'card card-body flex-center mb24', attributes: {'style': 'padding: 36px 20px; text-align: center; color: var(--color-text-secondary);'}, [
          Component.text('No questions in this deck yet. Use the form below to add one!'),
        ]),

      // Add question form
      div(classes: 'card p24', attributes: {'style': 'border-radius: 20px; margin-bottom: 32px;'}, [
        div(classes: 'chip chip-p mb8', [Component.text('QUESTION BUILDER')]),
        h3(classes: 't-title mb16', [Component.text('Add New Question')]),

        div(classes: 'fgroup', [
          label(classes: 'flabel', [Component.text('Question Statement')]),
          textarea(
            [],
            classes: 'ftextarea',
            attributes: {'placeholder': 'e.g. Which planet is known as the Red Planet?'},
            onInput: (String val) => qText = val,
          ),
        ]),

        label(classes: 'flabel mb8', [Component.text('Answer Choices (Select the radio of the correct answer)')]),
        div(attributes: {
          'style': 'display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 14px; margin-bottom: 20px;',
        }, [
          for (var i = 0; i < 4; i++)
            div(attributes: {
              'style':
                  'background: var(--color-background-secondary); border: 1.5px solid ${correctOptionIndex == i ? "#26890C" : "var(--color-border-primary)"}; border-radius: 14px; padding: 14px; transition: border-color 0.15s ease;',
            }, [
              label(
                classes: 'flabel',
                attributes: {
                  'style':
                      'display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px; cursor: pointer; color: ${correctOptionIndex == i ? "#1D9E75" : "inherit"};',
                },
                [
                  span(attributes: {'style': 'display: flex; align-items: center; gap: 8px; font-weight: 800;'}, [
                    span([], attributes: {'style': 'width: 10px; height: 10px; border-radius: 50%; background: ${quadBorderColors[i]}; display: inline-block;'}),
                    Component.text(quadNames[i]),
                  ]),
                  input(
                    attributes: {
                      'type': 'radio',
                      'name': 'correctOption',
                      'value': '$i',
                      if (correctOptionIndex == i) 'checked': 'true',
                      'style': 'cursor: pointer;',
                    },
                    events: {
                      'change': (e) => setState(() => correctOptionIndex = i)
                    },
                  ),
                ],
              ),
              input(
                type: InputType.text,
                classes: 'finput',
                value: qOptions[i],
                attributes: {
                  'placeholder': 'Enter choice ${String.fromCharCode(65 + i)}...',
                  'style': 'background: #FFFFFF;',
                },
                onInput: (String val) {
                  final newOpts = List<String>.from(qOptions);
                  newOpts[i] = val;
                  qOptions = newOpts;
                },
              ),
            ]),
        ]),

        div(classes: 'fgroup', [
          label(classes: 'flabel', [Component.text('Time Limit (seconds)')]),
          input(
            type: InputType.number,
            classes: 'finput',
            value: qTimeStr,
            attributes: {
              'placeholder': '30',
              'min': '5',
              'max': '180',
              'style': 'max-width: 180px;',
            },
            onInput: (num val) => qTimeStr = val.toString(),
          ),
        ]),

        button(
          classes: 'btn btn-brand btn-full btn-lg mt16',
          attributes: {'style': 'font-size: 16px; cursor: pointer;'},
          events: {'click': (e) => _addQuestion()},
          [
            i([], classes: 'ti ti-check', attributes: {'style': 'font-size: 18px;'}),
            Component.text('Save Question to Deck'),
          ],
        ),
      ]),
    ]);
  }
}
