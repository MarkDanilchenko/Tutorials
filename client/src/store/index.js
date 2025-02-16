import { createStore } from "vuex";
import tutorials from "@/store/tutorials.js";
import auth from "@/store/auth.js";

export default createStore({
  state: () => ({}),
  getters: {},
  mutations: {},
  actions: {},
  modules: {
    tutorials,
    auth,
  },
});
