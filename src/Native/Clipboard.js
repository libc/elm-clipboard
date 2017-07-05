var _libc$elm_clipboard$Native = function() {
  function getData(mimeType) {
    return function(event) {
      if (event.clipboardData.types.indexOf(mimeType) === -1) {
        return _elm_lang$core$Maybe$Nothing;
      }

      event.preventDefault()

      return _elm_lang$core$Maybe$Just(event.clipboardData.getData(mimeType));
    }
  }

  return {
    getData: getData
  };
}();
