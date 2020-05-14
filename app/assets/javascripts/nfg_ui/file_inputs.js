// This populates the label inside/below custom file inputs with
// the file name that was selected.
$(document).on('change', '.custom-file-input', function(event) {
  $(this).next('.custom-file-label').html(event.target.files[0].name);
});