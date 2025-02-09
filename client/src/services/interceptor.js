import axios from "axios";
import eventBus from "@/services/eventBus.js";
import { djangoOptions } from "@/env.js";

const axiosWithInterceptor = axios.create();

// Configure interceptor for response;
axiosWithInterceptor.interceptors.response.use(
  async (response) => response,
  async (error) => {
    const originalRequestConfig = error.config;

    if (error.response) {
      if (error.response.status === 401 && !originalRequestConfig.retry) {
        originalRequestConfig.retry = true;

        try {
          if (originalRequestConfig.url.includes("token/blacklist/")) {
            return Promise.reject(error);
          }

          const accessToken = await axios.post(
            `http://${djangoOptions.host}:${djangoOptions.port}/api/v1/token/refresh/`,
            {
              refresh: localStorage.getItem("refreshToken"),
            },
            {
              headers: {
                "Content-Type": "application/json",
              },
            }
          );

          localStorage.setItem("accessToken", accessToken.data.access);
          originalRequestConfig.headers.Authorization = `Bearer ${accessToken.data.access}`;

          // do request with new access token secondly
          return axiosWithInterceptor(originalRequestConfig);
        } catch (error) {
          eventBus.dispatch("authError");
        }
      }
    }

    return Promise.reject(error);
  }
);

export default axiosWithInterceptor;
