var app = window.app = {};

app.Books = function() {
  this._input = $('#books-search-txt');
  this._initAutocomplete();
};

app.Books.prototype = {
	_initAutocomplete: function() {
	  this._input
	    .autocomplete({
	      source: '/books',
	      appendTo: '#books-search-results',
	      select: $.proxy(this._select, this)
	    })
	    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
	},

	 _render: function(ul, item) {
	    var markup = [
	      '<span class="title">' + item.title + '</span>'
	    ];
	    return $('<li>')
	      .append(markup.join(''))
	      .appendTo(ul);
	  },

	  _select: function(e, ui) {
	    this._input.val(ui.item.title + ' - ' + ui.item.author);
	    return false;
	  }
};