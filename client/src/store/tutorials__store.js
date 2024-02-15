import axios from 'axios';
export const tutorials__store = {
	namespaced: true,
	state: () => ({
		tutorials: [],
	}),
	getters: {},
	mutations: {
		setTutorials(state, tutorials) {
			state.tutorials = tutorials;
		},
	},
	actions: {
		async getAllTutorials({ commit, state }) {
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
	},
};
