<template>
  <section class="my-signIn">
    <div class="mt-3 row">
      <div class="d-flex flex-column align-items-center">
        <form id="form-signIn" action="" class="col-lg-4 col-6" name="form-signIn">
          <fieldset class="form-group mb-3">
            <router-link to="/" class="d-flex justify-content-center align-items-center mb-3" title="Home page">
              <img
                src="@/assets/IMG/Vue3_logo.png"
                width="50"
                height="50"
                alt="Vue3 logo. Home page"
                title="Vue3 logo. Home page"
              />
            </router-link>
            <legend class="border-bottom mb-4 text-center"><b>SignIn!</b></legend>
            <div class="mb-3">
              <label for="username" class="form-label">Username</label>
              <input
                id="username"
                v-model="form.username"
                v-focusCustom
                type="text"
                name="username"
                class="form-control"
                placeholder="Username"
                aria-describedby="usernameHelp"
              />
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input
                id="password"
                v-model="form.password"
                type="password"
                name="password"
                class="form-control"
                placeholder="Password"
                aria-describedby="passwordHelp"
              />
            </div>
          </fieldset>
          <div class="d-flex justify-content-center">
            <button
              class="btn btn-outline-green-custom"
              type="submit"
              :disabled="btnSubmitDisabled"
              @click.prevent="signIn"
            >
              SignIn!
            </button>
          </div>
        </form>
        <p v-if="signInError" class="text-danger mt-3">{{ signInError }}</p>
      </div>
    </div>
  </section>
</template>

<script>
import { mapActions, mapState } from "vuex";

export default {
  name: "SignIn",
  data() {
    return {
      form: {
        username: "",
        password: "",
      },
    };
  },
  computed: {
    ...mapState({
      signInError: (state) => state.auth.signInError,
    }),
    btnSubmitDisabled() {
      return this.form.username && this.form.password ? false : true;
    },
  },
  methods: {
    ...mapActions({
      signInAction: "auth/signIn",
    }),
    async signIn() {
      await this.signInAction({ username: this.form.username, password: this.form.password });
    },
  },
};
</script>

<style scoped lang="scss"></style>
