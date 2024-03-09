<template>
    <section class="my-signUp">
        <div class="row mt-3">
            <div class="d-flex flex-column align-items-center">
                <!-- SignUp form -->
                <!-- SignUp form -->
                <!-- SignUp form -->
                <form action="" class="col-lg-4 col-6" id="form__signUp" name="form__signUp">
                    <fieldset class="form-group mb-3">
                        <router-link to="/" class="d-flex justify-content-center align-items-center mb-3" title="Home page">
                            <img src="@/assets/IMG/Vue3_logo.png" width="50" height="50" alt="Vue3 logo. Home page"
                                title="Vue3 logo. Home page" />
                        </router-link>
                        <legend class="border-bottom mb-4 text-center"><b>SignUp!</b></legend>
                        <div class="mb-3">
                            <label for="username" class="form-label">Username *</label>
                            <input v-customFocus type="text" name="username" id="username" class="form-control"
                                placeholder="Username" aria-describedby="usernameHelp" v-model="form.username"
                                @input="v$.form.username.$touch()">
                            <div v-if="v$.form.username.required.$invalid" class="text-secondary text-small">This field is
                                required.</div>
                            <div v-if="v$.form.username.maxLength.$invalid" class="text-danger text-small">Username should
                                not be longer than {{ v$.form.username.maxLength.$params.max }} symbols.</div>
                        </div>
                        <div class="mb-3">
                            <label for="first_name" class="form-label">First name</label>
                            <input type="text" name="first_name" id="first_name" class="form-control"
                                placeholder="First name" aria-describedby="first_nameHelp" v-model="form.first_name"
                                @input="v$.form.first_name.$touch()">
                            <div v-if="v$.form.first_name.onlyLetters.$invalid">
                                <span class="text-small text-danger">First name or last name should not contain any symbols
                                    except letters and should not be less than 2 symbols.</span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="last_name" class="form-label">Last name</label>
                            <input type="text" name="last_name" id="last_name" class="form-control" placeholder="Last name"
                                aria-describedby="last_nameHelp" v-model="form.last_name"
                                @input="v$.form.last_name.$touch()">
                            <div v-if="v$.form.last_name.onlyLetters.$invalid">
                                <span class="text-small text-danger">First name or last name should not contain any symbols
                                    except letters and should not be less than 2 symbols.</span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address *</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="Email address"
                                aria-describedby="emailHelp" v-model="form.email" @input.="v$.form.email.$touch()">
                            <div v-if="v$.form.email.required.$invalid">
                                <span class="text-small text-secondary">This field is required.</span>
                            </div>
                            <div v-if="v$.form.email.email.$invalid">
                                <span class="text-small text-danger">Invalid email address.</span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password *</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Password"
                                aria-describedby="passwordHelp" v-model="form.password" @input="v$.form.password.$touch()">
                            <div v-if="v$.form.password.required.$invalid">
                                <span class="text-small text-secondary">This field is required.</span>
                                <ul class="text-small text-secondary ps-3 mt-1">
                                    <li>At least <b>8 characters</b>;</li>
                                    <li>At least <b>one digit</b>;</li>
                                    <li>At least <b>one uppercase</b> character;</li>
                                    <li>At least <b>one lowercase</b> character;</li>
                                    <li>At least <b>one special</b> character:<br> [!#$%&?_-" ]</li>
                                </ul>
                            </div>
                            <div v-if="v$.form.password.validatePassword.$invalid">
                                <ul class="text-small text-danger ps-3 mt-2">
                                    <li>At least <b>8 characters</b>;</li>
                                    <li>At least <b>one digit</b>;</li>
                                    <li>At least <b>one uppercase</b> character;</li>
                                    <li>At least <b>one lowercase</b> character;</li>
                                    <li>At least <b>one special</b> character:<br> [!#$%&?_-" ]</li>
                                </ul>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="password2" class="form-label">Password confirmation *</label>
                            <input type="password" name="password2" id="password2" class="form-control"
                                placeholder="Password" aria-describedby="password2Help" v-model="form.password2"
                                @input="v$.form.password2.$touch()">
                            <div v-if="v$.form.password2.required.$invalid" class="text-secondary text-small">This field is
                                required.</div>
                        </div>
                    </fieldset>
                    <div class="d-flex justify-content-center">
                        <button class="btn btn-outline-custom-green" type="submit" :disabled="btnSubmitDisabled"
                            @click.prevent="signUp_">SignUp!</button>
                    </div>
                </form>
                <!-- form bottom -->
                <!-- form bottom -->
                <!-- form bottom -->
                <p class="text-center text-secondary mt-3" style="font-size: smaller">
                    <i>After a successful registration<br /> - redirected to main tutorials page.</i>
                </p>
                <div class="text-end mb-5">
                    <small class="text-muted">
                        Already registered? <router-link class="nav-link" to="/signin"
                            title="SignIn!"><b>SignIn!</b></router-link>
                    </small>
                </div>
                <!-- error block -->
                <!-- error block -->
                <!-- error block -->
                <p class="text-danger mt-3" v-if="RegError">{{ RegError }}</p>
            </div>
        </div>
    </section>
</template>

<script>
import axios from 'axios';
import { mapActions, mapGetters, mapMutations, mapState } from 'vuex';
import { useVuelidate } from '@vuelidate/core';
import { maxLength, minLength, required, helpers, email } from '@vuelidate/validators';
const onlyLetters = (value) => !helpers.req(value) || helpers.regex(/^[a-zA-Z]{2,}$/)(value);
const validatePassword = (value) => !helpers.req(value) || helpers.regex(/^.*(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!#$%&?_ \-"]).*$/)(value);
export default {
    name: 'SignUp__page',
    setup() {
        return {
            v$: useVuelidate()
        }
    },
    data() {
        return {
            form: {
                username: '',
                first_name: '',
                last_name: '',
                email: '',
                password: '',
                password2: ''
            },
            RegError: null
        }
    },
    validations() {
        return {
            form: {
                username: {
                    required,
                    maxLength: maxLength(100)
                },
                first_name: {
                    onlyLetters
                },
                last_name: {
                    onlyLetters
                },
                email: {
                    required,
                    email
                },
                password: {
                    required,
                    validatePassword
                },
                password2: {
                    required
                }
            }
        }
    },
    computed: {
        btnSubmitDisabled() {
            return this.v$.$invalid ? true : false
        }
    },
    methods: {
        ...mapActions({
            signIn: 'auth/signIn'
        }),
        async signUp_() {
            try {
                if (this.form.password !== this.form.password2) {
                    throw new Error('Passwords do not match!');
                } else {
                    this.RegError = null;
                    let newUser = new FormData();
                    newUser.append('username', this.form.username);
                    newUser.append('first_name', this.form.first_name);
                    newUser.append('last_name', this.form.last_name);
                    newUser.append('email', this.form.email);
                    newUser.append('password', this.form.password);
                    await axios.post(`http://${process.env.server_HostPort_1}/api/accounts/signup/`, newUser, {
                        headers: {
                            'Content-Type': 'application/json',
                            Accept: 'application/json',
                        }
                    }).then((response) => {
                        // signIn with username and password immediately!
                        this.signIn({ "username": this.form.username, "password": this.form.password });
                    }).catch((error) => {
                        this.RegError = error.message
                    });
                }
            } catch (error) {
                this.RegError = error.message
            }
        }
    }
}
</script>

<style scoped lang="scss"></style>