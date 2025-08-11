// Pendo Resource Center overlap handler
// Handles z-index conflicts between Pendo Resource Center and other widgets (like Bongentic)

(function() {
  'use strict';

  var PendoOverlapHandler = {
    init: function() {
      this.handlePendoBongenticOverlap();
    },

    // Function to handle Pendo Resource Center overlap with Bongentic
    handlePendoBongenticOverlap: function() {
      var self = this;
      
      // Wait for Pendo to be available (it loads async)
      function waitForPendo(callback) {
        if (window.pendo) {
          callback();
        } else {
          setTimeout(function() { waitForPendo(callback); }, 500); // Check every 500ms
        }
      }

      // Function to set z-index on Pendo elements
      function setPendoZIndex(value) {
        // Target multiple possible Pendo selectors
        var pendoSelectors = [
          '.pendo-resource-center-container',
          '#pendo-resource-center-container',
          '.pendo-resource-center-overlay',
          '._pendo-resource-center-badge-container',
          '._pendo-resource-center_'
        ];
        
        pendoSelectors.forEach(function(selector) {
          var elements = document.querySelectorAll(selector);
          elements.forEach(function(el) {
            if (el) el.style.zIndex = value;
          });
        });
      }

      // Alternative approach: Use MutationObserver to detect Pendo elements
      function setupPendoObserver() {
        var observer = new MutationObserver(function(mutations) {
          mutations.forEach(function(mutation) {
            if (mutation.addedNodes && mutation.addedNodes.length > 0) {
              for (var i = 0; i < mutation.addedNodes.length; i++) {
                var node = mutation.addedNodes[i];
                if (node.nodeType === 1) { // Element node
                  if (
                    node.classList && (
                      node.classList.contains('pendo-resource-center-container') ||
                      node.id === 'pendo-resource-center-container' ||
                      node.classList.contains('_pendo-resource-center_')
                    )
                  ) {
                    node.style.zIndex = '10000000000';
                  }
                }
              }
            }
          });
        });
        
        observer.observe(document.body, {
          childList: true,
          subtree: true
        });
      }

      waitForPendo(function() {
        // Set up the observer
        setupPendoObserver();
        
        // Also use Pendo events when available
        if (window.pendo) {
          pendo.onGuideShown = function(guide) {
            if (guide && guide.type === 'resourceCenter') {
              setPendoZIndex('10000000000');
            }
          };

          pendo.onGuideDismissed = function(guide) {
            if (guide && guide.type === 'resourceCenter') {
              setPendoZIndex('');
            }
          };
          
          // Initial check in case resource center is already open
          if (document.querySelector('.pendo-resource-center-container')) {
            setPendoZIndex('10000000000');
          }
        }
      });
    }
  };

  // Make it available globally under NfgUi namespace
  window.NfgUi = window.NfgUi || {};
  window.NfgUi.PendoOverlapHandler = PendoOverlapHandler;

  // Auto-initialize on page load (compatible with Turbolinks/Turbo)
  function initializePendoHandler() {
    PendoOverlapHandler.init();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initializePendoHandler);
  } else {
    initializePendoHandler();
  }

  // Also initialize on Turbolinks page loads
  document.addEventListener('turbolinks:load', initializePendoHandler);
  // Support for Turbo (Rails 7+)
  document.addEventListener('turbo:load', initializePendoHandler);

})();
