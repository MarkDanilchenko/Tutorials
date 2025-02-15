<template>
  <section class="my-signUp">
    <div class="row mt-3">
      <div class="d-flex flex-column align-items-center">
        <form id="form__signUp" action="" class="col-lg-4 col-6" name="form__signUp">
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
            <legend class="border-bottom mb-4 text-center"><b>SignUp!</b></legend>
            <div class="mb-3">
              <label for="username" class="form-label">Username *</label>
              <input
                id="username"
                v-model="form.username"
                v-focusCustom
                type="text"
                name="username"
                class="form-control"
                placeholder="Username"
                aria-describedby="usernameHelp"
                @input="v$.form.username.$touch()"
              />
              <div v-if="v$.form.username.required.$invalid" class="text-secondary text-small">
                This field is required.
              </div>
              <div v-if="v$.form.username.maxLength.$invalid" class="text-danger text-small">
                Username should not be longer than {{ v$.form.username.maxLength.$params.max }} symbols.
              </div>
            </div>
            <div class="mb-3">
              <label for="first_name" class="form-label">First name</label>
              <input
                id="first_name"
                v-model="form.first_name"
                type="text"
                name="first_name"
                class="form-control"
                placeholder="First name"
                aria-describedby="first_nameHelp"
                @input="v$.form.first_name.$touch()"
              />
              <div v-if="v$.form.first_name.onlyLetters.$invalid">
                <span class="text-small text-danger"
                  >First name or last name should not contain any symbols except letters and should not be less than 2
                  symbols.</span
                >
              </div>
            </div>
            <div class="mb-3">
              <label for="last_name" class="form-label">Last name</label>
              <input
                id="last_name"
                v-model="form.last_name"
                type="text"
                name="last_name"
                class="form-control"
                placeholder="Last name"
                aria-describedby="last_nameHelp"
                @input="v$.form.last_name.$touch()"
              />
              <div v-if="v$.form.last_name.onlyLetters.$invalid">
                <span class="text-small text-danger"
                  >First name or last name should not contain any symbols except letters and should not be less than 2
                  symbols.</span
                >
              </div>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email address *</label>
              <input
                id="email"
                v-model="form.email"
                type="email"
                name="email"
                class="form-control"
                placeholder="Email address"
                aria-describedby="emailHelp"
                @input="v$.form.email.$touch()"
              />
              <div v-if="v$.form.email.required.$invalid">
                <span class="text-small text-secondary">This field is required.</span>
              </div>
              <div v-if="v$.form.email.email.$invalid">
                <span class="text-small text-danger">Invalid email address.</span>
              </div>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password *</label>
              <input
                id="password"
                v-model="form.password"
                type="password"
                name="password"
                class="form-control"
                placeholder="Password"
                aria-describedby="passwordHelp"
                @input="v$.form.password.$touch()"
              />
              <div v-if="v$.form.password.required.$invalid">
                <span class="text-small text-secondary">This field is required.</span>
                <ul class="text-small text-secondary ps-3 mt-1">
                  <li>At least <b>8 characters</b>;</li>
                  <li>At least <b>one digit</b>;</li>
                  <li>At least <b>one uppercase</b> character;</li>
                  <li>At least <b>one lowercase</b> character;</li>
                  <li>
                    At least <b>one special</b> character:<br />
                    [!#$%&?_-" ]
                  </li>
                </ul>
              </div>
              <div v-if="v$.form.password.passwordValidation.$invalid">
                <ul class="text-small text-danger ps-3 mt-2">
                  <li>At least <b>8 characters</b>;</li>
                  <li>At least <b>one digit</b>;</li>
                  <li>At least <b>one uppercase</b> character;</li>
                  <li>At least <b>one lowercase</b> character;</li>
                  <li>
                    At least <b>one special</b> character:<br />
                    [!#$%&?_-" ]
                  </li>
                </ul>
              </div>
            </div>
            <div class="mb-3">
              <label for="passwordConfirmation" class="form-label">Password confirmation *</label>
              <input
                id="passwordConfirmation"
                v-model="form.passwordConfirmation"
                type="password"
                name="passwordConfirmation"
                class="form-control"
                placeholder="Password"
                aria-describedby="passwordConfirmationHelp"
                @input="v$.form.passwordConfirmation.$touch()"
              />
              <div v-if="v$.form.passwordConfirmation.required.$invalid" class="text-secondary text-small">
                This field is required.
              </div>
            </div>
          </fieldset>
          <div class="d-flex justify-content-center">
            <button
              class="btn btn-outline-green-custom"
              type="submit"
              :disabled="btnSubmitDisabled"
              @click.prevent="signUp"
            >
              SignUp!
            </button>
          </div>
        </form>
        <div class="d-flex justify-content-center flex-column align-items-end mt-2 mb-5">
          <small class="text-muted"> Already registered? </small>
          <router-link class="nav-link" to="/signin" title="SignIn!"><b>SignIn!</b></router-link>
        </div>
        <p v-if="signUpError" class="text-danger mt-3">{{ signUpError }}</p>
      </div>
    </div>
  </section>
</template>

<script>
import { useVuelidate } from "@vuelidate/core";
import { mapActions, mapMutations, mapState } from "vuex";
import { maxLength, required, helpers, email } from "@vuelidate/validators";

const onlyLetters = (value) => !helpers.req(value) || helpers.regex(/^[a-zA-Z]{2,}$/)(value);
const passwordValidation = (value) =>
  !helpers.req(value) || helpers.regex(/^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!#$%&?_ \-"]).*$/)(value);

export default {
  name: "SignUp",
  setup() {
    return {
      v$: useVuelidate(),
    };
  },
  data() {
    return {
      form: {
        username: "",
        first_name: "",
        last_name: "",
        email: "",
        password: "",
        passwordConfirmation: "",
      },
    };
  },
  validations() {
    return {
      form: {
        username: {
          required,
          maxLength: maxLength(100),
        },
        first_name: {
          onlyLetters,
        },
        last_name: {
          onlyLetters,
        },
        email: {
          required,
          email,
        },
        password: {
          required,
          passwordValidation,
        },
        passwordConfirmation: {
          required,
        },
      },
    };
  },
  computed: {
    ...mapState({
      signUpError: (state) => state.auth.signUpError,
    }),
    btnSubmitDisabled() {
      return this.v$.$invalid ? true : false;
    },
  },
  methods: {
    ...mapActions({
      signInAction: "auth/signIn",
      signUpAction: "auth/signUp",
    }),
    ...mapMutations({
      setSignUpError: "auth/setSignUpError",
    }),
    async signUp() {
      if (this.form.password !== this.form.passwordConfirmation) {
        return this.setSignUpError("Password confirmation failed!");
      }

      await this.signUpAction({
        username: this.form.username,
        first_name: this.form.first_name,
        last_name: this.form.last_name,
        email: this.form.email,
        password: this.form.password,
      }).then(async () => {
        await this.signInAction({ username: this.form.username, password: this.form.password });
      });
    },
  },
};
</script>

<style scoped lang="scss">
p {
  font-size: smaller;
}
</style>
