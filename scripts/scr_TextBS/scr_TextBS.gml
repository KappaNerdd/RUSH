function scr_TextBull(_text = "", _width = 100) {
	if string_width(_text) <= _width {
        return _text;
	}

    var _len = string_length(_text);
    var _result = "";

    for (var i = 1; i <= _len; i++) {
        var _test = string_copy(_text, 1, i) + "...";
		
        if string_width(_test) > _width {
            return _result + "...";
        }
		
        _result = string_copy(_text, 1, i);
    }

    return _result;
}
