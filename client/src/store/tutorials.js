import axiosWithInterceptor from "@/services/interceptor.js";
import axios from "axios";
import { djangoOptions } from "@/env.js";

const tutorials = {
  namespaced: true,
  state: () => ({
    tutorials: null,
    tutorial: null,
    filterCondition: "all",
    createOrUpdateError: null,
    // tutorial__searchQuery: "",
  }),
  getters: {},
  mutations: {
    setTutorials(state, tutorials) {
      state.tutorials = tutorials;
    },
    setTutorial(state, tutorial) {
      state.tutorial = tutorial;
    },
    setFilterCondition(state, filterCondition) {
      if (!["all", "published", "notPublished"].includes(filterCondition)) {
        return (state.filterCondition = "all");
      }
      state.filterCondition = filterCondition;
    },
    setCreateOrUpdateError(state, createOrUpdateError) {
      state.createOrUpdateError = createOrUpdateError;
    },
    // setSearchQueryTutorial(state, tutorial__searchQuery) {
    //   state.tutorial__searchQuery = tutorial__searchQuery;
    // },
  },
  actions: {
    async tutorialsList({ commit }) {
      try {
        const response = await axios.get(`http://${djangoOptions.host}:${djangoOptions.port}/api/v1/tutorials/`, {
          headers: {
            "Content-Type": "application/json",
          },
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
    async deleteTutorialItem({ commit, dispatch }, id) {
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
        dispatch("tutorialsList");
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
    async createTutorial({ commit }, newTutorial) {
      try {
        await axiosWithInterceptor.post(
          `http://${djangoOptions.host}:${djangoOptions.port}/api/v1/tutorials/`,
          newTutorial,
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

    // // DRF: class TutorialViewSet - def list(): GET tutorial which contains searched query
    // async getSearchedTutorial({ commit, state }) {
    //   await axiosWithInterceptor
    //     .get(`http://${process.env.server_HostPort_1}/api/tutorials/`, {
    //       headers: {
    //         "Content-Type": "application/json",
    //         Accept: "application/json",
    //       },
    //       params: {
    //         q: state.tutorial__searchQuery,
    //       },
    //     })
    //     .then((response) => {
    //       commit("setSingleAndSearchedTutorial", response.data.tutorial);
    //     })
    //     .catch((error) => {
    //       commit("setSingleAndSearchedTutorial", null);
    //       console.log(error.response.data.tutorial);
    //     });
    // },

    // // DRF: class TutorialDetailedViewSet - def update(): PUT a single tutorial
    // async putSingleTutorial({ commit, state, dispatch }, params) {
    //   await axiosWithInterceptor
    //     .put(`http://${process.env.server_HostPort_1}/api/tutorials/${params.id}/`, params.updateTutorial, {
    //       headers: {
    //         "Content-Type": "application/json",
    //         Accept: "application/json",
    //         Authorization: `Bearer ${localStorage.getItem("accessToken")}`,
    //       },
    //     })
    //     .then((response) => {
    //       commit("setTutorialPutError", null);
    //       dispatch("getSingleTutorial", params.id);
    //       router.push("/tutorials");
    //     })
    //     .catch((error) => {
    //       commit("setTutorialPutError", error.response.data);
    //       commit("setSingleAndSearchedTutorial", null);
    //     });
    // },
  },
};

export default tutorials;
