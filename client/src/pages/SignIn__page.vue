<template>
    <section class="my-signIn">
        <div class="mt-3 row">
            <div class="d-flex flex-column align-items-center">
                <form action="" class="col-lg-4 col-6" id="form-signIn" name="form-signIn">
                    <fieldset class="form-group mb-3">
                        <router-link to="/" class="d-flex justify-content-center align-items-center mb-3" title="Home page">
                            <img src="@/assets/IMG/Vue3_logo.png" width="50" height="50" alt="Vue3 logo. Home page"
                                title="Vue3 logo. Home page" />
                        </router-link>
                        <legend class="border-bottom mb-4 text-center"><b>SignIn!</b></legend>
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input v-customFocus type="text" name="username" id="username" class="form-control"
                                placeholder="Username" aria-describedby="usernameHelp" v-model="form.username">
                            <div id="usernameHelp" class="form-text text-small">Enter your username.</div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Password"
                                aria-describedby="passwordHelp" v-model="form.password">
                            <div id="passwordHelp" class="form-text text-small">Enter your password.</div>
                        </div>
                    </fieldset>
                    <div class="d-flex justify-content-center">
                        <button class="btn btn-outline-custom-green" type="submit" :disabled="btnSubmitDisabled"
                            @click.prevent="signIn_">SignIn!</button>
                    </div>
                </form>
                <!-- error block -->
                <!-- error block -->
                <!-- error block -->
                <p class="text-danger mt-3" v-if="authError">{{ authError }}</p>
                <!-- form bottom -->
                <!-- form bottom -->
                <!-- form bottom -->
                <p class="text-center text-secondary mt-3" style="font-size: smaller">
                    <i>After a successful authentication<br /> - redirected to home page.</i>
                </p>
            </div>
        </div>
    </section>
</template>

<script>
import { mapActions, mapGetters, mapMutations, mapState } from 'vuex';
export default {
    name: 'SignIn__page',
    data() {
        return {
            form: {
                username: '',
                password: ''
            },
        }
    },
    computed: {
        ...mapState({
            authError: state => state.auth.authError,
        }),
        btnSubmitDisabled() {
            return (this.form.username && this.form.password) ? false : true
        }
    },
    methods: {
        ...mapActions({
            signIn: 'auth/signIn'
        }),
        signIn_() {
            this.signIn({ "username": this.form.username, "password": this.form.password })
        }
    }
}
</script>

<style scoped lang="scss"></style>