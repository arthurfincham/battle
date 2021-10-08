if (document.querySelector('input[name="attack_type"]')) {
  document.querySelectorAll('input[name="attack_type"]').forEach((elem) => {
    elem.addEventListener("change", function(event) {
      $("#playsubmitbutton").addClass('submit_animation')
    });
  });
}