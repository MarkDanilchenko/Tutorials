import { createApp } from 'vue';
import App from '@/App.vue';
import router from '@/router/index.js';
import store from '@/store/index.js';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import '@/assets/js/index.js';
import '@/assets/scss/index.scss';
import directives_custom from '@/directives/index.js';
window.$ = window.jQuery = require('jquery');

const app = createApp(App);

directives_custom.forEach((directive) => {
	app.directive(directive.name, directive);
});

app.use(router).use(store).mount('#app');
