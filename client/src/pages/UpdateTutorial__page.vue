<template>
    <section class="my-updateTutorial">
        <div class="row">
            <div class="d-flex flex-column justify-content-center align-items-center mt-5">
                <!-- updateTutorial__form -->
                <!-- updateTutorial__form -->
                <!-- updateTutorial__form -->
                <form action="" class="col-lg-6 col-md-8 col-10" name="updateTutorial__form" id="updateTutorial__form">
                    <fieldset class="form-group mb-3">
                        <legend class="border-bottom text-center mb-3">Tutorial Update</legend>
                        <div class="mb-3">
                            <label for="tutorialTitle" class="form-label"><b>Title: *</b></label>
                            <input type="text" class="form-control" id="tutorialTitle" aria-describedby="tutorialTitleHelp"
                                placeholder="Title of the tutorial..." v-model="form.title" @input="v$.form.title.$touch()">
                            <div v-if="v$.form.title.required.$invalid" class="text-secondary text-small">This field is
                                required.</div>
                            <div v-if="v$.form.title.maxLength.$invalid" class="text-danger text-small">Title should not be
                                longer than
                                {{
                                    v$.form.title.maxLength.$params.max }} symbols.</div>
                        </div>
                        <div class="mb-3">
                            <label for="tutorialDescription" class="form-label"><b>Description: *</b></label>
                            <textarea class="form-control" id="tutorialDescription" rows="5" cols="30"
                                placeholder="Description of the tutorial..." v-model="form.description"
                                @input="v$.form.description.$touch()"></textarea>
                            <div v-if="v$.form.description.required.$invalid" class="text-secondary text-small">This field
                                is
                                required.</div>
                            <div v-if="v$.form.description.maxLength.$invalid" class="text-danger text-small">Description
                                should
                                not be longer than {{ v$.form.description.maxLength.$params.max }} symbols.</div>
                        </div>
                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" name="isPublished" id="isPublished"
                                v-model="form.isPublished">
                            <label class="form-check-label" for="isPublished"><b>Published:</b></label>
                        </div>
                    </fieldset>
                    <div class="d-flex justify-content-center align-items-center">
                        <button class="btn btn-outline-custom-green" type="submit" :disabled="btnSubmitDisabled"
                            @click.prevent="updateTutorial(this.$route.params.id)">Update!</button>
                    </div>
                </form>
                <!-- form bottom -->
                <!-- form bottom -->
                <!-- form bottom -->
                <div class="mt-5">
                    <p class="text-center text-muted text-small">
                        <i>Redirect to Tutorials page after creating.</i>
                    </p>
                </div>
                <!-- error block -->
                <!-- error block -->
                <!-- error block -->
                <div v-if="error" class="d-flex justify-content-center">
                    <p class="text-danger mt-3">Error occurred: <br>"{{ error }}"</p>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { mapActions, mapGetters, mapMutations, mapState } from 'vuex';
import { useVuelidate } from '@vuelidate/core';
import { maxLength, minLength, required, helpers } from '@vuelidate/validators';
import axios from 'axios';
export default {
    name: 'UpdateTutorial__page',
    setup() {
        return {
            v$: useVuelidate()
        }
    },
    data() {
        return {
            form: {
                title: '',
                description: '',
                isPublished: false
            }
        }
    },
    validations() {
        return {
            form: {
                title: {
                    required,
                    maxLength: maxLength(100)
                },
                description: {
                    required,
                    maxLength: maxLength(1000)
                }
            }
        }

    },
    computed: {
        ...mapState({
            error: state => state.tutorials.tutorial__putError
        }),
        btnSubmitDisabled() {
            return this.v$.$invalid ? true : false
        }
    },
    methods: {
        ...mapActions({
            putSingleTutorial: 'tutorials/putSingleTutorial'
        }),
        ...mapMutations({
            setTutorialPutError: 'tutorials/setTutorialPutError'
        }),
        updateTutorial(id) {
            let updateTutorial = new FormData();
            updateTutorial.append('title', this.form.title);
            updateTutorial.append('description', this.form.description);
            updateTutorial.append('published', this.form.isPublished);
            this.putSingleTutorial({ "id": id, "updateTutorial": updateTutorial });
        },
        async getTutorialForFormFill(id) {
            await axios.get(`http://${process.env.server_HostPort_1}/api/tutorials/${id}`, {
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                }
            }).then((response) => {
                this.form.title = response.data.tutorial.title;
                this.form.description = response.data.tutorial.description;
                this.form.isPublished = response.data.tutorial.published;
            }).catch((error) => {
                console.log(error.message);
            });
        },
    },
    mounted() {
        this.getTutorialForFormFill(this.$route.params.id);
        this.setTutorialPutError(null);
    },
}

</script>

<style scoped lang="scss"></style>