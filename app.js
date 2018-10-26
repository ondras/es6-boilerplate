"use strict";

(function () {
  'use strict';

  function stuff() {
    return new Promise(function ($return, $error) {
      var response;
      return fetch("/").then(function ($await_1) {
        try {
          response = $await_1;
          alert("It works! HTTP/" + response.status);
          return $return();
        } catch ($boundEx) {
          return $error($boundEx);
        }
      }, $error);
    });
  }

  stuff();
})();

