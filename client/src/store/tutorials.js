import axiosWithInterceptor from "@/services/interceptor.js";
import axios from "axios";
import { djangoOptions } from "@/env.js";

const tutorials = {
  namespaced: true,
  state: () => ({
    tutorials: null,
    tutorial: null,
    filter: "",
    searchQuery: "",
    createOrUpdateError: null,
  }),
  getters: {},
  mutations: {
    setTutorials(state, tutorials) {
      state.tutorials = tutorials;
    },
    setTutorial(state, tutorial) {
      state.tutorial = tutorial;
    },
    setFilter(state, filter) {
      state.filter = filter;
    },
    setSearchQuery(state, searchQuery) {
      state.searchQuery = searchQuery;
    },
    setCreateOrUpdateError(state, createOrUpdateError) {
      state.createOrUpdateError = createOrUpdateError;
    },
  },
  actions: {
    async tutorialsList({ commit, state }, params) {
      try {
        if (state.filter) {
          params.filter = state.filter;
        }
        if (state.searchQuery) {
          params.q = state.searchQuery;
        }

        const response = await axios.get(`http://${djangoOptions.host}:${djangoOptions.port}/api/v1/tutorials/`, {
          headers: {
            "Content-Type": "application/json",
          },
          params,
        });

        commit("setTutorials", response.data);
      } catch (error) {
        commit("setTutorials", null);
      }
    },
    async tutorialItem({ commit }, id) {
      try {
        const response = await axios.get(`http://${djangoOptions.host}:${djangoOptions.port}/api/v1/tutorials/${id}`, {
          headers: {
            "Content-Type": "application/json",
          },
        });

        commit("setTutorial", response.data);
      } catch (error) {
        commit("setTutorial", null);
      }
    },
    async deleteTutorialItem({ commit }, id) {
      try {
        await axiosWithInterceptor.delete(
          `http://${djangoOptions.host}:${djangoOptions.port}/api/v1/tutorials/${id}/`,
          {
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("accessToken")}`,
            },
          }
        );

        commit("setTutorial", null);
      } catch (error) {
        /* empty */
      }
    },
    async deleteTutorials({ commit }) {
      try {
        await axiosWithInterceptor.delete(`http://${djangoOptions.host}:${djangoOptions.port}/api/v1/tutorials/`, {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${localStorage.getItem("accessToken")}`,
          },
        });

        commit("setTutorials", null);
        commit("setTutorial", null);
      } catch (error) {
        /* empty */
      }
    },
    async createTutorial({ commit }, params) {
      try {
        await axiosWithInterceptor.post(
          `http://${djangoOptions.host}:${djangoOptions.port}/api/v1/tutorials/`,
          params,
          {
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("accessToken")}`,
            },
          }
        );

        commit("setCreateOrUpdateError", null);
      } catch (error) {
        commit("setCreateOrUpdateError", error.message);
      }
    },
    async updateTutorial({ commit }, params) {
      try {
        await axiosWithInterceptor.patch(
          `http://${djangoOptions.host}:${djangoOptions.port}/api/v1/tutorials/${params.id}/`,
          params,
          {
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("accessToken")}`,
            },
          }
        );

        commit("setCreateOrUpdateError", null);
      } catch (error) {
        commit("setCreateOrUpdateError", error.message);
      }
    },
  },
};

export default tutorials;
