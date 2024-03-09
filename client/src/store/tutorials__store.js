import axios from 'axios';
import axiosInstance from '@/services/axios__interceptors.js';
import router from '@/router/index.js';

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
			await axiosInstance
				.get(`http://${process.env.server_HostPort_1}/api/tutorials/`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
					},
				})
				.then((response) => {
					commit('setTutorials', response.data.tutorials);
				})
				.catch((error) => {
					commit('setTutorials', []);
					console.log(error.message);
				});
		},
		// DRF: class TutorialViewSet - def list(): GET tutorial which contains searched query
		async getSearchedTutorial({ commit, state }) {
			await axiosInstance
				.get(`http://${process.env.server_HostPort_1}/api/tutorials/`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
					},
					params: {
						q: state.tutorial__searchQuery,
					},
				})
				.then((response) => {
					commit('setSingleAndSearchedTutorial', response.data.tutorial);
				})
				.catch((error) => {
					commit('setSingleAndSearchedTutorial', null);
					console.log(error.response.data.tutorial);
				});
		},
		// DRF: class TutorialViewSet - def destroy(): DELETE tutorials list
		async deleteTutorials({ commit, state }) {
			await axiosInstance
				.delete(`http://${process.env.server_HostPort_1}/api/tutorials/`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						Authorization: `Bearer ${localStorage.getItem('accessToken')}`,
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
			await axiosInstance
				.post(`http://${process.env.server_HostPort_1}/api/tutorials/`, tutorial, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						Authorization: `Bearer ${localStorage.getItem('accessToken')}`,
					},
				})
				.then((response) => {
					if (response !== undefined) {
						commit('setTutorialPostError', null);
						router.push('/tutorials');
					}
				})
				.catch((error) => {
					commit('setTutorialPostError', error.response.data);
				});
		},
		// DRF: class TutorialDetailedViewSet - def retrieve(): GET a single tutorial
		async getSingleTutorial({ commit, state }, id) {
			await axiosInstance
				.get(`http://${process.env.server_HostPort_1}/api/tutorials/${id}/`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
					},
				})
				.then((response) => {
					commit('setSingleAndSearchedTutorial', response.data.tutorial);
				})
				.catch((error) => {
					commit('setSingleAndSearchedTutorial', null);
					console.log(error.message);
				});
		},
		// DRF: class TutorialDetailedViewSet - def destroy(): DELETE a single tutorial
		async deleteSingleTutorial({ commit, state, dispatch }, id) {
			await axiosInstance
				.delete(`http://${process.env.server_HostPort_1}/api/tutorials/${id}/`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						Authorization: `Bearer ${localStorage.getItem('accessToken')}`,
					},
				})
				.then((response) => {
					if (response !== undefined) {
						commit('setSingleAndSearchedTutorial', null);
						dispatch('getTutorials');
					}
				})
				.catch((error) => {
					console.log(error.message);
				});
		},
		// DRF: class TutorialDetailedViewSet - def update(): PUT a single tutorial
		async putSingleTutorial({ commit, state, dispatch }, params) {
			await axiosInstance
				.put(`http://${process.env.server_HostPort_1}/api/tutorials/${params.id}/`, params.updateTutorial, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						Authorization: `Bearer ${localStorage.getItem('accessToken')}`,
					},
				})
				.then((response) => {
					commit('setTutorialPutError', null);
					dispatch('getSingleTutorial', params.id);
					router.push('/tutorials');
				})
				.catch((error) => {
					commit('setTutorialPutError', error.response.data);
					commit('setSingleAndSearchedTutorial', null);
				});
		},
	},
};
