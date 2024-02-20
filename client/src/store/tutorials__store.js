import axios from 'axios';
export const tutorials__store = {
	namespaced: true,
	state: () => ({
		tutorials: [],
		tutorial__details: null,
		tutorial__searchQuery: '',
		tutorial__published: false,
		tutorial__postError: null,
		tutorial__putError: null,
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
		setSingleAndSearchedTutorial(state, tutorial__details) {
			state.tutorial__details = tutorial__details;
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
		setTutorialPutError(state, tutorial__putError) {
			state.tutorial__putError = tutorial__putError;
		},
	},
	actions: {
		// DRF: class TutorialViewSet - def list(): GET all tutorials list
		async getTutorials({ commit, state }) {
			await axios
				.get(`http://${process.env.server_HostPort_1}/api/tutorials/`, {
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
				.get(`http://${process.env.server_HostPort_1}/api/tutorials/`, {
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
					commit('setSingleAndSearchedTutorial', response.data.tutorial);
				})
				.catch((error) => {
					console.log(error.response.data.tutorial);
				});
		},
		// DRF: class TutorialViewSet - def destroy(): DELETE tutorials list
		async deleteTutorials({ commit, state }) {
			await axios
				.delete(`http://${process.env.server_HostPort_1}/api/tutorials/`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						body: null,
					},
				})
				.then((response) => {
					commit('setTutorials', []);
					commit('setSingleAndSearchedTutorial', null);
				})
				.catch((error) => {
					console.log(error.message);
				});
		},
		// DRF: class TutorialViewSet - def create(): POST new tutorial
		async postTutorial({ commit, state }, tutorial) {
			await axios.post(`http://${process.env.server_HostPort_1}/api/tutorials/`, tutorial, {
				headers: {
					'Content-Type': 'application/json',
					Accept: 'application/json',
				},
			});
			// server's error is handled in .vue component through .then((response) => {}).catch((error) => {})
		},
		// DRF: class TutorialDetailedViewSet - def retrieve(): GET a single tutorial
		async getSingleTutorial({ commit, state }, id) {
			await axios
				.get(`http://${process.env.server_HostPort_1}/api/tutorials/${id}/`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						body: null,
					},
				})
				.then((response) => {
					commit('setSingleAndSearchedTutorial', response.data.tutorial);
				})
				.catch((error) => {
					console.log(error.message);
				});
		},
		// DRF: class TutorialDetailedViewSet - def destroy(): DELETE a single tutorial
		async deleteSingleTutorial({ commit, state }, id) {
			await axios
				.delete(`http://${process.env.server_HostPort_1}/api/tutorials/${id}/`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						body: null,
					},
				})
				.then((response) => {
					commit('setSingleAndSearchedTutorial', null);
				})
				.catch((error) => {
					console.log(error.message);
				});
		},
		// DRF: class TutorialDetailedViewSet - def update(): PUT a single tutorial
		async putSingleTutorial({ commit, state }, params) {
			await axios.put(`http://${process.env.server_HostPort_1}/api/tutorials/${params.id}/`, params.updateTutorial, {
				headers: {
					'Content-Type': 'application/json',
					Accept: 'application/json',
				},
			});
			// server's error is handled in .vue component through .then((response) => {}).catch((error) => {})
		},
	},
};
