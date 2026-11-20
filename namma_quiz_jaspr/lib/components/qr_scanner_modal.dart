import 'dart:async';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

class QrScannerModal extends StatefulComponent {
  final void Function(String pin) onPinScanned;
  final void Function() onClose;

  const QrScannerModal({
    required this.onPinScanned,
    required this.onClose,
    super.key,
  });

  @override
  State<QrScannerModal> createState() => _QrScannerModalState();
}

class _QrScannerModalState extends State<QrScannerModal> {
  String? error;
  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    // Clear previous scan state
    try {
      web.window.localStorage.removeItem('namma_scanned_pin');
      web.window.localStorage.removeItem('namma_scan_error');
    } catch (_) {}

    // Polling listener check for broad browser compatibility
    _pollTimer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
      try {
        final pin = web.window.localStorage.getItem('namma_scanned_pin');
        if (pin != null && pin.isNotEmpty) {
          web.window.localStorage.removeItem('namma_scanned_pin');
          _stopScan();
          component.onPinScanned(pin);
          return;
        }

        final err = web.window.localStorage.getItem('namma_scan_error');
        if (err != null && err.isNotEmpty && error == null) {
          setState(() {
            error = err;
          });
        }
      } catch (_) {}
    });

    // Start scanner after DOM is mounted
    Timer(const Duration(milliseconds: 250), () {
      _startScan();
    });
  }

  void _startScan() {
    try {
      web.window.dispatchEvent(
        web.CustomEvent('namma_start_scan'),
      );
    } catch (_) {}
  }

  void _stopScan() {
    try {
      web.window.dispatchEvent(
        web.CustomEvent('namma_stop_scan'),
      );
    } catch (_) {}
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    _stopScan();
    super.dispose();
  }

  void _handleCancel() {
    _stopScan();
    component.onClose();
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'scanner-overlay', [
      div(classes: 'scanner-dialog', [
        // Header
        div(attributes: {'style': 'display: flex; align-items: center; justify-content: space-between; margin-bottom: 12px;'}, [
          div(attributes: {'style': 'display: flex; align-items: center; gap: 8px; font-weight: 800; font-size: 18px; color: var(--color-text-primary);'}, [
            i([], classes: 'ti ti-scan', attributes: {'style': 'font-size: 22px; color: var(--brand-purple);'}),
            span([Component.text('Scan Host QR Code')]),
          ]),
          button(
            type: ButtonType.button,
            classes: 'btn btn-icon btn-white btn-sm',
            onClick: _handleCancel,
            [i([], classes: 'ti ti-x', attributes: {'style': 'font-size: 18px;'}),],
          ),
        ]),

        p(classes: 't-sub mb12', [
          Component.text('Point your device camera at the QR code displayed on the host screen to join automatically.'),
        ]),

        // Camera Viewfinder Box
        div(classes: 'scanner-viewfinder', [
          div(classes: 'scanner-laser', []),
          div(classes: 'scanner-corner tl', []),
          div(classes: 'scanner-corner tr', []),
          div(classes: 'scanner-corner bl', []),
          div(classes: 'scanner-corner br', []),
          div(attributes: {
            'id': 'qr-camera-viewport',
            'style': 'width: 100%; height: 100%;',
          }, []),
        ]),

        if (error != null)
          div(classes: 'banner banner-err mb16', [
            i([], classes: 'ti ti-camera-off', attributes: {'style': 'font-size: 20px; color: #D85A30;'}),
            div(attributes: {'style': 'font-size: 13px; color: #D85A30; font-weight: 600; text-align: left; flex: 1;'}, [
              Component.text(error!),
            ]),
          ]),

        div(attributes: {
          'style': 'display: flex; gap: 12px; align-items: center; margin-top: 16px;',
        }, [
          button(
            type: ButtonType.button,
            classes: 'btn btn-white btn-full',
            onClick: _handleCancel,
            [
              i([], classes: 'ti ti-keyboard', attributes: {'style': 'font-size: 16px;'}),
              Component.text('Enter PIN Manually'),
            ],
          ),
        ]),
      ]),
    ]);
  }
}
