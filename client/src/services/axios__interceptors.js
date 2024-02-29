import axios from 'axios';

const axiosInstance = axios.create();

axiosInstance.interceptors.response.use(
	(response) => {
		return response;
	},
	async (error) => {
		const originalRequestConfig = error.config;
		if (error.response) {
			if (error.response.status === 401 && !originalRequestConfig._retry) {
				originalRequestConfig._retry = true;
				// DRF: TokenRefreshView.as_view() - rest_framework_simplejwt
				return axiosInstance
					.post(
						`http://${process.env.server_HostPort_1}/api/token/refresh/`,
						{
							refresh: localStorage.getItem('refreshToken'),
						},
						{
							headers: {
								'Content-Type': 'application/json',
								Accept: 'application/json',
							},
						}
					)
					.then((response) => {
						localStorage.setItem('accessToken', response.data.access);
						originalRequestConfig.headers.Authorization = `Bearer ${response.data.access}`;
						return axiosInstance(originalRequestConfig);
					})
					.catch((_error) => {
						return Promise.reject(_error);
					});
			}
		}
		return Promise.reject(error);
	}
);

export default axiosInstance;
