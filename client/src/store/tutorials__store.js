import axios from 'axios';
export const tutorials__store = {
	namespaced: true,
	state: () => ({
		tutorials: [],
		tutorial__searched: null,
		tutorial__searchQuery: '',
		tutorial__published: false,
		tutorial__postError: null,
	}),
	getters: {
		displayTutorials(state) {
			if (state.tutorial__published) {
				return state.tutorials.filter((i) => i.published == true);
			} else if (state.tutorial__published === false) {
				return state.tutorials;
			}
		},
	},
	mutations: {
		setTutorials(state, tutorials) {
			state.tutorials = tutorials;
		},
		setSearchedTutorial(state, tutorial__searched) {
			state.tutorial__searched = tutorial__searched;
		},
		setSearchQueryTutorial(state, tutorial__searchQuery) {
			state.tutorial__searchQuery = tutorial__searchQuery;
		},
		setPublishedTutorial(state, tutorial__published) {
			state.tutorial__published = tutorial__published;
		},
		setTutorialPostError(state, tutorial__postError) {
			state.tutorial__postError = tutorial__postError;
		},
	},
	actions: {
		// DRF: class TutorialViewSet - def list(): GET all tutorials list
		async getTutorials({ commit, state }) {
			await axios
				.get(`http://${process.env.server_HostPort_1}/api/tutorials`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						body: null,
					},
				})
				.then((response) => {
					commit('setTutorials', response.data.tutorials);
				})
				.catch((error) => {
					console.log(error.message);
				});
		},
		// DRF: class TutorialViewSet - def list(): GET tutorial which contains searched query
		async getSearchedTutorial({ commit, state }) {
			await axios
				.get(`http://${process.env.server_HostPort_1}/api/tutorials`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						body: null,
					},
					params: {
						q: state.tutorial__searchQuery,
					},
				})
				.then((response) => {
					commit('setSearchedTutorial', response.data.tutorial);
				})
				.catch((error) => {
					console.log(error.response.data.tutorial);
				});
		},
		// DRF: class TutorialViewSet - def destroy(): DELETE tutorials list
		deleteTutorials({ commit }) {
			axios
				.delete(`http://${process.env.server_HostPort_1}/api/tutorials`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						body: null,
					},
				})
				.then((response) => {
					commit('setTutorials', []);
					commit('setSearchedTutorial', null);
				})
				.catch((error) => {
					console.log(error.message);
				});
		},
		// DRF: class TutorialViewSet - def create(): CREATE new tutorial
		async postTutorial({ commit }, tutorial) {
			await axios
				.post(`http://${process.env.server_HostPort_1}/api/tutorials/`, tutorial, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
					},
				})
				.catch((error) => {
					commit('setTutorialPostError', error.message);
				});
		},
	},
};
