import axios from "axios";
import axiosWithInterceptor from "@/services/interceptor.js";
import eventBus from "@/services/eventBus";
import { djangoOptions } from "@/env.js";

const auth = {
  namespaced: true,
  state: () => ({
    isSignedIn: localStorage.getItem("refreshToken") ? true : false,
    profile: null,
    signInError: null,
    signUpError: null,
  }),
  getters: {},
  mutations: {
    setIsSignedIn(state, isSignedIn) {
      state.isSignedIn = isSignedIn;
    },
    setProfile(state, profile) {
      state.profile = profile;
    },
    setSignInError(state, signInError) {
      state.signInError = signInError;
    },
    setSignUpError(state, signUpError) {
      state.signUpError = signUpError;
    },
  },
  actions: {
    async signUp({ commit }, newUser) {
      try {
        await axios.post(`http://${djangoOptions.host}:${djangoOptions.port}/api/v1/account/signup/`, newUser, {
          headers: {
            "Content-Type": "application/json",
          },
        });
      } catch (error) {
        commit("setSignUpError", error.message);
      }
    },
    async signIn({ commit }, credentials) {
      try {
        const { data } = await axios.post(
          `http://${djangoOptions.host}:${djangoOptions.port}/api/v1/token/retrieve/`,
          credentials,
          {
            headers: {
              "Content-Type": "application/json",
            },
          }
        );

        localStorage.setItem("accessToken", data.access);
        localStorage.setItem("refreshToken", data.refresh);
        commit("setIsSignedIn", true);
        window.location.href = "/tutorials";
      } catch (error) {
        commit("setSignInError", error.message);
        eventBus.dispatch("authError");
      }
    },
    async profile({ commit }) {
      try {
        const profile = await axiosWithInterceptor.get(
          `http://${djangoOptions.host}:${djangoOptions.port}/api/v1/account/profile/`,
          {
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("accessToken")}`,
            },
          }
        );
        commit("setProfile", profile.data);
      } catch (error) {
        commit("setProfile", null);
        eventBus.dispatch("authError");
      }
    },
    async invalidateTokens({ commit }, refresh) {
      try {
        await axiosWithInterceptor.post(
          `http://${djangoOptions.host}:${djangoOptions.port}/api/v1/token/blacklist/`,
          refresh,
          {
            headers: {
              "Content-Type": "application/json",
            },
          }
        );
      } finally {
        localStorage.removeItem("accessToken");
        localStorage.removeItem("refreshToken");
        commit("isSignedIn", false);
        commit("setProfile", null);
        window.location.href = "/signin";
      }
    },
  },
};

export default auth;
