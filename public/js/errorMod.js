var errorMod = (function(){
  var errorDiv = '.error'
  var showError = function( message ) {
    $(errorDiv).text(message);
    $(errorDiv).show();
  };
  return {
    show: showError
  };
})();