import { createStore } from 'vuex';
import tutorials__store from '@/store/tutorials__store.js';

export default createStore({
	state: () => ({}),
	getters: {},
	mutations: {},
	actions: {},
	modules: {
		tutorials: tutorials__store,
	},
});
