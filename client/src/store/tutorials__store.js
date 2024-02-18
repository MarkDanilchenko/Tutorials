import axios from 'axios';
export const tutorials__store = {
	namespaced: true,
	state: () => ({
		tutorials: [],
		tutorial__searched: null,
		tutorial__searchQuery: '',
	}),
	getters: {},
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
	},
};
