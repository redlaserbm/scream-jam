/// @function			scr_textbox_create(_text_id, _dictionary)
/// @param _text_id		String that identifies the conversation
/// @param _dictionary	Script concerning where to search for conversation info
/// @description		Generates a textbox with text.
function scr_textbox_create(_text_id, _dictionary = global.dictionary) {

	// obj_textbox already computes its own depth as necessary
	var _textbox = instance_create_depth(0,0,0, obj_textbox);
	with( _textbox) {
		
		state.text_id = _text_id;
		state.dictionary = _dictionary;
		
		// Populate the textbox with conversation information
		_dictionary(_text_id);
	}
}