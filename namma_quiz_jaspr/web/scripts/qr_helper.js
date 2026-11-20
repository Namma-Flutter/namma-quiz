// Namma Quiz - QR Code Generation & Camera Scanner Helper

(function() {
  window.NammaQR = {
    activeScanner: null,

    // Extract 6-digit PIN from scanned text or full URL
    extractPin: function(text) {
      if (!text) return '';
      text = text.trim();
      try {
        const url = new URL(text);
        const pinParam = url.searchParams.get('pin');
        if (pinParam && /^\d{6}$/.test(pinParam)) {
          return pinParam;
        }
      } catch (e) {}

      const matchParam = text.match(/[?&]pin=(\d{6})/i);
      if (matchParam) return matchParam[1];

      const matchDigits = text.match(/\b\d{6}\b/);
      if (matchDigits) return matchDigits[0];

      if (/^\d{6}$/.test(text)) return text;
      return text;
    },

    // Render QR Code in the given container
    renderQrCode: function(containerOrId, text, size) {
      const el = typeof containerOrId === 'string' ? document.getElementById(containerOrId) : containerOrId;
      if (!el) {
        setTimeout(function() {
          window.NammaQR.renderQrCode(containerOrId, text, size);
        }, 150);
        return;
      }
      el.innerHTML = '';
      size = size || 180;

      if (typeof QRCode !== 'undefined') {
        try {
          new QRCode(el, {
            text: text,
            width: size,
            height: size,
            colorDark: "#46178F",
            colorLight: "#FFFFFF",
            correctLevel: QRCode.CorrectLevel.M
          });
          return;
        } catch (e) {
          console.warn('QRCode library error, using fallback:', e);
        }
      }

      // Fallback: render SVG QR using public API or image
      const img = document.createElement('img');
      img.src = 'https://api.qrserver.com/v1/create-qr-code/?size=' + size + 'x' + size + '&color=46-23-143&data=' + encodeURIComponent(text);
      img.alt = 'Game QR Code';
      img.style.width = size + 'px';
      img.style.height = size + 'px';
      img.style.borderRadius = '12px';
      el.appendChild(img);
    },

    // Start live camera QR scanner inside readerElementId
    startScanner: function(readerElementId, onScannedCallback, onErrorCallback) {
      window.NammaQR.stopScanner();

      const readerEl = document.getElementById(readerElementId);
      if (!readerEl) {
        setTimeout(function() {
          window.NammaQR.startScanner(readerElementId, onScannedCallback, onErrorCallback);
        }, 150);
        return;
      }

      if (typeof Html5Qrcode !== 'undefined') {
        const html5QrCode = new Html5Qrcode(readerElementId);
        window.NammaQR.activeScanner = html5QrCode;

        const config = {
          fps: 15,
          qrbox: function(viewfinderWidth, viewfinderHeight) {
            const minEdge = Math.min(viewfinderWidth, viewfinderHeight);
            const edgeSize = Math.floor(minEdge * 0.72);
            return { width: edgeSize, height: edgeSize };
          },
          aspectRatio: 1.0
        };

        html5QrCode.start(
          { facingMode: "environment" },
          config,
          function(decodedText, decodedResult) {
            const pin = window.NammaQR.extractPin(decodedText);
            if (navigator.vibrate) {
              try { navigator.vibrate(100); } catch(e) {}
            }
            window.NammaQR.stopScanner();
            if (typeof onScannedCallback === 'function') {
              onScannedCallback(pin, decodedText);
            }
            try {
              window.localStorage.setItem('namma_scanned_pin', pin);
            } catch(e) {}
            window.dispatchEvent(new CustomEvent('namma_qr_scanned', { detail: { pin: pin } }));
          },
          function(errorMessage) {
            // Frame scan without match, normal
          }
        ).catch(function(err) {
          console.error("Camera start error:", err);
          const errString = (err && err.message) ? err.message : (err ? err.toString() : 'Camera access error');
          if (typeof onErrorCallback === 'function') {
            onErrorCallback(errString);
          }
          try {
            window.localStorage.setItem('namma_scan_error', errString);
          } catch(e) {}
          window.dispatchEvent(new CustomEvent('namma_qr_error', { detail: { error: errString } }));
        });
      } else {
        const errMsg = 'QR scanner engine is loading. Please enter PIN manually or try again.';
        if (typeof onErrorCallback === 'function') {
          onErrorCallback(errMsg);
        }
        try {
          window.localStorage.setItem('namma_scan_error', errMsg);
        } catch(e) {}
        window.dispatchEvent(new CustomEvent('namma_qr_error', { detail: { error: errMsg } }));
      }
    },

    // Stop active camera scanner and release camera hardware
    stopScanner: function() {
      if (window.NammaQR.activeScanner) {
        try {
          window.NammaQR.activeScanner.stop().then(function() {
            try { window.NammaQR.activeScanner.clear(); } catch(e) {}
            window.NammaQR.activeScanner = null;
          }).catch(function(e) {
            window.NammaQR.activeScanner = null;
          });
        } catch(e) {
          window.NammaQR.activeScanner = null;
        }
      }
    }
  };

  // Declarative Auto-Renderer for elements with [data-qr-text]
  function scanAndRenderDeclarativeQRs() {
    const elements = document.querySelectorAll('[data-qr-text]');
    elements.forEach(function(el) {
      const text = el.getAttribute('data-qr-text');
      const size = parseInt(el.getAttribute('data-qr-size') || '180', 10);
      if (text && el.getAttribute('data-qr-rendered') !== text) {
        el.setAttribute('data-qr-rendered', text);
        window.NammaQR.renderQrCode(el, text, size);
      }
    });
  }

  // Observer to automatically render QRs when Jaspr renders components
  if (typeof MutationObserver !== 'undefined') {
    const observer = new MutationObserver(function() {
      scanAndRenderDeclarativeQRs();
    });
    if (document.body) {
      observer.observe(document.body, { childList: true, subtree: true, attributes: true, attributeFilter: ['data-qr-text'] });
    } else {
      window.addEventListener('DOMContentLoaded', function() {
        observer.observe(document.body, { childList: true, subtree: true, attributes: true, attributeFilter: ['data-qr-text'] });
      });
    }
  }

  // Initial and periodic scan for robustness
  setInterval(scanAndRenderDeclarativeQRs, 500);

  // Event listener hooks
  window.addEventListener('namma_render_qr', function(e) {
    if (e.detail && e.detail.containerId && e.detail.text) {
      window.NammaQR.renderQrCode(e.detail.containerId, e.detail.text, e.detail.size || 180);
    }
  });

  window.addEventListener('namma_start_scan', function(e) {
    const elId = (e.detail && e.detail.elementId) || 'qr-camera-viewport';
    window.NammaQR.startScanner(elId);
  });

  window.addEventListener('namma_stop_scan', function() {
    window.NammaQR.stopScanner();
  });
})();
