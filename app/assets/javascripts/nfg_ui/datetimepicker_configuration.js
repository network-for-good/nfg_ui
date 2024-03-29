"use strict";

function _instanceof(left, right) { if (right != null && typeof Symbol !== "undefined" && right[Symbol.hasInstance]) { return !!right[Symbol.hasInstance](left); } else { return left instanceof right; } }

function _classCallCheck(instance, Constructor) { if (!_instanceof(instance, Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

NfgUi.DateTimePicker =
/*#__PURE__*/
function () {
  function DateTimePicker(input) {
    _classCallCheck(this, DateTimePicker);

    this.input = input;
    this.input[0].readOnly = true;
    this.input.datetimepicker(this.options());
    this.input.on('dp.show', function (event) {
      $('.bootstrap-datetimepicker-widget').addClass('fs-ignore-rage-clicks'); // makes fullstory ignore "rage clicks" on the datetimepicker
    });
  }

  _createClass(DateTimePicker, [{
    key: "options",
    value: function options() {
      var options = this.input.data('options') || {};

      if (!options.format) {
        options.format = this.defaultFormat();
      }

      options.useCurrent = false;
      options.ignoreReadonly = true;
      options.icons = {
        time:"fa fa-clock-o",
        date:"fa fa-calendar",
        up:"fa fa-caret-up",
        down:"fa fa-caret-down",
        previous:"fa fa-caret-left",
        next:"fa fa-caret-right",
        today:"fa fa-crosshairs",
        clear:"fa fa-trash-o",
        close:"fa fa-times"
      }
      options.sideBySide = true;
      // options.debug = true
      return options;
    }
  }, {
    key: "defaultFormat",
    value: function defaultFormat() {

      if (this.input.data('datetimepicker') == 'datetime') {
        return 'YYYY-MM-DD hh:mm A';
      } else if (this.input.data('datetimepicker') == 'time') {
        return 'hh:mm A';
      } else {
        return 'YYYY-MM-DD';
      }
    }
  }]);

  return DateTimePicker;
}();

function initNfgUiDateTimePicker() {
  var inputs = $("input[data-datetimepicker='datetime'], input[data-datetimepicker='date'], input[data-datetimepicker='time']");

  if (!(inputs.length > 0)) {
    return;
  }

  return inputs.each(function (index, input) {
    return new NfgUi.DateTimePicker($(input));
  });
}

if (NfgUi.turbolinks)
  $(document).on('turbolinks:load', initNfgUiDateTimePicker);
else
  $(document).ready(initNfgUiDateTimePicker);
