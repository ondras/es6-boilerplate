!function(a){"use strict";function b(a,b){if("/"===a.charAt(0)&&(a=a.slice(1)),"."!==a.charAt(0))return a;for(var c=a.split("/");"."===c[0]||".."===c[0];)".."===c.shift()&&b.pop();return b.concat(c).join("/")}function c(a){var b=m[a];return b&&!l[a]&&(l[a]=!0,b.execute()),b&&b.proxy}function d(a,b){n[a]=b}function e(a){return n[a]||c(a)}function f(a){return!!n[a]||!!m[a]}function g(a,b){var c=document.createElement("script");c.async&&(c.async=!1),k?c.onreadystatechange=function(){/loaded|complete/.test(this.readyState)&&(this.onreadystatechange=null,b())}:c.onload=c.onerror=b,c.setAttribute("src",a),j.appendChild(c)}function h(a){return new Promise(function(b,c){g((o.baseURL||"/")+a+".js",function(){i&&(o.register(a,i[0],i[1]),i=void 0);var d=m[a];return d?void Promise.all(d.deps.map(function(a){return n[a]||m[a]?Promise.resolve():h(a)})).then(b,c):void c(new Error("Error loading module "+a))})})}var i,j=document.getElementsByTagName("head")[0],k=/MSIE/.test(navigator.userAgent),l=Object.create(null),m=Object.create(null),n=Object.create(null),o={set:d,get:e,has:f,"import":function(a){return new Promise(function(c){var d=b(a,[]),f=e(d);return f?c(f):h(a).then(function(){return e(d)})})},register:function(a,c,d){if(Array.isArray(a))return i=[],void i.push.apply(i,arguments);var f,g,h=Object.create(null),j=Object.create(null);m[a]=f={proxy:h,values:j,deps:c.map(function(c){return b(c,a.split("/").slice(0,-1))}),dependants:[],update:function(a,b){g.setters[f.deps.indexOf(a)](b)},execute:function(){f.deps.map(function(b){var c=n[b];c?f.update(b,c):(c=e(b)&&m[b].values,c&&(m[b].dependants.push(a),f.update(b,c)))}),g.execute()}},g=d(function(b,c){return j[b]=c,f.lock=!0,f.dependants.forEach(function(b){m[b]&&!m[b].lock&&m[b].update(a,j)}),f.lock=!1,Object.getOwnPropertyDescriptor(h,b)||Object.defineProperty(h,b,{enumerable:!0,get:function(){return j[b]}}),c})}};a.System=o}(window);System.register("js/app/app", [], function (_export) {
  return {
    setters: [],
    execute: function () {
      "use strict";
    }
  };
});
/* main es6 file */

System.import('js/app/app').catch(console.error.bind(console));
