import axios from 'axios';
export const auth__store = {
	namespaced: true,
	state: () => ({
		currentUserSignedIn: localStorage.getItem('refreshToken') ? true : false,
		currentUserProfile: null,
		authError: null,
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
		setAuthError(state, authError) {
			state.authError = authError;
		},
		setCurrentUserProfile(state, currentUserProfile) {
			state.currentUserProfile = currentUserProfile;
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
					localStorage.setItem('accessToken', response.data.access);
					localStorage.setItem('refreshToken', response.data.refresh);
					commit('setCurrentUserSignedIn', true);
					commit('setAuthError', null);
					window.location.href = '/tutorials';
				})
				.catch((error) => {
					commit('setCurrentUserSignedIn', false);
					commit('setAuthError', error.response.data.detail);
				});
		},
		// DRF: UserProfileView.as_view() - def list(): GET User profile
		async userProfile({ commit, state }) {
			axios
				.get(`http://${process.env.server_HostPort_1}/api/accounts/profile/`, {
					headers: {
						'Content-Type': 'application/json',
						Accept: 'application/json',
						Authorization: `Bearer ${localStorage.getItem('accessToken')}`,
					},
				})
				.then((response) => {
					commit('setCurrentUserProfile', response.data);
				})
				.catch((error) => {
					commit('setCurrentUserProfile', null);
					console.log(error.response.data.detail);
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
					localStorage.removeItem('accessToken');
					localStorage.removeItem('refreshToken');
					commit('setCurrentUserSignedIn', false);
					commit('setAuthError', null);
					window.location.href = '/signin';
				})
				.catch((error) => {
					console.log(error.response.data.detail);
				});
		},
	},
};
