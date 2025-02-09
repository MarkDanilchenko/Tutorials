<template>
  <section class="my-newTutorial">
    <div class="row">
      <div class="d-flex flex-column justify-content-center align-items-center mt-5">
        <!-- addNewTutorial__form -->
        <!-- addNewTutorial__form -->
        <!-- addNewTutorial__form -->
        <form id="addNewTutorial__form" action="" class="col-lg-6 col-md-8 col-10" name="addNewTutorial__form">
          <fieldset class="form-group mb-3">
            <legend class="border-bottom text-center mb-3">Add new Tutorial</legend>
            <div class="mb-3">
              <label for="tutorialTitle" class="form-label"><b>Title: *</b></label>
              <input
                id="tutorialTitle"
                v-model="form.title"
                v-customFocus
                type="text"
                class="form-control"
                aria-describedby="tutorialTitleHelp"
                placeholder="Title of the tutorial..."
                @input="v$.form.title.$touch()"
              />
              />
              <div v-if="v$.form.title.required.$invalid" class="text-secondary text-small">
                This field is required.
              </div>
              <div v-if="v$.form.title.maxLength.$invalid" class="text-danger text-small">
                Title should not be longer than {{ v$.form.title.maxLength.$params.max }} symbols.
              </div>
            </div>
            <div class="mb-3">
              <label for="tutorialDescription" class="form-label"><b>Description: *</b></label>
              <textarea
                id="tutorialDescription"
                v-model="form.description"
                class="form-control"
                rows="5"
                cols="30"
                placeholder="Description of the tutorial..."
                @input="v$.form.description.$touch()"
              ></textarea>
              <div v-if="v$.form.description.required.$invalid" class="text-secondary text-small">
                This field is required.
              </div>
              <div v-if="v$.form.description.maxLength.$invalid" class="text-danger text-small">
                Description should not be longer than {{ v$.form.description.maxLength.$params.max }} symbols.
              </div>
            </div>
            <div class="form-check mb-3">
              <input
                id="isPublished"
                v-model="form.isPublished"
                type="checkbox"
                class="form-check-input"
                name="isPublished"
              />
              <label class="form-check-label" for="isPublished"><b>Published:</b></label>
            </div>
          </fieldset>
          <div class="d-flex justify-content-center align-items-center">
            <button
              class="btn btn-outline-green-custom"
              type="submit"
              :disabled="btnSubmitDisabled"
              @click.prevent="addNewTutorial"
            >
              Add new!
            </button>
          </div>
        </form>
        <!-- error block -->
        <!-- error block -->
        <!-- error block -->
        <div v-if="error" class="d-flex justify-content-center">
          <p class="text-danger mt-3">Error occurred: <br />"{{ error }}"</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapActions, mapGetters, mapMutations, mapState } from "vuex";
import { useVuelidate } from "@vuelidate/core";
import { maxLength, minLength, required, helpers } from "@vuelidate/validators";
export default {
  name: "NewTutorial__page",
  setup() {
    return {
      v$: useVuelidate(),
    };
  },
  data() {
    return {
      form: {
        title: "",
        description: "",
        isPublished: false,
      },
    };
  },
  validations() {
    return {
      form: {
        title: {
          required,
          maxLength: maxLength(100),
        },
        description: {
          required,
          maxLength: maxLength(1000),
        },
      },
    };
  },
  computed: {
    ...mapState({
      error: (state) => state.tutorials.tutorial__postError,
    }),
    btnSubmitDisabled() {
      return this.v$.$invalid ? true : false;
    },
  },
  methods: {
    ...mapActions({
      postTutorial: "tutorials/postTutorial",
    }),
    ...mapMutations({
      setTutorialPostError: "tutorials/setTutorialPostError",
    }),
    addNewTutorial() {
      const newTutorial = new FormData();
      newTutorial.append("title", this.form.title);
      newTutorial.append("description", this.form.description);
      newTutorial.append("published", this.form.isPublished);
      this.postTutorial(newTutorial);
    },
  },
  mounted() {
    this.setTutorialPostError(null);
  },
};
</script>

<style scoped lang="scss"></style>
