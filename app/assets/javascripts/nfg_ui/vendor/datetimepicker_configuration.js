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
      options.ignoreReadonly = true; // options.debug = true

      return options;
    }
  }, {
    key: "defaultFormat",
    value: function defaultFormat() {
      if (this.input.hasClass('datetime-picker')) {
        return 'Y-MM-DD hh:mm A';
      } else if (this.input.hasClass('time-picker')) {
        return 'hh:mm A';
      } else {
        return 'Y-MM-DD';
      }
    }
  }]);

  return DateTimePicker;
}();

$(function() {
  var inputs = $('input.datetime-picker, input.date-picker, input.time-picker');

  if (!(inputs.length > 0)) {
    return;
  }

  return inputs.each(function (index, input) {
    return new NfgUi.DateTimePicker($(input));
  });
});