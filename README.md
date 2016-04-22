# es6

ES6+Less skeleton code

**Now with IE8 support!**

  - [babel 6](https://github.com/babel/babel) for es6->es5
  - [es6-micro-loader](https://github.com/caridy/es6-micro-loader) for System.{register,import}
  - [Promise](https://github.com/ondras/promise) polyfill for IE11-
  - [getPrototypeOf fix](https://github.com/seznam/IMA.js-babel6-polyfill) for IE10-
  - [less](https://github.com/less/less.js) for css
  - Makefile(s)
  - inotify for watching

## IE8-specific tricks

  - AMD/[RequireJS](http://requirejs.org/) for IE8 modules (instead of the System API)
  - Double-babel™ to fix all keyword-based properties and members
  - Semi-polyfills for `Object.create`, `Object.defineProperty` and `Object.defineProperties`
