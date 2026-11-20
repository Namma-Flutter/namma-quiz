import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'qr_scanner_modal.dart';

class HomePage extends StatefulComponent {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _pin = '';
  bool _showScanner = false;

  void _handleJoin() {
    final cleanPin = _pin.trim();
    if (cleanPin.isNotEmpty) {
      Router.of(context).push('/play?pin=$cleanPin');
    } else {
      Router.of(context).push('/play');
    }
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'scr on', [
      // Top Navigation Bar
      header(classes: 'navbar', [
        div(classes: 'navbar-inner', [
          a(
            href: '/',
            classes: 'brand-link',
            [
              div(classes: 'brand-spark', [
                i([], classes: 'ti ti-bolt', attributes: {'style': 'font-size: 20px;'}),
              ]),
              span([Component.text('Namma Quiz')]),
            ],
          ),
          nav(classes: 'nav-links', [
            a(href: '/play', classes: 'nav-item', [Component.text('Play Game')]),
            a(href: '/host', classes: 'nav-item', [Component.text('Host a Quiz')]),
            a(href: '/admin', classes: 'nav-item', [Component.text('Quiz Studio')]),
          ]),
          div(classes: 'nav-cta-row', [
            a(
              href: 'https://github.com/KeerthiVasan-ai/namma_kahoot',
              target: Target.blank,
              classes: 'btn btn-white btn-sm',
              attributes: {'style': 'display: inline-flex; align-items: center; gap: 6px;'},
              [
                i([], classes: 'ti ti-brand-github', attributes: {'style': 'font-size: 16px;'}),
                span([Component.text('GitHub')]),
              ],
            ),
            button(
              classes: 'btn btn-brand btn-sm',
              events: {'click': (e) => Router.of(context).push('/host')},
              [
                i([], classes: 'ti ti-player-play', attributes: {'style': 'font-size: 15px;'}),
                Component.text('Host Live'),
              ],
            ),
          ]),
        ]),
      ]),

      // Hero Section: Split Play Arena on Desktop, Stacked on Mobile
      section(classes: 'home-hero-section bg-pattern', [
        div(classes: 'content-wrap', [
          div(classes: 'hero-grid', [
            // Left Column: Value Proposition & Hooks
            div(classes: 'hero-left-content', [
              div(classes: 'chip chip-glass mb16', [
                span(classes: 'live-dot', []),
                Component.text('Real-Time Multiplayer Trivia • 100% Open Source'),
              ]),
              h1(classes: 't-hero mb16', attributes: {'style': 'color: #FFFFFF;'}, [
                Component.text('Live quizzes engineered for instant excitement.'),
              ]),
              p(classes: 't-body mb24', attributes: {
                'style': 'color: rgba(255, 255, 255, 0.9); font-size: 17px; line-height: 1.6; max-width: 540px;',
              }, [
                Component.text(
                  'Host high-energy multiplayer competitions for classrooms, team events, and game nights. Zero accounts required for players — join instantly with a 6-digit PIN.',
                ),
              ]),
              div(attributes: {
                'style': 'display: flex; flex-wrap: wrap; gap: 14px; margin-bottom: 28px;',
              }, [
                button(
                  classes: 'btn btn-brand btn-lg',
                  attributes: {'style': 'background: #FFFFFF; color: var(--brand-purple); box-shadow: 0 4px 0 rgba(0,0,0,0.25);'},
                  events: {'click': (e) => Router.of(context).push('/host')},
                  [
                    i([], classes: 'ti ti-player-play-filled', attributes: {'style': 'font-size: 18px;'}),
                    Component.text('Host a Quiz Now'),
                  ],
                ),
                button(
                  classes: 'btn btn-ghost btn-lg',
                  events: {'click': (e) => Router.of(context).push('/admin')},
                  [
                    i([], classes: 'ti ti-pencil', attributes: {'style': 'font-size: 18px;'}),
                    Component.text('Custom Quiz Studio'),
                  ],
                ),
              ]),
              // Micro-trust indicators
              div(attributes: {
                'style': 'display: flex; flex-wrap: wrap; gap: 18px; color: rgba(255, 255, 255, 0.82); font-size: 13px; font-weight: 600;',
              }, [
                div(attributes: {'style': 'display: flex; align-items: center; gap: 6px;'}, [
                  i([], classes: 'ti ti-bolt', attributes: {'style': 'color: #FFA602;'}),
                  Component.text('< 50ms WebSocket Sync'),
                ]),
                div(attributes: {'style': 'display: flex; align-items: center; gap: 6px;'}, [
                  i([], classes: 'ti ti-device-mobile', attributes: {'style': 'color: #5DCAA5;'}),
                  Component.text('Phone, Tablet & Desktop'),
                ]),
                div(attributes: {'style': 'display: flex; align-items: center; gap: 6px;'}, [
                  i([], classes: 'ti ti-code', attributes: {'style': 'color: #AFA9EC;'}),
                  Component.text('Full-Stack Dart'),
                ]),
              ]),
            ]),

            // Right Column: Tactile Arcade Console Card
            div(attributes: {'style': 'position: relative; width: 100%; max-width: 440px; margin: 0 auto;'}, [
              // Ambient floating playful quad shapes (within safe bounds)
              div(classes: 'float-anim', attributes: {
                'style': 'position: absolute; top: -16px; left: -14px; z-index: 1;',
              }, [
                i([], classes: 'ti ti-triangle-filled', attributes: {
                  'style': 'font-size: 38px; color: var(--kahoot-red); filter: drop-shadow(0 4px 10px rgba(226,27,60,0.4)); transform: rotate(-12deg);',
                }),
              ]),
              div(classes: 'float-anim delay-1', attributes: {
                'style': 'position: absolute; bottom: -14px; left: -10px; z-index: 1;',
              }, [
                i([], classes: 'ti ti-diamond-filled', attributes: {
                  'style': 'font-size: 42px; color: var(--kahoot-blue); filter: drop-shadow(0 4px 10px rgba(19,104,206,0.4)); transform: rotate(14deg);',
                }),
              ]),
              div(classes: 'float-anim delay-2', attributes: {
                'style': 'position: absolute; top: -12px; right: -12px; z-index: 1;',
              }, [
                i([], classes: 'ti ti-circle-filled', attributes: {
                  'style': 'font-size: 34px; color: var(--kahoot-yellow); filter: drop-shadow(0 4px 10px rgba(216,158,0,0.4));',
                }),
              ]),
              div(classes: 'float-anim delay-3', attributes: {
                'style': 'position: absolute; bottom: -12px; right: -12px; z-index: 1;',
              }, [
                i([], classes: 'ti ti-square-filled', attributes: {
                  'style': 'font-size: 36px; color: var(--kahoot-green); filter: drop-shadow(0 4px 10px rgba(38,137,12,0.4)); transform: rotate(10deg);',
                }),
              ]),

              // Physical Console Card
              div(classes: 'hero-arcade-console', attributes: {'style': 'position: relative; z-index: 2;'}, [
                div(classes: 'arcade-glow', []),
                div(attributes: {'style': 'text-align: center; margin-bottom: 20px;'}, [
                  div(classes: 'chip chip-p mb8', [
                    i([], classes: 'ti ti-sparkles', attributes: {'style': 'font-size: 14px;'}),
                    Component.text('PLAYER ARENA'),
                  ]),
                  h2(attributes: {
                    'style': 'font-size: 26px; font-weight: 900; color: var(--color-text-primary); letter-spacing: -0.02em; margin-bottom: 6px;',
                  }, [
                    Component.text('Ready to play?'),
                  ]),
                  p(classes: 't-sub', [
                    Component.text('Enter the 6-digit Game PIN displayed on the host screen.'),
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
                      input(
                        type: InputType.text,
                        classes: 'finput',
                        value: _pin,
                        attributes: {
                          'placeholder': 'PIN: 000 000',
                          'style':
                              'text-align: center; font-size: 24px; font-weight: 800; letter-spacing: 8px; font-family: var(--font-mono); height: 58px; background: #F8F9FD; border: 2px solid var(--color-border-primary);',
                          'maxlength': '6',
                        },
                        onInput: (String val) => setState(() => _pin = val),
                      ),
                    ]),
                    button(
                      type: ButtonType.submit,
                      classes: 'btn btn-dark btn-full btn-lg',
                      attributes: {
                        'style': 'font-size: 18px; font-weight: 800; padding: 16px; margin-top: 14px; cursor: pointer;',
                      },
                      onClick: _handleJoin,
                      [
                        i([], classes: 'ti ti-login', attributes: {'style': 'font-size: 20px;'}),
                        Component.text('Enter Game PIN'),
                      ],
                    ),
                    button(
                      type: ButtonType.button,
                      classes: 'btn btn-white btn-full mt12',
                      attributes: {'style': 'font-size: 14px; padding: 12px; cursor: pointer;'},
                      events: {'click': (e) => setState(() => _showScanner = true)},
                      [
                        i([], classes: 'ti ti-scan', attributes: {'style': 'font-size: 18px; color: var(--brand-purple);'}),
                        Component.text('Scan Host QR Code'),
                      ],
                    ),
                  ],
                ),

                div(attributes: {
                  'style': 'text-align: center; margin-top: 16px; font-size: 12px; color: var(--color-text-subtle); display: flex; align-items: center; justify-content: center; gap: 6px;',
                }, [
                  i([], classes: 'ti ti-shield-check', attributes: {'style': 'color: #1D9E75; font-size: 15px;'}),
                  Component.text('No registration needed • Free & Open Source'),
                ]),
              ]),
            ]),
          ]),
        ]),

        // Camera QR Scanner Modal
        if (_showScanner)
          QrScannerModal(
            onPinScanned: (scannedPin) {
              setState(() {
                _pin = scannedPin;
                _showScanner = false;
              });
              _handleJoin();
            },
            onClose: () => setState(() => _showScanner = false),
          ),
      ]),

      // Bento Feature Showcase (Anti-Slop Craft)
      section(classes: 'bento-section', [
        div(classes: 'content-wrap', [
          div(attributes: {'style': 'text-align: center; max-width: 640px; margin: 0 auto;'}, [
            div(classes: 'chip chip-p mb8', [Component.text('ENGINEERED FOR REAL-TIME EXCITEMENT')]),
            h2(classes: 't-section mb12', [Component.text('Built for thrilling live competitions.')]),
            p(classes: 't-body', [
              Component.text('Designed from the ground up with full-stack Dart, Serverpod WebSockets, and Jaspr for blazing performance across desktop and mobile browsers.'),
            ]),
          ]),

          div(classes: 'bento-grid', [
            // Card 1: WebSocket Sync (Wide)
            div(classes: 'bento-card bento-col-8', [
              div([
                div(classes: 'bento-icon-box', attributes: {'style': 'background: #EEEDFE; color: var(--brand-purple);'}, [
                  i([], classes: 'ti ti-antenna-bars-5'),
                ]),
                h3(classes: 't-title mb8', [Component.text('Sub-Second WebSocket Synchronization')]),
                p(classes: 't-body mb20', [
                  Component.text(
                    'Real-time bidirectional event pipeline powered by Serverpod. Questions trigger simultaneously, answers register in milliseconds, and the timer syncs uniformly across all participants.',
                  ),
                ]),
              ]),
              div(attributes: {
                'style': 'background: var(--color-background-secondary); border-radius: 12px; padding: 14px 18px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px; border: 1px solid var(--color-border-primary);',
              }, [
                div(attributes: {'style': 'display: flex; align-items: center; gap: 8px; font-size: 13px; font-weight: 700; color: var(--brand-purple);'}, [
                  span(classes: 'live-dot', []),
                  Component.text('Active WebSocket Stream'),
                ]),
                div(attributes: {'style': 'display: flex; gap: 8px;'}, [
                  span(classes: 'chip chip-t', [Component.text('Auto-Reconnect')]),
                  span(classes: 'chip chip-p', [Component.text('Low Latency')]),
                ]),
              ]),
            ]),

            // Card 2: Authentic Game-Show Visuals (Compact)
            div(classes: 'bento-card bento-col-4', [
              div([
                div(classes: 'bento-icon-box', attributes: {'style': 'background: #FAEEDA; color: #BA7517;'}, [
                  i([], classes: 'ti ti-trophy'),
                ]),
                h3(classes: 't-title mb8', [Component.text('Game-Show Dynamic Podiums')]),
                p(classes: 't-body mb20', [
                  Component.text(
                    '4-color answer distribution pillars, high-stakes countdown rings, and celebratory Olympic podium reveals that keep rooms on their toes.',
                  ),
                ]),
              ]),
              div(attributes: {
                'style': 'display: flex; gap: 6px; align-items: flex-end; height: 44px; padding-bottom: 4px;',
              }, [
                div([], attributes: {'style': 'flex: 1; height: 60%; background: var(--kahoot-red); border-radius: 6px 6px 0 0;'}),
                div([], attributes: {'style': 'flex: 1; height: 100%; background: var(--kahoot-blue); border-radius: 6px 6px 0 0;'}),
                div([], attributes: {'style': 'flex: 1; height: 45%; background: var(--kahoot-yellow); border-radius: 6px 6px 0 0;'}),
                div([], attributes: {'style': 'flex: 1; height: 80%; background: var(--kahoot-green); border-radius: 6px 6px 0 0;'}),
              ]),
            ]),

            // Card 3: Zero-Install Experience
            div(classes: 'bento-card bento-col-6', [
              div([
                div(classes: 'bento-icon-box', attributes: {'style': 'background: #E1F5EE; color: #085041;'}, [
                  i([], classes: 'ti ti-device-mobile-check'),
                ]),
                h3(classes: 't-title mb8', [Component.text('Zero-Install Participant Flow')]),
                p(classes: 't-body mb16', [
                  Component.text(
                    'Players simply visit the web address on iOS Safari, Android Chrome, or any desktop browser, punch in the game PIN, choose their nickname, and jump straight into the competition.',
                  ),
                ]),
              ]),
              div(attributes: {'style': 'display: flex; gap: 8px; flex-wrap: wrap;'}, [
                span(classes: 'chip chip-t', [Component.text('No App Store Downloads')]),
                span(classes: 'chip chip-p', [Component.text('No Password Logins')]),
              ]),
            ]),

            // Card 4: Quiz Studio & Editor
            div(classes: 'bento-card bento-col-6', [
              div([
                div(classes: 'bento-icon-box', attributes: {'style': 'background: #FAECE7; color: #712B13;'}, [
                  i([], classes: 'ti ti-layout-grid-add'),
                ]),
                h3(classes: 't-title mb8', [Component.text('Interactive Quiz Studio')]),
                p(classes: 't-body mb16', [
                  Component.text(
                    'Design custom trivia decks with our intuitive editor. Configure time limits per question (10s to 120s), define 4 distinct answer choices, and assign correct keys with single-click selection.',
                  ),
                ]),
              ]),
              div(attributes: {'style': 'display: flex; gap: 8px; flex-wrap: wrap;'}, [
                a(
                  href: '/admin',
                  classes: 'btn btn-white btn-sm',
                  [Component.text('Open Quiz Studio'), i([], classes: 'ti ti-arrow-right')],
                ),
              ]),
            ]),
          ]),
        ]),
      ]),

      // 3-Step "How It Works" Flow
      section(attributes: {'style': 'background: #FFFFFF; border-top: 1px solid var(--color-border-primary); padding: 64px 24px;'}, [
        div(classes: 'content-wrap', [
          div(attributes: {'style': 'text-align: center; max-width: 600px; margin: 0 auto;'}, [
            div(classes: 'chip chip-p mb8', [Component.text('SIMPLE 3-STEP WORKFLOW')]),
            h2(classes: 't-section mb12', [Component.text('How Namma Quiz works.')]),
            p(classes: 't-body', [
              Component.text('From launching the room to crowning the champion on the podium in under two minutes.'),
            ]),
          ]),

          div(classes: 'steps-grid', [
            div(classes: 'step-card', [
              div(classes: 'step-badge', [Component.text('1')]),
              h3(classes: 't-title mb8', [Component.text('Host Launches Room')]),
              p(classes: 't-body', [
                Component.text(
                  'Select any trivia deck or create a fresh one in the Studio. Hit "Start Host" to generate a live 6-digit PIN on the presenter screen.',
                ),
              ]),
            ]),
            div(classes: 'step-card', [
              div(classes: 'step-badge', [Component.text('2')]),
              h3(classes: 't-title mb8', [Component.text('Players Enter PIN')]),
              p(classes: 't-body', [
                Component.text(
                  'Participants navigate to the player page on their phone or laptop, type the PIN, choose their nickname, and watch their avatar appear in the live lobby.',
                ),
              ]),
            ]),
            div(classes: 'step-card', [
              div(classes: 'step-badge', [Component.text('3')]),
              h3(classes: 't-title mb8', [Component.text('Compete & Celebrate')]),
              p(classes: 't-body', [
                Component.text(
                  'Answer quickly to maximize streak points. Review live question answer distributions and celebrate top ranks on the final 3D podium!',
                ),
              ]),
            ]),
          ]),
        ]),
      ]),

      // Polished Footer
      footer(classes: 'site-footer', [
        div(classes: 'footer-inner', [
          div(classes: 'footer-col', attributes: {'style': 'min-width: 260px;'}, [
            div(attributes: {
              'style': 'display: flex; align-items: center; gap: 10px; font-size: 20px; font-weight: 800; margin-bottom: 14px;',
            }, [
              div(classes: 'brand-spark', attributes: {'style': 'width: 30px; height: 30px;'}, [
                i([], classes: 'ti ti-bolt', attributes: {'style': 'font-size: 18px;'}),
              ]),
              span([Component.text('Namma Quiz')]),
            ]),
            p(attributes: {'style': 'color: #8E92BC; font-size: 14px; line-height: 1.6; margin-bottom: 18px; max-width: 320px;'}, [
              Component.text('The open-source real-time quiz and interactive multiplayer learning platform built entirely with Dart.'),
            ]),
            JasprBadge.darkTwoTone(),
          ]),

          div(classes: 'footer-col', [
            div(classes: 'footer-title', [Component.text('Platform')]),
            div([
              a(href: '/', classes: 'footer-link', [Component.text('Home')]),
            ]),
            div([
              a(href: '/play', classes: 'footer-link', [Component.text('Join Game')]),
            ]),
            div([
              a(href: '/host', classes: 'footer-link', [Component.text('Host a Quiz')]),
            ]),
            div([
              a(href: '/admin', classes: 'footer-link', [Component.text('Quiz Studio')]),
            ]),
          ]),

          div(classes: 'footer-col', [
            div(classes: 'footer-title', [Component.text('Technology Stack')]),
            div(attributes: {'style': 'color: #8E92BC; font-size: 14px; display: flex; flex-direction: column; gap: 8px;'}, [
              div([Component.text('• Jaspr Web Engine')]),
              div([Component.text('• Serverpod Backend')]),
              div([Component.text('• Flutter Companion App')]),
              div([Component.text('• Dart 3 Language')]),
            ]),
          ]),

          div(classes: 'footer-col', [
            div(classes: 'footer-title', [Component.text('Community & Code')]),
            div([
              a(
                href: 'https://github.com/KeerthiVasan-ai/namma_kahoot',
                target: Target.blank,
                classes: 'footer-link',
                attributes: {'style': 'display: inline-flex; align-items: center; gap: 6px;'},
                [
                  i([], classes: 'ti ti-brand-github', attributes: {'style': 'font-size: 16px;'}),
                  Component.text('GitHub Repository'),
                ],
              ),
            ]),
            div([
              a(
                href: 'https://github.com/KeerthiVasan-ai/namma_kahoot/blob/main/LICENSE',
                target: Target.blank,
                classes: 'footer-link',
                [Component.text('MIT Open Source License')],
              ),
            ]),
          ]),
        ]),

        div(classes: 'footer-bottom', [
          div([
            Component.text('Copyright © ${DateTime.now().year} Namma Quiz. Released under the MIT License.'),
          ]),
          div(attributes: {'style': 'display: flex; gap: 16px;'}, [
            span([Component.text('Crafted with Dart & Jaspr')]),
          ]),
        ]),
      ]),
    ]);
  }
}
