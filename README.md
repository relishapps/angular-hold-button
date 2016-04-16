# Angular Hold Button

An AngularJS directive that turns a regular `<button>` into one that has to be held for a configurable amount of time before it performs an action. It can be used instead of a confirmation dialog for destructive actions.

## Demo

![Hold Button demo](http://i.imgur.com/rzx8nXJ.gif)

## Installation

### npm

```bash
npm install angular-hold-button --save
```

### Manual

Copy `dist/angular-hold-button.min.js` to your project.

## How to use

Add `rmHoldButton` to dependencies

```js
var app = angular.module('ExampleApp', [
   'rmHoldButton',
]);
```

Add `rm-onhold` attribute to a `<button>` in your template

```html
<button rm-onhold="deleteSomething()">Hold me tight!</button>
```
