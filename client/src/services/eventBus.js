const eventBus = {
	/* The `on(event, callback)` method in the `eventBus` object is used to add an event listener to the
document for a specific event. When the specified event occurs, the provided callback function is
executed with the event detail as its argument. This allows you to listen for custom events and
handle them accordingly in your application. */
	on(event, callback) {
		document.addEventListener(event, (e) => callback(e.detail));
	},
	/* The `dispatch(event, data)` method in the `eventBus` object is used to dispatch a custom event with
the specified event name and data. */
	dispatch(event, data) {
		document.dispatchEvent(new CustomEvent(event, { detail: data }));
	},
	/* The `remove(event, callback)` method in the `eventBus` object is used to remove an event listener
that was previously added using the `on(event, callback)` method. It takes two parameters: the event
name and the callback function that was originally added as the event listener. */
	remove(event, callback) {
		document.removeEventListener(event, callback);
	},
};

export default eventBus;
