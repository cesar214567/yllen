// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import $ from 'jquery';
import 'select2';

// Internal imports, e.g:
const startSelect2 = (name) => {
  console.log($(name).data('url'));
  if ($(name).hasClass("select2-hidden-accessible")) {
    return; // Select2 is already initialized
  }
  $(name).select2({
    ajax: {
      url: $(name).data('url'),
      dataType: 'json',
      delay: 250,
      data: function (params) {
        return { query: params.term }; // Pass search term
      },
      processResults: function (data) {
        return { results: data }; // Format results for Select2
      }
    },
    minimumInputLength: 0, // Start searching after 1 character
    placeholder: "Busca la categoria",
    allowClear: true
  });
  $(name).select2('open');
  setTimeout(() => {
    if (!$(name).data("select2-opened")) {
      $(name).select2("open");
      $(name).data("select2-opened", true);
    }
  }, 200);
}

document.addEventListener('turbolinks:before-cache', () => {
  // Destroy Select2 before caching to prevent duplication
  $(".select2").each(function () {
    $(this).select2('destroy');
  });
});

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  startSelect2(".select2-subtypes");
  startSelect2(".select2-items");
  startSelect2(".select2-inventories");
});
