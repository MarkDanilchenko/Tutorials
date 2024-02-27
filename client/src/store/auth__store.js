import axios from 'axios';
export const auth__store = {
	namespaced: true,
	state: () => ({
		currentUserSignedIn: localStorage.getItem('refreshToken') ? true : false,
	}),
	getters: {
		currentUserSignedIn(state) {
			return state.currentUserSignedIn;
		},
	},
	mutations: {
		setCurrentUserSignedIn(state, currentUserSignedIn) {
			state.currentUserSignedIn = currentUserSignedIn;
		},
	},
	actions: {
		// DRF: TokenObtainPairView.as_view() - rest_framework_simplejwt
		async signIn({ commit, state }, credentials) {
			await axios
				.post(`http://${process.env.server_HostPort_1}/api/token/`, credentials, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
					},
				})
				.then((response) => {
					commit('setCurrentUserSignedIn', true);
					localStorage.setItem('accessToken', response.data.access);
					localStorage.setItem('refreshToken', response.data.refresh);
				})
				.catch((error) => {
					commit('setCurrentUserSignedIn', false);
					console.log(error.message);
				});
		},
		// DRF: TokenBlacklistView.as_view() - rest_framework_simplejwt
		async signOut({ commit, state }, credentials) {
			await axios
				.post(`http://${process.env.server_HostPort_1}/api/token/blacklist/`, credentials, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						Authorization: `Bearer ${localStorage.getItem('accessToken')}`,
					},
				})
				.then((response) => {
					commit('setCurrentUserSignedIn', false);
					localStorage.removeItem('accessToken');
					localStorage.removeItem('refreshToken');
				})
				.catch((error) => {
					console.log(error.message);
				});
		},
	},
};
