// color mode first initialization
// color mode first initialization
// color mode first initialization

window.$ = window.jQuery = require('jquery');

try {
	const colorMode = localStorage.getItem('colorMode');
	if (colorMode === null) {
		throw new Error('The color theme switched to light-mode as default');
	} else {
		$('html').attr('data-bs-theme', `${colorMode}`);
	}
} catch (e) {
	$('html').attr('data-bs-theme', `${'light'}`);
	localStorage.setItem('colorMode', 'light');
}

// color-mode switcher and dots color initialization mode is defined: 
// 
// in the src/components/Navbar.vue
// in the src/mixins/dotColorInit_mixin.js